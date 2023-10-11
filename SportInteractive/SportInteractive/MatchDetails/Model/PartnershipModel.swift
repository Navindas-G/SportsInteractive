//
//  PartnershipModel.swift
//  SportInteractive
//
//  Created by Navindas Ghadge on 02/10/23.
//

import Foundation

struct PartnershipModel: Decodable {
    
    /*
     "Runs": "12",
     "Balls": "10",
     "Batsmen": [
       {
         "Batsman": "65867",
         "Runs": "5",
         "Balls": "5"
       },
       {
         "Batsman": "9844",
         "Runs": "6",
         "Balls": "5"
       }
     ],
     */
    
    let runs: String?
    let balls: String?
    let batsmen: [BatsmenPartnershipModel]?
    
    enum PartnershipModelKey: String, CodingKey {
        case run = "Runs"
        case balls = "Balls"
        case batsmen = "Batsmen"
    }
    
    init(from decoder: Decoder) throws {
        let values = try? decoder.container(keyedBy: PartnershipModelKey.self)
        
        self.runs = try? values?.decodeIfPresent(String.self, forKey: .run)
        self.balls = try? values?.decodeIfPresent(String.self, forKey: .balls)
        self.batsmen = try? values?.decodeIfPresent([BatsmenPartnershipModel].self, forKey: .batsmen)
    }
}
