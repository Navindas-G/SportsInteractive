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
    let teams: [String:Any]?
    let notes: MatchNotesModel?
    
    enum CricketMatchBaseModelKey: String, CodingKey {
        case matchDetail = "Matchdetail"
        case nuggets = "Nuggets"
        case innings = "Innings"
        case teams = "Teams"
        case notes = "Notes"
    }
    
    init(from decoder: Decoder) throws {
        let container = try? decoder.container(keyedBy: CricketMatchBaseModelKey.self)
        self.matchDetail = try? container?.decodeIfPresent(CricketMatchDetailModel.self, forKey: .matchDetail)
        self.nuggets = try? container?.decodeIfPresent([String].self, forKey: .nuggets)
        self.innings = try? container?.decodeIfPresent([InningsModel].self, forKey: .innings)
        self.teams = try? container?.decodeIfPresent([String:Any].self, forKey: .teams)
        self.notes = try? container?.decodeIfPresent(MatchNotesModel.self, forKey: .notes)
    }
}
