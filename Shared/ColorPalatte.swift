//
//  Colors.swift
//  ritual
//
//  Created by Sidhant Gandhi on 11/29/20.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

struct ColorPalatte {
    var colors: [Color] = [
        Color(hex: "#07beb8"),
        Color(hex: "#EC7357"),
        Color(hex: "#39304A"),
        Color(hex: "#7D7461"),
        Color(hex: "#963484"),
        Color(hex: "#3066BE"),
        Color(hex: "#28C2FF"),
        Color(hex: "#387780"),
        Color(hex: "#E83151"),
        Color(hex: "#C97D60"),
        Color(hex: "#D282A6"),
        Color(hex: "#6E4555"),
        Color(hex: "#FF6F59"),
        Color(hex: "#254441"),
        Color(hex: "#43AA8B"),
        Color(hex: "#A44200"),
        Color(hex: "#D58936"),
        Color(hex: "#F90093"),
        Color(hex: "#F0544F"),
        Color(hex: "#8980F5"),
        Color(hex: "#3BA99C"),
        Color(hex: "#5D576B"),
        Color(hex: "#545C52"),
        Color(hex: "#826AED")
    ]
    
    func generated(count: Int) -> [Color] {
        let multiple = Int(ceil(Float(count) / Float(colors.count)))
        var accumulated: [Color] = []
        for _ in 1...multiple {
            accumulated.append(contentsOf: colors.shuffled())
        }
        return Array(accumulated.prefix(count))
    }
}
