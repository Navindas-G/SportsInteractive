//
//  BattingStyleModel.swift
//  SportInteractive
//
//  Created by Navindas Ghadge on 02/10/23.
//

import Foundation

struct BattingStyleModel: Decodable {
    /*
     "Style": "RHB",
     "Average": "31.03",
     "Strikerate": "73.7",
     "Runs": "1738",
     */
    
    let style: String?
    let average: String?
    let strikerRate: String?
    let runs: String?
    
    enum BattingStyleModelKey: String, CodingKey {
        case style = "Style"
        case average = "Average"
        case strikerRate = "Strikerate"
        case runs = "Runs"
    }
    
    init(from decoder: Decoder) throws {
        let values = try? decoder.container(keyedBy: BattingStyleModelKey.self)
        
        self.style = try? values?.decodeIfPresent(String.self, forKey: .style)
        self.average = try? values?.decodeIfPresent(String.self, forKey: .average)
        self.strikerRate = try? values?.decodeIfPresent(String.self, forKey: .strikerRate)
        self.runs = try? values?.decodeIfPresent(String.self, forKey: .runs)
    }
}
