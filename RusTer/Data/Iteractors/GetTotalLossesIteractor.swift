import Foundation

protocol GetTotalLossesIteractorProtocol {
    func fetchTotalData(completion: @escaping (Result<[TotalLosses], Error>) -> Void)
}

class GetTotalLossesIteractor: GetTotalLossesIteractorProtocol {
    
    private let provider: ProviderProtocol
    private let mapper: TotalLossesMapperProtocol
    
    init(provider: ProviderProtocol, mapper: TotalLossesMapperProtocol) {
        self.provider = provider
        self.mapper = mapper
    }
    
    func fetchTotalData(completion: @escaping (Result<[TotalLosses], Error>) -> Void) {
        let queue = DispatchQueue(label: Constants.Queues.Label.TotalData,
                                  attributes: .concurrent)
        
        queue.async {
            let group = DispatchGroup()
            
            var personalLose: [PersonalLosses]?
            var equipLose: [EquipmentLosses]?
            
            group.enter()
            self.provider.fetchPersonnalLosses { result in
                switch result {
                case .success(let persLose):
                    personalLose = persLose
                case .failure(let error):
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                }
                group.leave()
            }
            
            group.enter()
            self.provider.fetchEquipmentLosses { result in
                switch result {
                case .success(let equipLoseData):
                    equipLose = equipLoseData
                case .failure(let error):
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                }
                group.leave()
            }
            
            group.wait()
            
            
            if let personalLose = personalLose, let equipLose = equipLose {
                let totalLose = self.mapper.mapToTotalLosses(from: personalLose, equipmentLosses: equipLose)
                DispatchQueue.main.async {
                    completion(.success(totalLose))
                }
            }
        }
    }
}
