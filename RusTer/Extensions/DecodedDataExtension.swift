import Foundation

enum DecodeError: String, Error {
    case decodingFailed = "Decoder Error"
}

extension JSONDecoder {
    func decodeData<T: Decodable>(_ type: T.Type, from jsonData: Data) throws -> T {
        do {
            let decodedData = try self.decode(type, from: jsonData)
            return decodedData
           } catch {
            throw DecodeError.decodingFailed
            }
    }
}
