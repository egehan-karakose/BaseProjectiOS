//
//  AppDelegate.swift
//  BaseProject
//
//  Created by Egehan KARAKÖSE (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 27.03.2022.
//

import UIKit
import Networking
import Common
import RedirectManager

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        AppDefaults.setup(with: .production)
        System.setup()
        Environment.shared.configure()
       
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    // MARK: Universal Link
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        if userActivity.activityType == NSUserActivityTypeBrowsingWeb {
            guard let completeUrl = userActivity.webpageURL,
                  let shortedUrl = completeUrl.absoluteString.slice(from: "", toward: ""),
                  let url = URL(string: shortedUrl) else { return false }
                    
            let urlComponent = URLComponents(url: url, resolvingAgainstBaseURL: true)
            RedirectManager.shared.decideRedirectStrategy(with: "1", queryParams: urlComponent?.query)
            return true
        }
        
        return false
    }

    // MARK: Custom URL Scheme işleme
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if userActivity?.activityType == NSUserActivityTypeBrowsingWeb {
            guard let completeUrl = userActivity?.webpageURL,
                  let shortedUrl = completeUrl.absoluteString.slice(from: "", toward: ""),
                  let url = URL(string: shortedUrl) else { return false }
                    
            let urlComponent = URLComponents(url: url, resolvingAgainstBaseURL: true)
            RedirectManager.shared.decideRedirectStrategy(with: "1", queryParams: urlComponent?.query)
            return true
        }
        return false
    }
    

}

