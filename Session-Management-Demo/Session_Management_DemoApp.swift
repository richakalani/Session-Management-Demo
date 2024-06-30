//
//  Session_Management_DemoApp.swift
//  Session-Management-Demo
//
//  Created by Richa Kalani on 23/06/24.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

//class AppDelegate: NSObject, UIApplicationDelegate {
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//        FirebaseApp.configure()
//        return true
//    }
//}

@main
struct Session_Management_DemoApp: App {
    // register app delegate for firebase
    @StateObject var authManager: AuthenticationManager
    init() {
        FirebaseApp.configure()
        let authManager = AuthenticationManager()
        _authManager = StateObject(wrappedValue: authManager)
    }
  //  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authManager)
        }
    }
}
