//
//  Extension.swift
//  SportInteractive
//
//  Created by Navindas Ghadge on 03/10/23.
//

import Foundation

extension KeyedDecodingContainer {
    func decode(_ type: Dictionary<String, Any>.Type, forKey key: K) throws -> Dictionary<String, Any> {
        let container = try self.nestedContainer(keyedBy: JSONCodingKeys.self, forKey: key)
        return try container.decode(type)
    }
    
    func decodeIfPresent(_ type: Dictionary<String, Any>.Type, forKey key: K) throws -> Dictionary<String, Any>? {
        guard contains(key) else {
            return nil
        }
        guard try decodeNil(forKey: key) == false else {
            return nil
        }
        return try decode(type, forKey: key)
    }
    
    func decode(_ type: Array<Any>.Type, forKey key: K) throws -> Array<Any> {
        var container = try self.nestedUnkeyedContainer(forKey: key)
        return try container.decode(type)
    }
    
    func decodeIfPresent(_ type: Array<Any>.Type, forKey key: K) throws -> Array<Any>? {
        guard contains(key) else {
            return nil
        }
        guard try decodeNil(forKey: key) == false else {
            return nil
        }
        return try decode(type, forKey: key)
    }
    
    
    func decode(_ type: Dictionary<String, Any>.Type) throws -> Dictionary<String, Any> {
        var dictionary = Dictionary<String, Any>()
        
        for key in allKeys {
            if let boolValue = try? decode(Bool.self, forKey: key) {
                dictionary[key.stringValue] = boolValue
            } else if let stringValue = try? decode(String.self, forKey: key) {
                dictionary[key.stringValue] = stringValue
            } else if let intValue = try? decode(Int.self, forKey: key) {
                dictionary[key.stringValue] = intValue
            } else if let doubleValue = try? decode(Double.self, forKey: key) {
                dictionary[key.stringValue] = doubleValue
            } else if let nestedDictionary = try? decode(Dictionary<String, Any>.self, forKey: key) {
                dictionary[key.stringValue] = nestedDictionary
            } else if let nestedArray = try? decode(Array<Any>.self, forKey: key) {
                dictionary[key.stringValue] = nestedArray
            }
        }
        return dictionary
    }
}

extension UnkeyedDecodingContainer {
    
    mutating func decode(_ type: Array<Any>.Type) throws -> Array<Any> {
        var array: [Any] = []
        while isAtEnd == false {
            // See if the current value in the JSON array is `null` first and prevent infite recursion with nested arrays.
            if try decodeNil() {
                continue
            } else if let value = try? decode(Bool.self) {
                array.append(value)
            } else if let value = try? decode(Double.self) {
                array.append(value)
            } else if let value = try? decode(String.self) {
                array.append(value)
            } else if let nestedDictionary = try? decode(Dictionary<String, Any>.self) {
                array.append(nestedDictionary)
            } else if let nestedArray = try? decode(Array<Any>.self) {
                array.append(nestedArray)
            }
        }
        return array
    }
    
    mutating func decode(_ type: Dictionary<String, Any>.Type) throws -> Dictionary<String, Any> {
        
        let nestedContainer = try self.nestedContainer(keyedBy: JSONCodingKeys.self)
        return try nestedContainer.decode(type)
    }
}

struct JSONCodingKeys: CodingKey {
    var stringValue: String
    
    init?(stringValue: String) {
        self.stringValue = stringValue
    }
    
    var intValue: Int?
    
    init?(intValue: Int) {
        self.init(stringValue: "\(intValue)")
        self.intValue = intValue
    }
}

extension [String:Any] {
    func getTeamsName() -> String {
        var namesSeparatedWithComma: String = ""
        for (key, value) in self {
            debugPrint("Key : \(key)")
            guard let dict = value as? [String:Any] else {
                return ""
            }
            if namesSeparatedWithComma == "" {
                namesSeparatedWithComma = dict["Name_Short"] as? String ?? ""
            } else {
                namesSeparatedWithComma = namesSeparatedWithComma + " vs " + (dict["Name_Short"] as? String ?? "")
            }
        }
        return namesSeparatedWithComma
    }
    
    func getPlayersList() -> [PlayerInfoModel] {
        var playersList: [PlayerInfoModel] = []
        
        /*
         "Position": "5",
         "Name_Full": "Shoaib Malik",
         "Iscaptain": true,
         "Iskeeper": true,
         "Batting": {
           "Style": "RHB",
           "Average": "35.17",
           "Strikerate": "81.65",
           "Runs": "7317"
         },
         "Bowling": {
           "Style": "OB",
           "Average": "39.11",
           "Economyrate": "4.65",
           "Wickets": "156"
         },
         */
        
        for (_,value) in self {
            guard let dictionary = value as? [String:Any] else {
                return []
            }
            
            guard let playersDictionary = dictionary["Players"] as? [String:Any] else {
                return []
            }
            
            for (key, value) in playersDictionary {
                let id = key
                guard let infoDictionary = value as? [String:Any] else {
                    return []
                }
                
                let position = infoDictionary["Position"] as? String ?? ""
                let fullName = infoDictionary["Name_Full"] as? String ?? ""
                let isCaptain = infoDictionary["Iscaptain"] as? Bool ?? false
                let isKeeper = infoDictionary["Iskeeper"] as? Bool ?? false
                
                let battingDictionary = infoDictionary["Batting"] as? [String:Any] ?? [:]
                let bowlingDictionary = infoDictionary["Bowling"] as? [String:Any] ?? [:]
                
                let battingStyle = battingDictionary["Style"] as? String ?? ""
                let battingAverage = battingDictionary["Average"] as? String ?? ""
                let strikeRate = battingDictionary["Strikerate"] as? String ?? ""
                let runs = battingDictionary["Runs"] as? String ?? ""
                
                let bowlingStyle = bowlingDictionary["Style"] as? String ?? ""
                let bowlingAverage = bowlingDictionary["Average"] as? String ?? ""
                let economyRate = bowlingDictionary["Economyrate"] as? String ?? ""
                let wickets = bowlingDictionary["Wickets"] as? String ?? ""
                
                let battingStyleModel = BattingStyleModel(style: battingStyle, average: battingAverage, strikerRate: strikeRate, runs: runs)
                let bowlingStyleModel = BowlingStyleModel(style: bowlingStyle, average: bowlingAverage, economyRate: economyRate, wickets: wickets)
                
                let teamFullName = dictionary["Name_Full"] as? String ?? ""
                let teamShortName = dictionary["Name_Short"] as? String ?? ""
                
                let playerInfoModel = PlayerInfoModel(id: id,teamFullName: teamFullName,teamShortName: teamShortName, position: position, fullName: fullName, isCaptain: isCaptain, isKeeper: isKeeper, battingStyle: battingStyleModel, bowlingStyle: bowlingStyleModel)
                
                playersList.append(playerInfoModel)
            }
        }
        return playersList
    }
}
