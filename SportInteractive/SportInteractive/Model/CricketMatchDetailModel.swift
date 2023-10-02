//
//  CricketMatchDetailModel.swift
//  SportInteractive
//
//  Created by Navindas Ghadge on 02/10/23.
//

import Foundation

struct CricketMatchDetailModel: Decodable {
    /*
     "Team_Home": "5",
     "Team_Away": "4",
     "Match": {
       "Livecoverage": "yes",
       "Id": "187360",
       "Code": "nzin01312019187360",
       "League": "icc",
       "Number": "4th ODI",
       "Type": "ODI",
       "Date": "1/31/2019",
       "Time": "15:00",
       "Offset": "+13:00",
       "Daynight": "yes"
     },
     "Series": {
       "Id": "3068",
       "Name": "India in New Zealand, 5 ODI Series, 2019",
       "Status": "India lead the 5 ODI series 3-1",
       "Tour": "956",
       "Tour_Name": "India tour of New Zealand, 2019"
     },
     "Venue": {
       "Id": "170",
       "Name": "Seddon Park, Hamilton"
     },
     "Officials": {
       "Umpires": "Nigel Llong (ENG),Chris Brown (NZ) and Shaun George (SA)",
       "Referee": "David Boon (AUS)"
     },
     "Weather": "Sunny",
     "Tosswonby": "5",
     "Status": "Match Ended",
     "Status_Id": "114",
     "Player_Match": "Trent Boult",
     "Result": "New Zealand beat India by 8 wickets",
     "Winningteam": "5",
     "Winmargin": "8 wickets",
     "Equation": "New Zealand beat India by 8 wickets",
     */
    
    let teamHome: String?
    let teamAway: String?
    let match: CricketMatchModel?
    let series: SeriesModel?
    let venue: VenueModel?
    let officials: OfficialsModel?
    let weather: String?
    let tossWonBy: String?
    let status: String?
    let statusId: String?
    let playerMatch: String?
    let result: String?
    let winningTeam: String?
    let winMargin: String?
    let equation: String?
    
    
    enum CricketMatchBaseModelKey: String, CodingKey {
        case teamHome = "Team_Home"
        case teamAway = "Team_Away"
        case match = "Match"
        case series = "Series"
        case venue = "Venue"
        case officials = "Officials"
        case weather = "Weather"
        case tossWonBy = "Tosswonby"
        case status = "Status"
        case statusId = "Status_Id"
        case playerMatch = "Player_Match"
        case result = "Result"
        case winningTeam = "Winningteam"
        case winMargin = "Winmargin"
        case equation = "Equation"
    }
    
    init(from decoder: Decoder) throws {
        let container = try? decoder.container(keyedBy: CricketMatchBaseModelKey.self)
        self.teamHome = try? container?.decodeIfPresent(String.self, forKey: .teamHome)
        self.teamAway = try? container?.decodeIfPresent(String.self, forKey: .teamAway)
        self.match = try? container?.decodeIfPresent(CricketMatchModel.self, forKey: .match)
        self.series = try? container?.decodeIfPresent(SeriesModel.self, forKey: .series)
        self.venue = try? container?.decodeIfPresent(VenueModel.self, forKey: .venue)
        self.officials = try? container?.decodeIfPresent(OfficialsModel.self, forKey: .officials)
        self.weather = try? container?.decodeIfPresent(String.self, forKey: .weather)
        self.tossWonBy = try? container?.decodeIfPresent(String.self, forKey: .tossWonBy)
        self.status = try? container?.decodeIfPresent(String.self, forKey: .status)
        self.statusId = try? container?.decodeIfPresent(String.self, forKey: .statusId)
        self.playerMatch = try? container?.decodeIfPresent(String.self, forKey: .playerMatch)
        self.result = try? container?.decodeIfPresent(String.self, forKey: .result)
        self.winningTeam = try? container?.decodeIfPresent(String.self, forKey: .winningTeam)
        self.winMargin = try? container?.decodeIfPresent(String.self, forKey: .winMargin)
        self.equation = try? container?.decodeIfPresent(String.self, forKey: .equation)
    }
}
