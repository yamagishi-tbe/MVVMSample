//
//  ViewController.swift
//  MVVMSampleApp
//
//  Created by keisuke yamagishi on 2025/07/14.
//

import Combine
import SwiftUI
import UIKit

final class ViewController: UIViewController {
    private let viewModel = ViewModel()
    private let mainView = MainView()
    private var cancellable = Set<AnyCancellable>()

    // MARK: Lifecycle

    override func loadView() {
        super.loadView()

        mainView
            .model
            .textSubject
            .sink { [self] text in
                viewModel.input.search(text)
            }.store(in: &cancellable)

        viewModel
            .output
            .repositorySubject
            .sink { [weak self] repositories in
                guard let self else { return }
                mainView.model.items = repositories
            }.store(in: &cancellable)

        setup()
    }

    // MARK: Private function

    private func setup() {
        let hostViewController = UIHostingController(rootView: mainView)
        addChild(hostViewController)
        view.addSubview(hostViewController.view)
        hostViewController.view.frame = view.bounds
        hostViewController.didMove(toParent: self)
    }
}
