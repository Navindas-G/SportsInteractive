//
//  CricketMatchDatasource.swift
//  SportInteractive
//
//  Created by Navindas Ghadge on 02/10/23.
//

import Foundation

class CricketMatchDatasource {
    
    let networkServices = NetworkServices()
    
    func getCricketMatchesData(for urlString: String) async throws -> CricketMatchBaseModel {
        let data = try await self.networkServices.getData(for: urlString)
        let model = try JSONDecoder().decode(CricketMatchBaseModel.self, from: data)
//        debugPrint("Model : \(model)")
        return model
    }
}
