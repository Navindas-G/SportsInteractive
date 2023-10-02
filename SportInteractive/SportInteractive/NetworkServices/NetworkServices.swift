//
//  NetworkServices.swift
//  SportInteractive
//
//  Created by Navindas Ghadge on 02/10/23.
//

import Foundation

protocol NetworkServicesProtocol: NSObjectProtocol {
    static func getData(for urlString: String) async throws -> Data
}

class NetworkServices: NSObject, NetworkServicesProtocol {
    static func getData(for urlString: String) async throws -> Data {
        let session = URLSession(configuration: .default)
        let (data,response) = try await session.data(for: URLRequest(url: URL(string: urlString)!))
        debugPrint("Received response : \(response)")
        return data
    }
}
