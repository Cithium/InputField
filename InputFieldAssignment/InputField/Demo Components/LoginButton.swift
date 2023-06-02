//
//  LoginButton.swift
//  InputField
//
//  Created by Hamza on 2023-06-02.
//

import SwiftUI

struct LoginButton: View {
    var body: some View {
        Button("Login") {
            print("Login Function")
        }
        .frame(maxWidth: .infinity)
        .frame(height: 44.0)
        .font(.system(size: 14.0, weight: .semibold))
        .foregroundColor(.textAndIcon1)
        .overlay {
            RoundedRectangle(cornerRadius: 25.0)
                .stroke(Color.textAndIcon3, lineWidth: 1.0)
        }
        .padding(24.0)
    }
}

struct LoginButton_Previews: PreviewProvider {
    static var previews: some View {
        LoginButton()
    }
}
