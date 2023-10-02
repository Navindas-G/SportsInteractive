//
//  MatchNotesModel.swift
//  SportInteractive
//
//  Created by Navindas Ghadge on 02/10/23.
//

import Foundation

struct MatchNotesModel: Decodable {
    let noteOne: [String]?
    let noteTwo: [String]?
    
    enum MatchNotesModelKey: String, CodingKey {
        case notesOne = "1"
        case notesTwo = "2"
    }
    
    init(from decoder: Decoder) throws {
        let values = try? decoder.container(keyedBy: MatchNotesModelKey.self)
        
        self.noteOne = try? values?.decodeIfPresent([String].self, forKey: .notesOne)
        self.noteTwo = try? values?.decodeIfPresent([String].self, forKey: .notesTwo)
    }
}
