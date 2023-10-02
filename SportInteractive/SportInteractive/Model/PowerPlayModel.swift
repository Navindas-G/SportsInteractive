//
//  PowerPlayModel.swift
//  SportInteractive
//
//  Created by Navindas Ghadge on 02/10/23.
//

import Foundation

struct PowerPlayModel: Decodable {
    /*
     "PP1": "1-10",
     "PP2": "11-40",
     */
    
    let pp1: String?
    let pp2: String?
    
    enum PowerPlayModelKey: String, CodingKey {
        case pp1 = "PP1"
        case pp2 = "PP2"
    }
    
    init(from decoder: Decoder) throws {
        let values = try? decoder.container(keyedBy: PowerPlayModelKey.self)
        
        self.pp1 = try? values?.decodeIfPresent(String.self, forKey: .pp1)
        self.pp2 = try? values?.decodeIfPresent(String.self, forKey: .pp2)
    }
}
