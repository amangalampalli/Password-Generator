//
//  Content-ViewModel.swift
//  PasswordGenerator
//
//  Created by Federico on 05/03/2022.
//

import Foundation
import SwiftUI

extension ContentView {
    class ViewModel: ObservableObject {
        @Published var passwords: [Password] = []
        @Published var containsSymbols = true
        @Published var containsUppercase = false
        @Published var length = 12
        
        init() {
            createPassword()
        }
        
        init(passwd: String) {
            testPassword(passwd: passwd)
        }
        
        func createPassword() {
            let alphabet = "abcdefghijklmnopqrstuvwxyz"
            var base = alphabet + "123456790"
            var newPassword = ""
            
            if containsSymbols {
                base += "!£$%&/()=?^;:_*,.-"
            }
            if containsUppercase {
                base += alphabet.uppercased()
            }
            
            for _ in 0..<length {
                let randomChar = base.randomElement()!
                newPassword += String(randomChar)
            }
            
            let alphabetArray: [String] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
            let specialCharactersArray: [String] = ["(",")","{","}","[","]","/","+","*","$",">",".","|","^","?", "&"]
            let numbersArray: [String] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
            var pool = 0
            let lenght = newPassword.count
            let lettersArray = Array(newPassword)
            var uppercasedAlphabet: [String] = []
            
            for character in alphabetArray {
                uppercasedAlphabet.append(character.uppercased())
            }
            
            for char in lettersArray {
                if alphabetArray.contains(String(char)) {
                    pool += alphabetArray.count
                    break
                }
            }
            
            for char in lettersArray {
                if uppercasedAlphabet.contains(String(char)) {
                    pool += uppercasedAlphabet.count
                    break
                }
            }
            
            for char in lettersArray {
                if numbersArray.contains(String(char)) {
                    pool += numbersArray.count
                    break
                }
            }
            
            for char in lettersArray {
                if specialCharactersArray.contains(String(char)) {
                    pool += specialCharactersArray.count
                    break
                }
            }
            
            let numberPower = pow(Decimal(pool), lenght)
            let numberPowerToDouble = Double(truncating: NSDecimalNumber(decimal: numberPower))
            let possibleCombinaisons = numberPowerToDouble
            let entropy = log2(numberPowerToDouble)
            
            enum strengthColor {
                case red, orange, yellow, green
            }
            var lockColor = strengthColor.red
            var color: Color
            
            if entropy < 28.25 && entropy > 0 {
                lockColor = strengthColor.red
            }
            if entropy < 56.5 && entropy > 28.25 {
                lockColor = strengthColor.orange
            }
            if entropy < 84.75 && entropy > 56.5 {
                lockColor = strengthColor.yellow
            }
            if entropy > 84.75 {
                lockColor = strengthColor.green
            }
            
            switch lockColor {
                case strengthColor.red: color = .red
                case strengthColor.orange: color = .orange
                case strengthColor.yellow: color = .yellow
                case strengthColor.green: color = .green
            }
            
            let entropyPassword = Password(entropy: entropy)
            let combinationPassword = Password(possibleCombinations: possibleCombinaisons)
            let password = Password(password: newPassword, containsSymbols: containsSymbols, containsUppercase: containsUppercase, strengthColor: color, content: [entropyPassword, combinationPassword])
            
            withAnimation {
                passwords.insert(password, at: 0)
            }
        }
        
        func testPassword(passwd: String) {
            let alphabetArray: [String] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
            let specialCharactersArray: [String] = ["(",")","{","}","[","]","/","+","*","$",">",".","|","^","?", "&"]
            let numbersArray: [String] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
            var pool = 0
            let lenght = passwd.count
            let lettersArray = Array(passwd)
            var uppercasedAlphabet: [String] = []
            
            for character in alphabetArray {
                uppercasedAlphabet.append(character.uppercased())
            }
            
            for char in lettersArray {
                if alphabetArray.contains(String(char)) {
                    pool += alphabetArray.count
                    break
                }
            }
            
            for char in lettersArray {
                if uppercasedAlphabet.contains(String(char)) {
                    pool += uppercasedAlphabet.count
                    break
                }
            }
            
            for char in lettersArray {
                if numbersArray.contains(String(char)) {
                    pool += numbersArray.count
                    break
                }
            }
            
            for char in lettersArray {
                if specialCharactersArray.contains(String(char)) {
                    pool += specialCharactersArray.count
                    break
                }
            }
            
            let numberPower = pow(Decimal(pool), lenght)
            let numberPowerToDouble = Double(truncating: NSDecimalNumber(decimal: numberPower))
            let possibleCombinaisons = numberPowerToDouble
            let entropy = log2(numberPowerToDouble)
            
            enum strengthColor {
                case red, orange, yellow, green
            }
            var lockColor = strengthColor.red
            var color: Color
            
            if entropy < 28.25 && entropy > 0 {
                lockColor = strengthColor.red
            }
            if entropy < 56.5 && entropy > 28.25 {
                lockColor = strengthColor.orange
            }
            if entropy < 84.75 && entropy > 56.5 {
                lockColor = strengthColor.yellow
            }
            if entropy > 84.75 {
                lockColor = strengthColor.green
            }
            
            switch lockColor {
                case strengthColor.red: color = .red
                case strengthColor.orange: color = .orange
                case strengthColor.yellow: color = .yellow
                case strengthColor.green: color = .green
            }
            
            let entropyPassword = Password(entropy: entropy)
            let combinationPassword = Password(possibleCombinations: possibleCombinaisons)
            let password = Password(password: passwd, containsSymbols: containsSymbols, containsUppercase: containsUppercase, strengthColor: color, content: [entropyPassword, combinationPassword])
            
            withAnimation {
                passwords.insert(password, at: 0)
            }
        }
    }
}
