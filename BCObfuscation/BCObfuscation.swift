//
//  BCObfuscation.swift
//
//  Created by Berat Çiçek on 13.10.2018.
//  Copyright © 2018 Berat Çiçek. All rights reserved.
//

import Foundation

/// A class that obfuscate and resolve a text

class BCObfuscation {

    /// Using for obfuscation
    private var key: String

    // MARK: - Initializers

    init() {

        self.key = String(describing: NSObject.self)
    }

    init(with key: String) {

        self.key = key
    }

    // MARK: - Methods

    /// This method obfuscates the plain text
    ///
    /// - Parameter plainText: Plain text as `String`
    /// - Returns: Encrypted 8-bit unsigned integer as `Array`
    func obfuscate(with plainText: String) -> [UInt8] {

        let text = [UInt8](plainText.utf8)
        let cipher = [UInt8](self.key.utf8)

        var encrypted: [UInt8] = []

        for t in text.enumerated() {
            encrypted.append(t.element ^ cipher[t.offset])
        }

        return encrypted
    }

    /// This method resolves the obfuscated array to plain text
    ///
    /// - Parameter encrypted: Encrypted 8-bit unsigned integer as `Array`
    /// - Returns: Decrypted plain text as `String`
    func resolve(with encrypted: [UInt8]) -> String {

        let cipher = [UInt8](self.key.utf8)

        var decrypted: [UInt8] = []

        for t in encrypted.enumerated() {
            decrypted.append(t.element ^ cipher[t.offset])
        }

        return String(bytes: decrypted, encoding: .utf8)!
    }
}
