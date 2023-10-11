//
//  InningsModel.swift
//  SportInteractive
//
//  Created by Navindas Ghadge on 02/10/23.
//

import Foundation

struct InningsModel: Decodable {
    /*
     "Number": "First",
     "Battingteam": "4",
     "Total": "92",
     "Wickets": "10",
     "Overs": "30.5",
     "Runrate": "2.98",
     "Byes": "0",
     "Legbyes": "1",
     "Wides": "6",
     "Noballs": "0",
     "Penalty": "0",
     "AllottedOvers": "50",
     "Batsmen",
     "Partnership_Current",
     "Bowlers",
     "FallofWickets",
     "PowerPlay"
     */
    
    let number: String?
    let battingTeam: String?
    let total: String?
    let wickets: String?
    let overs: String?
    let runRate: String?
    let byes: String?
    let legByes: String?
    let wides: String?
    let noBalls: String?
    let penalty: String?
    let allotedOvers: String?
    let batsmen: [BatsmanScoredModel]?
    let partnershipCurrent: PartnershipModel?
    let bowlers: [BowlersEconomyModel]?
    let fallOfWickets: [FallOfWicketsModel]?
    let powerPlay: PowerPlayModel?
    
    enum InningsModelKey: String, CodingKey {
        case number = "Number"
        case battingTeam = "Battingteam"
        case total = "Total"
        case wickets = "Wickets"
        case overs = "Overs"
        case runRate = "Runrate"
        case byes = "Byes"
        case legByes = "Legbyes"
        case wides = "Wides"
        case noBalls = "Noballs"
        case penalty = "Penalty"
        case allotedOvers = "AllottedOvers"
        case batsmen = "Batsmen"
        case partnershipCurrent = "Partnership_Current"
        case bowlers = "Bowlers"
        case fallOfWickets = "FallofWickets"
        case powerPlay = "PowerPlay"
    }
    
    init(from decoder: Decoder) throws {
        let values = try? decoder.container(keyedBy: InningsModelKey.self)
        
        self.number = try? values?.decodeIfPresent(String.self, forKey: .number)
        self.battingTeam = try? values?.decodeIfPresent(String.self, forKey: .battingTeam)
        self.total = try? values?.decodeIfPresent(String.self, forKey: .total)
        self.wickets = try? values?.decodeIfPresent(String.self, forKey: .wickets)
        self.overs = try? values?.decodeIfPresent(String.self, forKey: .overs)
        self.runRate = try? values?.decodeIfPresent(String.self, forKey: .runRate)
        self.byes = try? values?.decodeIfPresent(String.self, forKey: .byes)
        self.legByes = try? values?.decodeIfPresent(String.self, forKey: .legByes)
        self.wides = try? values?.decodeIfPresent(String.self, forKey: .wides)
        self.noBalls = try? values?.decodeIfPresent(String.self, forKey: .noBalls)
        self.penalty = try? values?.decodeIfPresent(String.self, forKey: .penalty)
        self.allotedOvers = try? values?.decodeIfPresent(String.self, forKey: .allotedOvers)
        self.batsmen = try? values?.decodeIfPresent([BatsmanScoredModel].self, forKey: .batsmen)
        self.partnershipCurrent = try? values?.decodeIfPresent(PartnershipModel.self, forKey: .partnershipCurrent)
        self.bowlers = try? values?.decodeIfPresent([BowlersEconomyModel].self, forKey: .bowlers)
        self.fallOfWickets = try? values?.decodeIfPresent([FallOfWicketsModel].self, forKey: .fallOfWickets)
        self.powerPlay = try? values?.decodeIfPresent(PowerPlayModel.self, forKey: .powerPlay)
    }
}
