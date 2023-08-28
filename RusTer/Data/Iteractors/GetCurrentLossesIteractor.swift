import Foundation

protocol GetCurrentLossesIteractorProtocol {
    func fetchCurrentLoseData(completion: @escaping (Result<TotalLosses, Error>) -> Void)
}

enum CurrentLossError: String, Error {
    case currentLossDontExit = "Current lose doesn`t exist"
}

class GetCurrentLossesIteractor: GetCurrentLossesIteractorProtocol {
    
    private let totalLoseIteractor: GetTotalLossesIteractorProtocol
    
    init(totalLoseIteractor: GetTotalLossesIteractorProtocol) {
        self.totalLoseIteractor = totalLoseIteractor
    }
    
    func fetchCurrentLoseData(completion: @escaping (Result<TotalLosses, Error>) -> Void) {
        totalLoseIteractor.fetchTotalData { result in
            switch result {
            case .success(let totalLose):
                if let last = totalLose.last {
                    completion(.success(last))
                } else {
                    completion(.failure(CurrentLossError.currentLossDontExit))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
