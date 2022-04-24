import Foundation
import SwiftUI

struct Password: Identifiable, Equatable {
    var id = UUID()
    var password: String?
    var containsSymbols: Bool?
    var containsUppercase: Bool?
    var entropy: Double?
    var possibleCombinations: Double?
    var timeToCrack: String? {
        if possibleCombinations != nil {
            let seconds = Double(possibleCombinations!/4000000000)
            let years = String((seconds / 31536000).rounded().formatted(FloatingPointFormatStyle())) + " years, "
            let days = String(((seconds.truncatingRemainder(dividingBy: 31536000)) / 86400).rounded().formatted(FloatingPointFormatStyle())) + " days, "
            let hours = String(((seconds.truncatingRemainder(dividingBy: 86400)) / 3600).rounded().formatted(FloatingPointFormatStyle())) + " hours, "
            let minutes = String(((seconds.truncatingRemainder(dividingBy: 3600)) / 60).rounded().formatted(FloatingPointFormatStyle())) + " minutes, "
            let secondS = String(((seconds.truncatingRemainder(dividingBy: 3600)).truncatingRemainder(dividingBy: (60))).rounded().formatted(FloatingPointFormatStyle())) + " seconds"
            let time = years + days + hours + minutes + secondS
            return time
        }
        return nil
    }
    var strengthColor: Color?
    var content: [Password]?
}
