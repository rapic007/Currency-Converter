import UIKit

struct Currency: Decodable {
    let curAbbreviation: String
    let curScale: Int
    let curName: String
    let curOfficialRate: Double
    
    enum CodingKeys: String, CodingKey {
        case curAbbreviation = "Cur_Abbreviation"
        case curScale = "Cur_Scale"
        case curName = "Cur_Name"
        case curOfficialRate = "Cur_OfficialRate"
    }
}

