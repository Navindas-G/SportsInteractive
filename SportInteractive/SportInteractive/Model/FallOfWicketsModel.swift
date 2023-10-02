//
//  FallOfWicketsModel.swift
//  SportInteractive
//
//  Created by Navindas Ghadge on 02/10/23.
//

import Foundation

struct FallOfWicketsModel: Decodable {
    /*
     "Batsman": "3722",
     "Score": "21",
     "Overs": "5.5",
     */
    
    let batsman: String?
    let score: String?
    let overs: String?
    
    enum FallOfWicketsModelKey: String, CodingKey {
        case batsman = "Batsman"
        case score = "Score"
        case overs = "Overs"
    }
    
    init(from decoder: Decoder) throws {
        let values = try? decoder.container(keyedBy: FallOfWicketsModelKey.self)
        
        self.batsman = try? values?.decodeIfPresent(String.self, forKey: .batsman)
        self.score = try? values?.decodeIfPresent(String.self, forKey: .score)
        self.overs = try? values?.decodeIfPresent(String.self, forKey: .overs)
    }
}
