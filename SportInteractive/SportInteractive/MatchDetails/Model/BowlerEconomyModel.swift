//
//  BowlerEconomyModel.swift
//  SportInteractive
//
//  Created by Navindas Ghadge on 02/10/23.
//

import Foundation

struct BowlersEconomyModel: Decodable {
    /*
     "Bowler": "60544",
     "Overs": "8",
     "Maidens": "2",
     "Runs": "30",
     "Wickets": "0",
     "Economyrate": "3.75",
     "Noballs": "0",
     "Wides": "0",
     "Dots": "33",
     */
    
    let bowler: String?
    let overs: String?
    let maidens: String?
    let runs: String?
    let wickets: String?
    let economyRate: String?
    let noBalls: String?
    let wides: String?
    let dots: String?
    
    enum BowlersEconomyModelKey: String, CodingKey {
        case bowler = "Bowler"
        case overs = "Overs"
        case maidens = "Maidens"
        case runs = "Runs"
        case wickets = "Wickets"
        case economyRate = "Economyrate"
        case noBalls = "Noballs"
        case wides = "Wides"
        case dots = "Dots"
    }
    
    
    init(from decoder: Decoder) throws {
        let values = try? decoder.container(keyedBy: BowlersEconomyModelKey.self)
        
        self.bowler = try? values?.decodeIfPresent(String.self, forKey: .bowler)
        self.overs = try? values?.decodeIfPresent(String.self, forKey: .overs)
        self.maidens = try? values?.decodeIfPresent(String.self, forKey: .maidens)
        self.runs = try? values?.decodeIfPresent(String.self, forKey: .runs)
        self.wickets = try? values?.decodeIfPresent(String.self, forKey: .wickets)
        self.economyRate = try? values?.decodeIfPresent(String.self, forKey: .economyRate)
        self.noBalls = try? values?.decodeIfPresent(String.self, forKey: .noBalls)
        self.wides = try? values?.decodeIfPresent(String.self, forKey: .wides)
        self.dots = try? values?.decodeIfPresent(String.self, forKey: .dots)
    }
}
