//
//  CricketMatchModel.swift
//  SportInteractive
//
//  Created by Navindas Ghadge on 01/10/23.
//

import Foundation


struct CricketMatchModel: Decodable {
    /*
     "Livecoverage": "yes",
     "Id": "187360",
     "Code": "nzin01312019187360",
     "League": "icc",
     "Number": "4th ODI",
     "Type": "ODI",
     "Date": "1/31/2019",
     "Time": "15:00",
     "Offset": "+13:00",
     "Daynight": "yes",
     */
    
    let liveCoverage: String?
    let id: String?
    let code: String?
    let league: String?
    let number: String?
    let type: String?
    let date: String?
    let time: String?
    let offset: String?
    let dayNight: String?
    
    enum CricketMatchKeys: String, CodingKey {
        case liveCoverage = "Livecoverage"
        case id = "Id"
        case code = "Code"
        case league = "League"
        case number = "Number"
        case type = "Type"
        case date = "Date"
        case time = "Time"
        case offset = "Offset"
        case dayNight = "Daynight"
    }
    
    init(from decoder: Decoder) throws {
        let values = try? decoder.container(keyedBy: CricketMatchKeys.self)
        
        liveCoverage = try? values?.decodeIfPresent(String.self, forKey: .liveCoverage)
        id = try? values?.decodeIfPresent(String.self, forKey: .id)
        code = try? values?.decodeIfPresent(String.self, forKey: .code)
        league = try? values?.decodeIfPresent(String.self, forKey: .league)
        number = try? values?.decodeIfPresent(String.self, forKey: .number)
        type = try? values?.decodeIfPresent(String.self, forKey: .type)
        date = try? values?.decodeIfPresent(String.self, forKey: .date)
        time = try? values?.decodeIfPresent(String.self, forKey: .time)
        offset = try? values?.decodeIfPresent(String.self, forKey: .offset)
        dayNight = try? values?.decodeIfPresent(String.self, forKey: .dayNight)
    }
}
