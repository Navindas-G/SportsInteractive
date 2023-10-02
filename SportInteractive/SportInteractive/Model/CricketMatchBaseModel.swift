//
//  CricketMatchBaseModel.swift
//  SportInteractive
//
//  Created by Navindas Ghadge on 01/10/23.
//

import Foundation


struct CricketMatchBaseModel: Decodable {
    
    /*
     "Matchdetail"
     "Nuggets"
     "Innings"
     "Teams"
     "Notes"
     */
    
    let matchDetail: CricketMatchDetailModel?
    let nuggets: [String]?
    let innings: [InningsModel]?
    let teams: [String:TeamInfoModel]?
    let notes: MatchNotesModel?
}
