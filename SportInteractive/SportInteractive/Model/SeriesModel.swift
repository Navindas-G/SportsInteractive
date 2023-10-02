//
//  SeriesModel.swift
//  SportInteractive
//
//  Created by Navindas Ghadge on 02/10/23.
//

import Foundation

struct SeriesModel: Decodable {
    /*
     "Id": "3068",
     "Name": "India in New Zealand, 5 ODI Series, 2019",
     "Status": "India lead the 5 ODI series 3-1",
     "Tour": "956",
     "Tour_Name": "India tour of New Zealand, 2019",
     */
    
    let id: String?
    let name: String?
    let status: String?
    let tour: String?
    let tourName: String?
    
    enum SeriesModelKey: String, CodingKey {
        case id = "Id"
        case name = "Name"
        case status = "Status"
        case tour = "Tour"
        case tourName = "Tour_Name"
    }
    
    init(from decoder: Decoder) throws {
        let values = try? decoder.container(keyedBy: SeriesModelKey.self)
        self.id = try? values?.decodeIfPresent(String.self, forKey: .id)
        self.name = try? values?.decodeIfPresent(String.self, forKey: .name)
        self.status = try? values?.decodeIfPresent(String.self, forKey: .status)
        self.tour = try? values?.decodeIfPresent(String.self, forKey: .tour)
        self.tourName = try? values?.decodeIfPresent(String.self, forKey: .tourName)
    }
}
