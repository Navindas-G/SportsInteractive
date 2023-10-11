//
//  BatsmanScoredModel.swift
//  SportInteractive
//
//  Created by Navindas Ghadge on 02/10/23.
//

import Foundation

struct BatsmanScoredModel: Decodable {
    /*
     "Batsman": "3852",
     "Runs": "7",
     "Balls": "23",
     "Fours": "0",
     "Sixes": "0",
     "Dots": "17",
     "Strikerate": "30.43",
     "Dismissal": "caught",
     "Howout": "c & b Trent Boult",
     "Bowler": "4338",
     "Fielder": "4338",
     */
    
    let batsMan: String?
    let runs: String?
    let balls: String?
    let fours: String?
    let sixes: String?
    let dots: String?
    let strikerRate: String?
    let dismissal: String?
    let howOut: String?
    let bowler: String?
    let fielder: String?
    
    enum BatsmanScoreModelKey: String, CodingKey {
        case batsman = "Batsman"
        case runs = "Runs"
        case balls = "Balls"
        case fours = "Fours"
        case sixes = "Sixes"
        case dots = "Dots"
        case strikerRate = "Strikerate"
        case dismissal = "Dismissal"
        case howOut = "Howout"
        case bowler = "Bowler"
        case fielder = "Fielder"
    }
    
    init(from decoder: Decoder) throws {
        let values = try? decoder.container(keyedBy: BatsmanScoreModelKey.self)
        
        self.batsMan = try? values?.decodeIfPresent(String.self, forKey: .batsman)
        self.runs = try? values?.decodeIfPresent(String.self, forKey: .runs)
        self.balls = try? values?.decodeIfPresent(String.self, forKey: .balls)
        self.fours = try? values?.decodeIfPresent(String.self, forKey: .fours)
        self.sixes = try? values?.decodeIfPresent(String.self, forKey: .sixes)
        self.dots = try? values?.decodeIfPresent(String.self, forKey: .dots)
        self.strikerRate = try? values?.decodeIfPresent(String.self, forKey: .strikerRate)
        self.dismissal = try? values?.decodeIfPresent(String.self, forKey: .dismissal)
        self.howOut = try? values?.decodeIfPresent(String.self, forKey: .howOut)
        self.bowler = try? values?.decodeIfPresent(String.self, forKey: .bowler)
        self.fielder = try? values?.decodeIfPresent(String.self, forKey: .fielder)
    }
}
