import Foundation

struct PersonalLosses: Codable {
    
    let date: String
    let day: Int
    let personnel: Int
    let personnelString: String
    let pow: Int?
    
    private enum CodingKeys: String, CodingKey {
        case date, day, personnel
        case personnelString = "personnel*"
        case pow = "POW"
    }
}
