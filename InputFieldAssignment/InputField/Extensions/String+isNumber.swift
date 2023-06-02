//
//  String+isNumber.swift
//  InputField
//
//  Created by Hamza on 2023-06-01.
//

import Foundation

internal extension String {
    var isNumber: Bool {
        let digitsCharacters = CharacterSet(charactersIn: "0123456789")
        return CharacterSet(charactersIn: self).isSubset(of: digitsCharacters)
    }
}
