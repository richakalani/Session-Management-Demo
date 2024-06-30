//
//  PasswordTextField.swift
//  Session-Management-Demo
//
//  Created by Richa Kalani on 29/06/24.
//

import SwiftUI

struct PasswordTextFieldView: View {
    @State var text: String = ""
    var body: some View {
        Group {
            SecureField(text: $text) {
                Text("Your Password")
                    .foregroundStyle(.white.opacity(0.8))
            }
                .foregroundStyle(.white.opacity(0.8))
                .padding([.vertical, .horizontal], 10)
                .border(Color.gray)
                .textInputAutocapitalization(.never)
                .keyboardType(.asciiCapable)
                .autocorrectionDisabled(true)
            
        }
    }
}

#Preview {
    PasswordTextFieldView()
}
