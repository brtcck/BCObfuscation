//
//  BCObfuscationExampleTests.swift
//  BCObfuscationExampleTests
//
//  Created by Berat Çiçek on 13.10.2018.
//  Copyright © 2018 Berat Çiçek. All rights reserved.
//

import XCTest
@testable import BCObfuscationExample

class BCObfuscationExampleTests: XCTestCase {

    let obfuscation = BCObfuscation()
    let obfuscationWithKey = BCObfuscation(with: "Hallo!")
    
    func testEncrptHelloText() {

        let encrypted: [UInt8] = [6, 54, 35, 14, 5]

        XCTAssertEqual(obfuscation.obfuscate(with: "Hello"), encrypted)
    }

    func testDecryptHelloText() {

        let encrypted: [UInt8] = [6, 54, 35, 14, 5]

        XCTAssertEqual(obfuscation.resolve(with: encrypted), "Hello")
    }

    func testCompareEncryptionWithDifferentKeys() {

        let plainText = "Hello"

        XCTAssertNotEqual(
            obfuscation.obfuscate(with: plainText),
            obfuscationWithKey.obfuscate(with: plainText)
        )
    }

    func testCompareDecryptionWithDifferentKeys() {

        let encrypted: [UInt8] = [6, 54, 35, 14, 5]

        XCTAssertNotEqual(
            obfuscation.resolve(with: encrypted),
            obfuscationWithKey.resolve(with: encrypted)
        )
    }
}
