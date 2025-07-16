//
//  GitHubClient+.swift
//  TcaSample
//
//  Created by keisuke yamagishi on 2025/07/08.
//

import Foundation

extension GitHubClient {
    static let liveValue = GitHubClient { query in
        guard
            let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
            let url = URL(string: "https://api.github.com/search/repositories?q=\(encoded)")
        else {
            throw Error.networkError
        }

        let (data, _) = try await URLSession.shared.data(from: url)

        guard
            let result = try? JSONDecoder().decode(SearchResult.self, from: data)
        else {
            throw Error.decodingError
        }

        return result.items
    }

    struct SearchResult: Decodable {
        let items: [Repository]
    }
}
