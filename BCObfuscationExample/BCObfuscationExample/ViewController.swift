//
//  ViewController.swift
//  BCObfuscationExample
//
//  Created by Berat Çiçek on 13.10.2018.
//  Copyright © 2018 Berat Çiçek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var encryptedTextLabel: UILabel!
    @IBOutlet private weak var decryptedTextLabel: UILabel!

    // MARK: Private variable declerations

    /// BCObfuscations instance
    private let obfuscation = BCObfuscation()

    /// Encrypted 8-bit unsigned integer array
    private var encrypted: [UInt8]?
}

// MARK: - Actions

extension ViewController {

    @IBAction private func didTapEncryptButton(_ sender: UIButton) {

        guard let text = textField.text,
            !text.isEmpty else {
            return
        }

        encrypted = obfuscation.obfuscate(with: text)
        encryptedTextLabel.text = "Encrypted: \(encrypted ?? [])"
    }

    @IBAction private func didTapDecryptButton(_ sender: UIButton) {

        guard let encrypted = encrypted,
            !encrypted.isEmpty else {
            return
        }

        let plainText = obfuscation.resolve(with: encrypted)
        decryptedTextLabel.text = "Decrypted: \(plainText)"
    }
}

