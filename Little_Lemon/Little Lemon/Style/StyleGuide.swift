//
//  CustomColor.swift
//  Little Lemon
//
//  Created by Glendito Jeremiah Palendeng on 27/03/24.
//

import Foundation
import SwiftUI

enum CustomColor{
    case primary1
    case primary2
    case secondary1
    case secondary2
    case highlight1
    case highlight2

    var color: Color {
        switch self {
        case .primary1:
            return Color(UIColor(red: 73/255, green: 94/255, blue: 87/255, alpha: 1))
        case .primary2:
            return Color(UIColor(red: 244/255, green: 206/255, blue: 20/255, alpha: 1))
        case .secondary1:
            return Color(UIColor(red: 238/255, green: 153/255, blue: 114/255, alpha: 1))
        case .secondary2:
            return Color(UIColor(red: 251/255, green: 218/255, blue: 187/255, alpha: 1))
        case .highlight1:
            return Color(UIColor(red: 237/255, green: 239/255, blue: 238/255, alpha: 1))
        case .highlight2:
            return Color(UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1))
        }
    }
}

enum CustomFonts{
    case display
    case subTitle
    case leadText
    case sectionTitle
    case sectionCategories
    case cardTitle
    case paragraph
    case highlightText

    var font:Font{
        switch self{
            case .display:
                return Font.custom("MarkaziText-Medium", size: 64)
            case .subTitle:
                return Font.custom("MarkaziText-Regular", size: 40)
            case .leadText:
                return Font.custom("Karla-Medium", size: 18)
            case .sectionTitle:
                return Font.custom("Karla-ExtraBold", size: 20)
            case .sectionCategories:
                return Font.custom("Karla-ExtraBold", size: 16)
            case .cardTitle:
                return Font.custom("Karla-Bold", size: 18)
            case .paragraph:
                return Font.custom("Karla-Regular", size: 16)
            case .highlightText:
                return Font.custom("Karla-Medium", size: 16)
        }
    }
}

struct MyToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            HStack {
                configuration.label
            }
        }
        .foregroundColor(configuration.isOn ? CustomColor.highlight1.color : CustomColor.primary1.color)
        .padding(5)
        .background(configuration.isOn ? CustomColor.primary1.color : CustomColor.highlight1.color)
        .cornerRadius(8)
        .font(CustomFonts.sectionCategories.font)
    }
}

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }) {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                    .foregroundColor(configuration.isOn ? CustomColor.primary1.color: .secondary)
                    .imageScale(.large)
                configuration.label
            }
        }
    }
}
