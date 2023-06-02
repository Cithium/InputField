//
//  InputFieldTests.swift
//  InputFieldTests
//
//  Created by Hamza on 2023-05-29.
//

import XCTest
import SwiftUI
@testable import InputField

final class InputFieldTests: XCTestCase {
    func testInitialState () throws {
        let expectedState: InputFieldState = .initial
        let expectedInputCount = 0
        let expectedBorderColor = Color.textAndIcon3
        
        let sut = InputField(inputText: "", maximumInputCharacters: 8)
        
        let stateValue = sut.manager.inputFieldState
        let inputValue = sut.manager.inputCounter
        let borderColorValue = sut.manager.borderColor
        
        XCTAssertEqual(expectedState, stateValue, "State of InputField should be - initial")
        XCTAssertEqual(expectedInputCount, inputValue, "Input count should be 0")
        XCTAssertEqual(expectedBorderColor, borderColorValue, "Border color should be .textAndIcon3")
    }
    
    func testFilledState() throws {
        let expectedState: InputFieldState = .filled
        let expectedInputCount = 3
        let expectedBorderColor = Color.interactive
        
        let sut = InputField(inputText: "123", maximumInputCharacters: 8)
        
        let stateValue = sut.manager.inputFieldState
        let inputValue = sut.manager.inputCounter
        let borderColorValue = sut.manager.borderColor
        
        XCTAssertEqual(expectedState, stateValue, "State of InputField should be - filled")
        XCTAssertEqual(expectedInputCount, inputValue, "Input count should be 3")
        XCTAssertEqual(expectedBorderColor, borderColorValue, "Border color should be .interactive")
    }
    
    func testErrorStateManyCharacters() throws {
        let expectedState: InputFieldState = .error
        let expectedInputCount = 9
        let expectedBorderColor = Color.semanticNegative
        
        let sut = InputField(inputText: "123456789", maximumInputCharacters: 8)
        
        let stateValue = sut.manager.inputFieldState
        let inputValue = sut.manager.inputCounter
        let borderColorValue = sut.manager.borderColor
        
        XCTAssertEqual(expectedState, stateValue, "State of InputField should be - error")
        XCTAssertEqual(expectedInputCount, inputValue, "Input count should be 9")
        XCTAssertEqual(expectedBorderColor, borderColorValue, "Border color should be .semanticNegative")
    }
    
    func testErrorStateNonNumericCharacters() throws {
        let expectedState: InputFieldState = .error
        let expectedInputCount = 4
        let expectedBorderColor = Color.semanticNegative
        
        let sut = InputField(inputText: "111A", maximumInputCharacters: 8)
        
        let stateValue = sut.manager.inputFieldState
        let inputValue = sut.manager.inputCounter
        let borderColorValue = sut.manager.borderColor
    
        XCTAssertEqual(expectedState, stateValue, "State of InputField should be - error")
        XCTAssertEqual(expectedInputCount, inputValue, "Input count should be 4")
        XCTAssertEqual(expectedBorderColor, borderColorValue, "Border color should be .semanticNegative")
    }
    
    func testSuccesState() throws {
        let expectedState: InputFieldState = .success
        let expectedInputCount = 8
        let expectedBorderColor = Color.semanticPositive
        
        let sut = InputField(inputText: "12345678", maximumInputCharacters: 8)
        
        let stateValue = sut.manager.inputFieldState
        let inputValue = sut.manager.inputCounter
        let borderColorValue = sut.manager.borderColor
        
        XCTAssertEqual(expectedState, stateValue, "State of InputField should be - success")
        XCTAssertEqual(expectedInputCount, inputValue, "Input count should be 8")
        XCTAssertEqual(expectedBorderColor, borderColorValue, "Border color should be .semanticPositive")
    }
}
