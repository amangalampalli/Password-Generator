//
//  RandomNumbers.swift
//  testkeyboard
//
//  Created by Bogdan on 8/15/20.
//  Copyright © 2020 Bogdan Zarioiu. All rights reserved.
//

import SwiftUI

struct RandomNumbers: View {
    @EnvironmentObject var randomNumbers: RandomNumberGenerator
    @Environment(\.presentationMode) var presentationMode
    @State private var blurLevel: CGFloat = 75
    //@State private var isVisible = false
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color("backgroundColor")
                VStack(alignment: .center) {
                    
                    if self.randomNumbers.randomNumbers.count == 1 {
                        Text("\(self.randomNumbers.randomNumbers[0])")
                        
                        
                    }
                    if self.randomNumbers.randomNumbers.count == 2 {
                        Text("\(self.randomNumbers.randomNumbers[0])")
                        Text("\(self.randomNumbers.randomNumbers[1])")
                        
                    }
                    if self.randomNumbers.randomNumbers.count == 3 {
                        Text("\(self.randomNumbers.randomNumbers[0])")
                        Text("\(self.randomNumbers.randomNumbers[1])")
                        Text("\(self.randomNumbers.randomNumbers[2])")
                        
                    }
                    
                    if self.randomNumbers.randomNumbers.count == 4 {
                        Text("\(self.randomNumbers.randomNumbers[0])")
                        Text("\(self.randomNumbers.randomNumbers[1])")
                        Text("\(self.randomNumbers.randomNumbers[2])")
                        Text("\(self.randomNumbers.randomNumbers[3])")
                        
                    }
                    
                    if self.randomNumbers.randomNumbers.count == 5 {
                        Text("\(self.randomNumbers.randomNumbers[0])")
                        Text("\(self.randomNumbers.randomNumbers[1])")
                        Text("\(self.randomNumbers.randomNumbers[2])")
                        Text("\(self.randomNumbers.randomNumbers[3])")
                        Text("\(self.randomNumbers.randomNumbers[4])")
                        
                    }
                    
                    if self.randomNumbers.randomNumbers.count == 6 {
                        Text("\(self.randomNumbers.randomNumbers[0])")
                        Text("\(self.randomNumbers.randomNumbers[1])")
                        Text("\(self.randomNumbers.randomNumbers[2])")
                        Text("\(self.randomNumbers.randomNumbers[3])")
                        Text("\(self.randomNumbers.randomNumbers[4])")
                        Text("\(self.randomNumbers.randomNumbers[5])")
                        //
                        
                    }
                    
                    
                }.frame(width: geometry.size.width, height: geometry.size.height)
                    .font(.system(size: 100, weight: .black))
                    .foregroundColor(Color("textColor"))
                    .allowsTightening(true)
                    .minimumScaleFactor(0.6)
               
                
                
                
            }
        }
    }
}

struct RandomNumbers_Previews: PreviewProvider {
    static var previews: some View {
        RandomNumbers()
    }
}
