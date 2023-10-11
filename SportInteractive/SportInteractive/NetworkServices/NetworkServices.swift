//
//  NetworkServices.swift
//  SportInteractive
//
//  Created by Navindas Ghadge on 02/10/23.
//

import Foundation

fileprivate protocol NetworkServicesProtocol: NSObjectProtocol {
    func getData(for urlString: String) async throws -> Data?
}

class NetworkServices: NSObject, NetworkServicesProtocol {
    func getData(for urlString: String) async throws -> Data? {
        let session = URLSession(configuration: .default)
        guard let url = URL(string: urlString) else {return nil}
        let (data,response) = try await session.data(for: URLRequest(url: URL(string: urlString)!))
        debugPrint("Received response : \(response)")
        return try mapResponse(response: (data, response))
    }
}
