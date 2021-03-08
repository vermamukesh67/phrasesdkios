//
//  AppDelegate.swift
//  PhraseiOS
//
//  Created by venveh on 4/3/21.
//

import UIKit
import PhraseSDK
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        OTATranslations.shared.updateTranslations()
//        // Override point for customization after application launch.
//        guard let distributionID = ProcessInfo.processInfo.environment["distributionID"] else {
//            return true
//        }
//        guard let environmentSecret = ProcessInfo.processInfo.environment["environmentSecret"] else {
//            return true
//        }
//        print(distributionID)
//        print(environmentSecret)
//        Phrase.shared.debugMode = true
//        Phrase.shared.setup(distributionID: distributionID, environmentSecret: environmentSecret, timeout: 10.0, localeOverride: nil, appVersionOverride: nil)
        return true
    }

}

