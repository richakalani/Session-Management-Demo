//
//  Extensions.swift
//  Session-Management-Demo
//
//  Created by Richa Kalani on 23/06/24.
//

import Foundation
import SwiftUI
extension UIWindow {
    static var current: UIWindow? {
        for scene in UIApplication.shared.connectedScenes {
            guard let windowScene = scene as? UIWindowScene else { continue }
            for window in windowScene.windows {
                if window.isKeyWindow { return window }
            }
        }
        return nil
    }
}

// MARK: Get current window screen
extension UIScreen {
    static var current: UIScreen? {
        UIWindow.current?.screen
    }
}

// MARK: Color extension to use hex colors
extension Color {
    init(hex: String) {
        var cleanHexCode = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        cleanHexCode = cleanHexCode.replacingOccurrences(of: "#", with: "")
        var rgb: UInt64 = 0
        Scanner(string: cleanHexCode).scanHexInt64(&rgb)
        let redValue = Float((rgb >> 16) & 0xFF) / 255.0
        let greenValue = Float((rgb >> 8) & 0xFF) / 255.0
        let blueValue = Float(rgb & 0xFF) / 255.0
        self.init(Resolved(red: redValue, green: greenValue, blue: blueValue))
    }
}
