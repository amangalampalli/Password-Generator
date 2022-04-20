//
//  RandomNumberGenerator.swift
//  testkeyboard
//
//  Created by Bogdan on 8/14/20.
//  Copyright © 2020 Bogdan Zarioiu. All rights reserved.
//

import Foundation
import SwiftUI

class RandomNumberGenerator: ObservableObject {

   @Published var randomNumbers: [Int]
    
    init() {
        self.randomNumbers = []
    }

 
}

struct RandomNumberGenerator_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
