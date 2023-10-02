//
//  CricketMatchViewModel.swift
//  SportInteractive
//
//  Created by Navindas Ghadge on 02/10/23.
//

import Foundation

class CricketMatchViewModel {
    private let dataSource: CricketMatchDatasource
    
    init(dataSource: CricketMatchDatasource) {
        self.dataSource = dataSource
    }
    
    func getMatchDetails(urlString: String) async throws -> CricketMatchBaseModel {
        let model = try! await self.dataSource.getCricketMatchesData(for: urlString)
        return model
    }
}
