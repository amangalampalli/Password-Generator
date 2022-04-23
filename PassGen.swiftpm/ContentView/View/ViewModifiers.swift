//
//  ViewModifiers.swift
//  PasswordGenerator
//
//  Created by Federico on 05/03/2022.
//

import Foundation
import SwiftUI

extension View {
    func centerH() -> some View {
        HStack {
            Spacer()
            self
            Spacer()
        }
    }
    
    func addNavigationView(title: String) -> some View{
        NavigationView {
            self
                .navigationTitle(title)
        }
    
    }
}
