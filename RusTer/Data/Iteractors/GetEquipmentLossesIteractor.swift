import Foundation

protocol GetEquipmentLossesIteractorProtocol {
    func fetchEquipmentLossesData(completion: @escaping (Result<[TotalEquipmentLosses], Error>) -> Void)
}

class GetEquipmentLossesIteractor: GetEquipmentLossesIteractorProtocol {
    
    private let provider: ProviderProtocol
    
    init(provider: ProviderProtocol) {
        self.provider = provider
    }
    
    func fetchEquipmentLossesData(completion: @escaping (Result<[TotalEquipmentLosses], Error>) -> Void) {
        provider.fetchTotalEquipmentLosses { result in
            switch result {
            case .success(let lose):
                completion(.success(lose))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
}
