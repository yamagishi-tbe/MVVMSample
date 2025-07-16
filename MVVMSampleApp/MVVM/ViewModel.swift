//
//  ViewModel.swift
//  MVVMSampleApp
//
//  Created by keisuke yamagishi on 2025/07/15.
//

import Combine
import Foundation
import SwiftUI

@MainActor
protocol ViewModelInput: AnyObject {
    func search(_ query: String)
}

protocol ViewModelOutput: AnyObject {
    var repositorySubject: PassthroughSubject<[Repository], Never> { get }
}

protocol ViewModelType: AnyObject {
    var input: ViewModelInput { get }
    var output: ViewModelOutput { get }
}

final class ViewModel: ViewModelType {
    var input: ViewModelInput { self }
    var output: ViewModelOutput { self }
    fileprivate var githubClient = GitHubClient.liveValue
    fileprivate var _repositorySubject: PassthroughSubject<[Repository], Never> = .init()
}

extension ViewModel: ViewModelInput {
    func search(_ query: String) {
        Task {
            guard let items = try? await githubClient.search(query) else { return }
            _repositorySubject.send(items)
        }
    }
}

extension ViewModel: ViewModelOutput {
    var repositorySubject: PassthroughSubject<[Repository], Never> {
        _repositorySubject
    }
}
