//
//  PasswordTextField.swift
//  Session-Management-Demo
//
//  Created by Richa Kalani on 29/06/24.
//

import SwiftUI

struct PasswordTextFieldView: View {
    @State var text: String = ""
    @State var passwordPlaceholder: String = ""
    var body: some View {
        Group {
            SecureField(text: $text) {
                Text(passwordPlaceholder)
                    .foregroundStyle(.white.opacity(0.8))
            }
                .foregroundStyle(.white.opacity(0.8))
                .simultaneousGesture(TapGesture().onEnded {
                       passwordPlaceholder = ""
                       })
                .padding([.vertical, .horizontal], 10)
                .border(Color.gray)
                .textInputAutocapitalization(.never)
                .keyboardType(.asciiCapable)
                .autocorrectionDisabled(true)
            
        }
        .onAppear {
            passwordPlaceholder = TextConstants.passwordPlaceholder
        }
    }
}

#Preview {
    PasswordTextFieldView()
}
