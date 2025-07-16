//
//  Repository.swift
//  TcaSample
//
//  Created by keisuke yamagishi on 2025/07/07.
//

struct Repository: Decodable, Equatable, Identifiable {
    let id: Int
    let fullName: String

    enum CodingKeys: String, CodingKey {
        case id
        case fullName = "full_name"
    }
}
