//
//  AuthenticationManager.swift
//  Session-Management-Demo
//
//  Created by Richa Kalani on 30/06/24.
//

import Foundation
import AuthenticationServices
import FirebaseAuth
import FirebaseCore

enum AuthState {
    case authenticated
    case signedIn
    case signedOut
}

@MainActor
class AuthenticationManager: ObservableObject {
    @Published var user: User?
    @Published var authState = AuthState.signedOut
    private var authStateChangeHander: AuthStateDidChangeListenerHandle!
    init() {
        configureAuthStateUpdate()
    }
    
    func configureAuthStateUpdate() {
        authStateChangeHander = Auth.auth().addStateDidChangeListener({ aut, user in
            print("Auth changed: \(user != nil)")
            self.updateState(user: user)
        })
    }
    func removeAuthListener() {
        Auth.auth().removeIDTokenDidChangeListener(authStateChangeHander)
    }
    func updateState(user: User?) {
        self.user = user
        let authenticatedUser = user != nil
        let anonymousUser = user?.isAnonymous ?? false
        
        if authenticatedUser {
            self.authState = anonymousUser ? .authenticated : .signedIn
        } else {
            self.authState = .signedOut
        }
    }
    func signInAnonymously() async throws -> AuthDataResult? {
        do {
            let result = try await Auth.auth().signInAnonymously()
            print("FirebaseAuthSuccess: Sign in anonymously, UID:(\(String(describing: result.user.uid)))")
            return result
        } catch {
            print("FirebaseAuthError: failed to sign in anonymously: \(error.localizedDescription)")
            throw error
        }
    }
}
