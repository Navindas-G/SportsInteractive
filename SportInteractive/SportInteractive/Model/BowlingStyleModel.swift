//
//  BowlingStyleModel.swift
//  SportInteractive
//
//  Created by Navindas Ghadge on 02/10/23.
//

import Foundation

struct BowlingStyleModel: Decodable {
    /*
     "Style": "",
     "Average": "0",
     "Economyrate": "0",
     "Wickets": "0",
     */
    
    let style: String?
    let average: String?
    let economyRate: String?
    let wickets: String?
    
    enum BowlingStyleModelKey: String, CodingKey {
        case style = "Style"
        case average = "Average"
        case economyRate = "Economyrate"
        case wickets = "Wickets"
    }
    
    init(from decoder: Decoder) throws {
        let values = try? decoder.container(keyedBy: BowlingStyleModelKey.self)
        
        self.style = try? values?.decodeIfPresent(String.self, forKey: .style)
        self.average = try? values?.decodeIfPresent(String.self, forKey: .average)
        self.economyRate = try? values?.decodeIfPresent(String.self, forKey: .economyRate)
        self.wickets = try? values?.decodeIfPresent(String.self, forKey: .wickets)
    }
}
