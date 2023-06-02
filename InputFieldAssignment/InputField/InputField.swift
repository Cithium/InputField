//
//  InputField.swift
//  InputField
//
//  Created by Hamza on 2023-05-29.
//

import SwiftUI

/// An input field with a header component, input component and a footnote component that contains text and an input counter. This View uses a internal manager object `InputFieldManager` that has an `InputFieldState` object that will help the manager automatically decide the appearance of `InputField` depending on the user input.
/// - Parameters:
///   - inputText: String variable for the user input.
///   - maximumCharacters: Int variable for maximum amount of input characters.
struct InputField: View {
    @ObservedObject internal var manager: InputFieldManager
    
    // Assigment note:
    // Here we could possibly modify the initializer with increased amount of variables for such things as custom header text or footnote text
    init(inputText: String, maximumInputCharacters: Int){
        
        manager = InputFieldManager(inputText: inputText,
                                    maximumInputCharacters: maximumInputCharacters)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4.0) {
            HeaderComponent()
            
            InputComponent()
            
            FootnoteComponent()
        }
        .environmentObject(manager)
        .padding(.horizontal, 24)
    }
}

struct InputField_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack(spacing: 32) {
                        UsernameInputField()
                        
                        InputField(inputText: "", maximumInputCharacters: 8)
                        
                        Spacer()
                    }
                }
                LoginButton()
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("InputField Demo")
        }
    }
}
