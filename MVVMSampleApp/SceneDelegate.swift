//
//  SceneDelegate.swift
//  MVVMSampleApp
//
//  Created by keisuke yamagishi on 2025/07/14.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo _: UISceneSession, options _: UIScene.ConnectionOptions) {
        guard let sceneWindow = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: sceneWindow)
        guard let window = self.window else { return }
        let viewController = ViewController()
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}

