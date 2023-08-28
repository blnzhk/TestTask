import Foundation

protocol ProviderProtocol {
    func fetchPersonnalLosses(completion: @escaping (Result<[PersonalLosses], Error>) -> Void)
    func fetchEquipmentLosses(completion: @escaping (Result<[EquipmentLosses], Error>) -> Void)
    func fetchTotalEquipmentLosses(completion: @escaping (Result<[TotalEquipmentLosses], Error>) -> Void)
}

class DataProvider: ProviderProtocol {
    
    func fetchPersonnalLosses(completion: @escaping (Result<[PersonalLosses], Error>) -> Void) {
        fetchLosses(fileName: Constants.Json.FileName.Personnal,
                    completion: completion)
    }
    
    func fetchEquipmentLosses(completion: @escaping (Result<[EquipmentLosses], Error>) -> Void) {
        fetchLosses(fileName: Constants.Json.FileName.EquipmentLosses, completion: completion)
    }
    
    func fetchTotalEquipmentLosses(completion: @escaping (Result<[TotalEquipmentLosses], Error>) -> Void) {
        fetchLosses(fileName: Constants.Json.FileName.TotalEquipmentLosses, completion: completion)
    }
    
    
    private func fetchLosses<T: Decodable>(fileName: String, completion: @escaping (Result<[T], Error>) -> Void) {
        guard let data = readLocalJsonFile(forName: fileName) else { return }
        do {
            let readyData = try JSONDecoder().decodeData([T].self, from: data)
            completion(.success(readyData))
        } catch {
            completion(.failure(error))
        }
    }
    
    private func readLocalJsonFile(forName name: String) -> Data? {
        do {
            if let filePath = Bundle.main.path(forResource: name, ofType: Constants.Json.OfType) {
                let fileURL = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileURL)
                return data
            }
        } catch {
            print("Error")
        }
        return nil
    }    
}
