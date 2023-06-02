//
//  FootnoteComponent.swift
//  InputField
//
//  Created by Hamza on 2023-05-29.
//

import SwiftUI

internal struct FootnoteComponent: View {
    @Environment(\.layoutDirection) var layoutDirection
    @EnvironmentObject var manager: InputFieldManager
    
    var body: some View {
        HStack(spacing: 0) {
            iconViewLayout(for: layoutDirection)
            
            Spacer()
            
            if manager.inputFieldState == .error || manager.inputFieldState == .success {
                EmptyView()
            } else {
                FootnoteCounterView(inputCounter: manager.inputCounter,
                                    maximumInputCharacters: manager.maximumInputCharacters)
            }
        }
        .frame(height: 16)
        .padding(.top, 1)
    }
}

internal struct FootnoteComponent_Previews: PreviewProvider {
    static var previews: some View {
        let manager = InputFieldManager(inputText: "1234", maximumInputCharacters: 8)
        
        FootnoteComponent()
            .environmentObject(manager)
    }
}

extension FootnoteComponent {
    @ViewBuilder
    private func iconViewLayout(for direction: LayoutDirection) -> some View {
        if layoutDirection == .leftToRight {
            manager.getFootnoteIcon()
            
            Text(manager.footnoteText)
                .fontWithLineHeight(font: .systemFont(ofSize: 12), lineHeight: 18)
                .foregroundColor(manager.fontColor)
                .padding(.top, 3)
        } else {
            Text(manager.footnoteText)
                .fontWithLineHeight(font: .systemFont(ofSize: 12), lineHeight: 18)
                .foregroundColor(manager.fontColor)
                .padding(.top, 3)
            
            manager.getFootnoteIcon()
        }
    }
}
