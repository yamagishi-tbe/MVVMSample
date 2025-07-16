//
//  GitHubClient.swift
//  TcaSample
//
//  Created by keisuke yamagishi on 2025/07/07.
//

import Foundation

struct GitHubClient {
    var search: (String) async throws -> [Repository]

    enum Error: Swift.Error, Equatable {
        case decodingError
        case networkError
    }
}
