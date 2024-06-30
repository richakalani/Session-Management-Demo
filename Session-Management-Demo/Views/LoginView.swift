//
//  LoginView.swift
//  Session-Management-Demo
//
//  Created by Richa Kalani on 29/06/24.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authManager: AuthenticationManager
    @State var loginText: String = ""
    @State var passwordText: String = ""
    @State var emailPlaceHolder: String = ""
    var body: some View {
        VStack(spacing: 16) {
            Text(TextConstants.login)
                .foregroundStyle(.white)
                .bold()
            TextField(text: $loginText) {
                Text(emailPlaceHolder)
                    .foregroundStyle(.white.opacity(0.8))
            }
            .simultaneousGesture(TapGesture().onEnded {
                     emailPlaceHolder = ""
                   })
            .foregroundStyle(.white.opacity(0.8))
            .padding([.vertical, .horizontal], 10)
            .border(Color.gray)
            PasswordTextFieldView()
            Button(action: {
                signAnonymously()
            }, label: {
                Text(TextConstants.login)
                    .foregroundStyle(.white)
                    .bold()
                    .padding(.vertical, 8)
            })
            .frame(width: (UIScreen.current?.bounds.width ?? 0) - 52)
            .background(Color(hex: "bd8e6c"))
            .padding([.vertical], 10)
            Button(action: {}, label: {
                Text(TextConstants.forgotYourPassword)
                    .foregroundStyle(.white)
                    .font(.caption)
                    .underline()
                    .padding(.vertical, 8)
            })
        }
        .padding()
        .background(Color.black.opacity(0.8))
        .padding(.horizontal, 20)
        .onAppear {
            emailPlaceHolder = TextConstants.emailPlaceholder
            passwordText = TextConstants.passwordPlaceholder
        }
    }
    func signAnonymously() {
        Task {
            do {
                let result = try await authManager.signInAnonymously()
            } catch {
                print("Guest Login error \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    LoginView()
}
