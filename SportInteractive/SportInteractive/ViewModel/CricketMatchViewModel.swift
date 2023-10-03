//
//  CricketMatchViewModel.swift
//  SportInteractive
//
//  Created by Navindas Ghadge on 02/10/23.
//

import Foundation

class CricketMatchViewModel {
    private let dataSource: CricketMatchDatasource
    
    var onDataSuccess : ((_ model: CricketMatchBaseModel) -> Void)!
    var onDataFailure : ((_ message: String) -> Void)!
    
    init(dataSource: CricketMatchDatasource) {
        self.dataSource = dataSource
    }
    
    func getMatchData(for urlString: String) {
        Task {
            do{
                let model = try await self.dataSource.getCricketMatchesData(for: urlString)
                self.onDataSuccess(model)
            } catch let caughtError {
                self.onDataFailure(caughtError.localizedDescription)
            }
        }
    }
}
