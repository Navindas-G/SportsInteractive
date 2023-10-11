//
//  CricketMatchViewModel.swift
//  SportInteractive
//
//  Created by Navindas Ghadge on 02/10/23.
//

import Foundation

open class CricketMatchViewModel {
    private let dataSource: CricketMatchDatasource
    
    var onDataSuccess : ((_ model: CricketMatchBaseModel?) -> Void)!
    var onDataFailure : ((_ message: String?) -> Void)!
    
    init(dataSource: CricketMatchDatasource) {
        self.dataSource = dataSource
    }
    
    func getMatchData(for urlString: String) {
        Task {
            do{
                let model = try await self.dataSource.getCricketMatchesData(for: urlString)
                guard let cricketMatchModel = model else {
                    self.onDataFailure("No data found")
                    return
                }
                self.onDataSuccess(cricketMatchModel)
            } catch let caughtError {
                self.onDataFailure(caughtError.localizedDescription)
            }
        }
    }
}
