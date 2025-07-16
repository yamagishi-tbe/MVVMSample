//
//  MainView.swift
//  MVVMSampleApp
//
//  Created by keisuke yamagishi on 2025/07/14.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var model: MainObservable = .init()
    @State private var keyword = ""
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("検索ワード",
                              text: Binding<String>(
                                  get: { keyword },
                                  set: {
                                      keyword = $0
                                  }
                              ))
                              .textFieldStyle(PlainTextFieldStyle())
                              .padding()
                    Button("検索") {
                        Task {
                            model.textSubject.send(keyword)
                        }
                    }
                    .padding()
                }
                List(model.items) { repository in
                    Text(repository.fullName)
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("GitHub")
        }
    }
}

#Preview {
    MainView()
}
