//
//  InputFieldManager.swift
//  InputField
//
//  Created by Hamza on 2023-06-01.
//

import Foundation
import SwiftUI

internal enum InputFieldState {
    case initial
    case filled
    case error
    case success
}

internal class InputFieldManager: ObservableObject {
    @Published var inputText: String {
        didSet {
            inputCounter = inputText.count
        }
    }
    
    @Published var inputCounter: Int {
        didSet {
            updateInputState()
        }
    }
    
    @Published var inputFieldState: InputFieldState = .initial
    @Published var hideInput = true
    
    var maximumInputCharacters: Int
    
    var fontColor: Color {
        getFontColor()
    }
    
    var borderColor: Color {
        getBorderColor()
    }
    
    var borderWidth: CGFloat {
        getBorderWidth()
    }
    
    var footnoteText: String {
        getFootnoteText()
    }
    
    init(inputText: String, maximumInputCharacters: Int) {
        self.inputText = inputText
        self.inputCounter = inputText.count
        self.maximumInputCharacters = maximumInputCharacters
        
        self.updateInputState()
    }
    
    @ViewBuilder
    func getFootnoteIcon() -> some View {
        switch inputFieldState {
        case .error:
            Image("negativeIcon")
                .frame(height: 16.0)
        case .success:
            Image("positiveIcon")
                .frame(height: 16.0)
        default:
            EmptyView()
        }
    }
}

private extension InputFieldManager {
    func updateInputState() {
        if inputCounter == maximumInputCharacters && inputText.isNumber {
            inputFieldState = .success
        } else if inputCounter > maximumInputCharacters || !inputText.isNumber {
            inputFieldState = .error
        } else if inputCounter > 0 {
            inputFieldState = .filled
        } else {
            inputFieldState = .initial
        }
    }
    
    func getBorderColor() -> Color {
        switch inputFieldState {
        case .initial:
            return Color.textAndIcon3
        case .filled:
            return Color.interactive
        case .error:
            return Color.semanticNegative
        case .success:
            return Color.semanticPositive
        }
    }
    
    func getFontColor() -> Color {
        switch inputFieldState {
        case .initial, .filled:
            return Color.textAndIcon3
        case .error:
            return Color.semanticNegative
        case .success:
            return Color.semanticPositive
        }
    }
    
    func getBorderWidth() -> CGFloat {
        switch inputFieldState {
        case .initial:
            return 1.0
        default:
            return 2.0
        }
    }
    
    func getFootnoteText() -> String {
        switch inputFieldState {
        case .initial, .filled:
            return "Only numeric input allowed"
        case .error:
            return "Please only enter up to 8 characters"
        case .success:
            return "Success"
        }
    }
}
