//
//  Header.swift
//  InputField
//
//  Created by Hamza on 2023-05-29.
//

import SwiftUI

internal struct HeaderComponent: View {
    @EnvironmentObject var manager: InputFieldManager
    
    var body: some View {
        Text("Pin")
            .fontWithLineHeight(font: .systemFont(ofSize: 14.0), lineHeight: 22)
            .foregroundColor(.textAndIcon2)
    }
}

internal struct Header_Previews: PreviewProvider {
    static var previews: some View {
        let manager = InputFieldManager(inputText: "1234", maximumInputCharacters: 8)
        
        HeaderComponent()
            .environmentObject(manager)
    }
}
