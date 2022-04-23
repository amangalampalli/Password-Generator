//
//  PasswordModel.swift
//  PasswordGenerator
//
//  Created by Federico on 05/03/2022.
//

import Foundation
import SwiftUI

struct Password: Identifiable, Equatable {
    var id = UUID()
    var password: String?
    var containsSymbols: Bool?
    var containsUppercase: Bool?
    var entropy: Double?
    var possibleCombinations: Double?
    var strengthColor: Color?
    var content: [Password]?
}
