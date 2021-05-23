//
//  AppDelegate.swift
//  Random People
//
//  Created by Feridun Erbas on 23.05.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        #if MOCK
        let mocker = ApiMocker()
        mocker.mockAPIs()
        #endif
        return true
    }

}

