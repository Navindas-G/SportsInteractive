//
//  TeamIndModel.swift
//  SportInteractive
//
//  Created by Navindas Ghadge on 02/10/23.
//

import Foundation

struct TeamInfoModel: Decodable {
    let fullName: String?
    let shortName: String?
    let players: [String: PlayerInfoModel]?
    
}
