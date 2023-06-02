//
//  InputComponent.swift
//  InputField
//
//  Created by Hamza on 2023-05-30.
//

import SwiftUI

internal enum FocusedInputField: Hashable {
    case secure
    case unsecure
}

internal struct InputComponent: View {
    @EnvironmentObject var manager: InputFieldManager
    
    // Cannot move focused variable to the InputFieldManager, accessing FocusState's value outside of the body of a View will result in a constant Binding of the initial value and will not update.
    @FocusState var focused: FocusedInputField?
    
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    SecureField("", text: $manager.inputText)
                        .focused($focused, equals: .secure)
                        .frame(height: 44.0)
                        .opacity(manager.hideInput ? 1 : 0)
                        .accessibilityHidden(true)
                    TextField("", text: $manager.inputText)
                        .focused($focused, equals: .unsecure)
                        .frame(height: 44.0)
                        .opacity(manager.hideInput ? 0 : 1)
                        .accessibilityHidden(false)
                }
                Button {
                    inputVisibilityToggle()
                } label: {
                    if manager.hideInput {
                        Image("BlindEyeIcon")
                            .padding(.trailing, 8.0)
                            .accessibilityLabel(Text("Show pin"))
                    } else {
                        Image("EyeIcon")
                            .padding(.trailing, 8.0)
                            .accessibilityLabel(Text("Hide pin"))
                    }
                }
            }
            .overlay {
                RoundedRectangle(cornerRadius: 4)
                    .stroke(manager.borderColor, lineWidth: manager.borderWidth)
            }
        }
    }
    
    private func inputVisibilityToggle() {
        manager.hideInput.toggle()
        focused = (manager.hideInput) ? .secure : .unsecure
    }
}

internal struct InputRoundedBorderComponent_Previews: PreviewProvider {
    static var previews: some View {
        let manager = InputFieldManager(inputText: "1234",
                                        maximumInputCharacters: 8)
        InputComponent()
            .environmentObject(manager)
    }
}
