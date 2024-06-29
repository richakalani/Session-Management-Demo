//
//  CustomToggleView.swift
//  Session-Management-Demo
//
//  Created by Richa Kalani on 29/06/24.
//

import SwiftUI

struct CustomToggleView: View {
    @State var toggleOn: Bool = true
    @State var scale: Int = 0
    var handlCallBack: (() -> Void) = {}
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 100, height: 24)
                .foregroundColor(Color.white)
            Rectangle()
                .frame(width: 40, height: 40)
                .foregroundColor(.black)
                .shadow(color: .black.opacity(0.5), radius: 4, x: 0, y: 2)
                .offset(x: toggleOn ? -32 : 32)
                .animation(.spring(duration: 1, bounce: 0.0), value: scale)
        }
        .onTapGesture {
            self.toggleOn.toggle()
            scale += 1
            handlCallBack()
        }
    }
}
