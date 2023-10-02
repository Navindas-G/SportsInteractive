//
//  BatsmenPartnershipModel.swift
//  SportInteractive
//
//  Created by Navindas Ghadge on 02/10/23.
//

import Foundation

struct BatsmenPartnershipModel: Decodable {
    /*
     "Batsman": "65867",
     "Runs": "5",
     "Balls": "5",
     */
    
    let batsman: String?
    let runs: String?
    let balls: String?
    
    enum BatsmenPartnershipModelKey: String, CodingKey {
        case batsman = "Batsman"
        case runs = "Runs"
        case balls = "Balls"
    }
    
    init(from decoder: Decoder) throws {
        let values = try? decoder.container(keyedBy: BatsmenPartnershipModelKey.self)
        
        self.batsman = try? values?.decodeIfPresent(String.self, forKey: .batsman)
        self.runs = try? values?.decodeIfPresent(String.self, forKey: .runs)
        self.balls = try? values?.decodeIfPresent(String.self, forKey: .balls)
    }
}
