//
//  FootnoteCounter.swift
//  InputField
//
//  Created by Hamza on 2023-06-01.
//

import SwiftUI

internal struct FootnoteCounterView: View {
    @Environment(\.layoutDirection) var layoutDirection
    var inputCounter: Int
    var maximumInputCharacters: Int
    
    var body: some View {
        Text(setCounterText(with: inputCounter, with: maximumInputCharacters, for: layoutDirection))
            .fontWithLineHeight(font: .systemFont(ofSize: 12.0), lineHeight: 18)
            .foregroundColor(.textAndIcon3)
            .accessibility(label: Text("Input counter, \(inputCounter) out of \(maximumInputCharacters) characters has been entered"))
    }
}

internal struct FootnoteCounterView_Previews: PreviewProvider {
    static var previews: some View {
        FootnoteCounterView(inputCounter: 4, maximumInputCharacters: 8)
    }
}

extension FootnoteCounterView {
    private func setCounterText(with inputCounter: Int,
                            with maxCharacters: Int,
                            for direction: LayoutDirection) -> String {
        if layoutDirection == .leftToRight {
            return "\(inputCounter)" + "/" + "\(maximumInputCharacters)"
        } else {
            return "\(maxCharacters)" + "/" + "\(inputCounter)"
        }
    }
}
