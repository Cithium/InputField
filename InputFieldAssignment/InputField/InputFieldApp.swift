//
//  InputFieldApp.swift
//  InputField
//
//  Created by Hamza on 2023-05-29.
//

import SwiftUI

@main
struct InputFieldApp: App {
    @State var inputText: String = ""
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                VStack {
                    ScrollView {
                        VStack(spacing: 32) {
                            UsernameInputField()
                            
                            InputField(inputText: inputText, maximumInputCharacters: 8)
                            
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
}
