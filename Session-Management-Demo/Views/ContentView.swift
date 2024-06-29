//
//  ContentView.swift
//  Session-Management-Demo
//
//  Created by Richa Kalani on 23/06/24.
//

import SwiftUI

struct ContentView: View {
    @State var toggleOn = true
    @State private var scale = 0
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            HStack {
                Spacer()
                Text("Login")
                    .font(.title)
                    .bold()
                    .foregroundStyle(Color.white)
                    .padding()
                Text ("Sign up")
                    .font(.title)
                    .bold()
                    .foregroundStyle(Color.white)
                Spacer()
            }
            CustomToggleView(toggleOn: toggleOn, scale: scale, handlCallBack: {
                self.toggleOn.toggle()
            })
            VStack {
                ZStack {
                    LoginView()
                        .opacity(toggleOn ? 1 : 0)
                        .rotation3DEffect(
                            .degrees(toggleOn ? 0 : -180), axis: (x: 0.0, y: 1.0, z: 0.0)
                        )
                        .animation(Animation.easeInOut(duration: 0.5), value: toggleOn)
                    SignUpView()
                        .opacity(toggleOn ? 0 : 1)
                        .rotation3DEffect(
                            .degrees(toggleOn ? 180 : 0), axis: (x: 0.0, y: 1.0, z: 0.0)
                        )
                        .animation(Animation.easeInOut(duration: 0.5), value: toggleOn)
                }
            }.frame(height: 400)
        
            Spacer()
        }.background(Color(hex: "#EDC9AF"))
    }
}

#Preview {
    ContentView()
}
