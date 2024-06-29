//
//  LoginView.swift
//  Session-Management-Demo
//
//  Created by Richa Kalani on 29/06/24.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack(spacing: 16) {
           Text("Login")
                .foregroundStyle(.white)
                .bold()
            TextField(text: .constant("")) {
                Text("Your Email")
                    .foregroundStyle(.white.opacity(0.8))
            }
            .padding([.vertical, .horizontal], 10)
            .border(Color.gray)
            TextField(text: .constant("")) {
                Text("Your Password")
                    .foregroundStyle(.white.opacity(0.8))
            }
            .padding([.vertical, .horizontal], 10)
            .border(Color.gray)
            Button(action: {}, label: {
                Text("Login")
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
    }
}

#Preview {
    LoginView()
}
