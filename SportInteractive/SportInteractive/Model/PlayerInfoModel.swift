//
//  PlayerInfoModel.swift
//  SportInteractive
//
//  Created by Navindas Ghadge on 02/10/23.
//

import Foundation

struct PlayerInfoModel {
    let id: String?
    let teamFullName: String?
    let teamShortName: String?
    let position: String?
    let fullName: String?
    let isCaptain: Bool?
    let isKeeper: Bool?
    let battingStyle: BattingStyleModel?
    let bowlingStyle: BowlingStyleModel?
}
