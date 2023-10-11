//
//  OfficialsModel.swift
//  SportInteractive
//
//  Created by Navindas Ghadge on 02/10/23.
//

import Foundation

struct OfficialsModel: Decodable {
    /*
     "Umpires": "Nigel Llong (ENG),Chris Brown (NZ) and Shaun George (SA)",
     "Referee": "David Boon (AUS)",
     */
    
    let umpires: String?
    let referee: String?
    
    enum OfficialModelKey: String, CodingKey {
        case umpires = "Umpires"
        case referee = "Referee"
    }
    
    init(from decoder: Decoder) throws {
        let values = try? decoder.container(keyedBy: OfficialModelKey.self)
        
        self.umpires = try? values?.decodeIfPresent(String.self, forKey: .umpires)
        self.referee = try? values?.decodeIfPresent(String.self, forKey: .referee)
    }
}
