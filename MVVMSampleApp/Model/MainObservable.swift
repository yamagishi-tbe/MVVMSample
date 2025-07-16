//
//  MainObservable.swift
//  MVVMSampleApp
//
//  Created by keisuke yamagishi on 2025/07/15.
//

import Combine
import Foundation
import SwiftUI

final class MainObservable: ObservableObject {
    @Published var textSubject: PassthroughSubject<String, Never> = .init()
    @Published var items: [Repository] = []
}
