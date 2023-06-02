//
//  UsernameInputField.swift
//  InputField
//
//  Created by Hamza on 2023-06-02.
//

import SwiftUI

struct UsernameInputField: View {
    @State var inputText: String = ""
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4.0) {
            Text("Username")
                .fontWithLineHeight(font: .systemFont(ofSize: 14.0), lineHeight: 22)
                .foregroundColor(.textAndIcon2)
            TextField("", text: $inputText)
                .frame(height: 44.0)
                .overlay {
                    RoundedRectangle(cornerRadius: 4.0)
                        .stroke(Color.textAndIcon3, lineWidth: 1.0)
                }
        }
        .padding(.horizontal, 24)
    }
}

struct UsernameInputField_Previews: PreviewProvider {
    static var previews: some View {
        UsernameInputField()
    }
}
