//
//  SignUpView.swift
//  Session-Management-Demo
//
//  Created by Richa Kalani on 29/06/24.
//

import SwiftUI

struct SignUpView: View {
    @State var loginText: String = ""
    @State var passwordText: String = ""
    @State var nameText: String = ""
    @State var namePlaceHolder: String =  ""
    @State var emailPlaceHolder: String = ""
    @State var passwordPlaceholder: String = ""
    var body: some View {
        VStack(spacing: 16) {
           Text("Sign up")
                .foregroundStyle(.white)
                .bold()
            TextField(text: $nameText) {
                Text(namePlaceHolder)
                    .foregroundStyle(.white.opacity(0.8))
            }
            .simultaneousGesture(TapGesture().onEnded {
                     namePlaceHolder = ""
                   })
            .foregroundStyle(.white.opacity(0.8))
            .padding([.vertical, .horizontal], 10)
            .border(Color.gray)
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
            Button(action: {}, label: {
                Text("Sign up")
                    .foregroundStyle(.white)
                    .bold()
                    .padding(.vertical, 8)
            })
            .frame(width: (UIScreen.current?.bounds.width ?? 0) - 52)
            .background(Color(hex: "bd8e6c"))
            .padding([.vertical], 10)
           
        }
        .padding()
        .background(Color.black.opacity(0.8))
        .padding(.horizontal, 20)
        .onAppear {
            namePlaceHolder = TextConstants.yourFullNamePlaceholder
            emailPlaceHolder = TextConstants.emailPlaceholder
            passwordPlaceholder = TextConstants.passwordPlaceholder
        }
    }
}

#Preview {
    SignUpView()
}
