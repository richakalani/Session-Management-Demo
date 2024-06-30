//
//  ContentView.swift
//  Session-Management-Demo
//
//  Created by Richa Kalani on 23/06/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authManager: AuthenticationManager
    var body: some View {
        VStack {
            if authManager.authState != .signedOut {
                HomeView()
            } else {
                NewUserView()
            }
        }
    }
}

#Preview {
    ContentView()
}
