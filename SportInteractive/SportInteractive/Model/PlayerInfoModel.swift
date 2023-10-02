//
//  PlayerInfoModel.swift
//  SportInteractive
//
//  Created by Navindas Ghadge on 02/10/23.
//

import Foundation

struct PlayerInfoModel: Decodable {
    /*
     "Position": "5",
     "Name_Full": "Dinesh Karthik",
     "Iscaptain": true,
     "Iskeeper": true,
     "Batting"
     "Bowling"
     */
    
    let position: String?
    let fullName: String?
    let isCaptain: Bool?
    let isKeeper: Bool?
    let battingStyle: BattingStyleModel?
    let bowlingStyle: BowlingStyleModel?
}
