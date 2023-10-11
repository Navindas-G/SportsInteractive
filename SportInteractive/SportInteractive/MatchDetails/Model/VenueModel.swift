//
//  VenueModel.swift
//  SportInteractive
//
//  Created by Navindas Ghadge on 02/10/23.
//

import Foundation

struct VenueModel: Decodable {
    /*
     "Id": "170",
     "Name": "Seddon Park, Hamilton",
     */
    
    let id: String?
    let name: String?
    
    enum VenueModelKey: String, CodingKey {
        case id = "Id"
        case name = "Name"
    }
    
    init(from decoder: Decoder) throws {
        let values = try? decoder.container(keyedBy: VenueModelKey.self)
        self.id = try? values?.decodeIfPresent(String.self, forKey: .id)
        self.name = try? values?.decodeIfPresent(String.self, forKey: .name)
    }
}
