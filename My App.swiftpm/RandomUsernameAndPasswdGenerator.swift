//
//  RandomUsernameAndPasswdGenerator.swift
//  testkeyboard
//
//  Created by Bogdan on 9/25/20.
//  Copyright © 2020 Bogdan Zarioiu. All rights reserved.
//

import SwiftUI

struct RandomUsernameAndPasswdGenerator: View {
    @State private var adjective: String = ""
    @State private var noun: String = ""
    @State private var number: String = ""
    @State private var passwordLength = 7.0
    @State private var generatedPassword = ""
    var body: some View {
        
        
        VStack(alignment: .leading) {
            VStack(alignment: .leading){
                Text("Here you can generate a username")
                    .font(.footnote)
                    .foregroundColor(Color("chooseRangeColor"))
                    .padding(.top, 50)
                Spacer()
                HStack {
                    Spacer()
                    Text("\(self.adjective)\(self.noun)\(self.number)")
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .font(.system(size: 40, weight: .black))
                        .foregroundColor(Color("textColor"))
                    Spacer()
                }
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        if let adjFileURL = Bundle.main.url(forResource: "adjectives", withExtension: "txt"){
                            if let adjectives = try? String(contentsOf: adjFileURL) {
                                let adjectivesArray = adjectives.components(separatedBy: "\n")
                                self.adjective = adjectivesArray.randomElement() ?? "mighty"
                            }
                            
                        }
                        if let nounsFileURL = Bundle.main.url(forResource: "nouns", withExtension: "txt") {
                            if let nouns = try? String(contentsOf: nounsFileURL).capitalized {
                                let nounsArray = nouns.components(separatedBy: "\n")
                                self.noun = nounsArray.randomElement() ?? "potato"
                            }
                        }
                        
                        if let numbersFileURL = Bundle.main.url(forResource: "numbers", withExtension: "txt") {
                            if let numbers = try? String(contentsOf: numbersFileURL) {
                                let numbersArray = numbers.components(separatedBy: "\n")
                                self.number = numbersArray.randomElement() ?? "52"
                                
                            }
                        }
                        
                    }
                    ){
                        Text("Generate username")
                            .accentColor(Color("textColor"))
                            .font(.system(size: 20, weight: .black))
                    }
                    Spacer()
                }
                
                
            }
            //here ends the first VStack
            
            //Divider()
            Spacer().frame(minWidth: 20, maxWidth: 20, minHeight: 50, maxHeight: 150)
            
            VStack(alignment: .leading) {
                Text("And here you can generate a password")
                    .font(.footnote)
                    .foregroundColor(Color("chooseRangeColor"))
                Text("Choose the password length")
                    .font(.footnote)
                    .foregroundColor(Color("chooseRangeColor"))
                Slider(value: self.$passwordLength, in: 5...20, step: 1)
                    .accentColor(Color("chooseRangeColor"))
                
                Text("\(self.passwordLength, specifier: "%.0f") characters")
                    .font(.system(size: 20, weight: .black))
                    .foregroundColor(Color("textColor"))
                    .padding()
                Spacer()
                HStack {
                    Spacer()
                    Text("\(self.generatedPassword)")
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .font(.system(size: 40, weight: .black))
                        .foregroundColor(Color("textColor"))
                    Spacer()
                }
                
                Spacer()
                
                HStack {
                    Spacer()
                    Button(action: {
                        let passwordCharacters = Array("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890")
                        let randomPassword = String((0..<Int(self.passwordLength)).map{ _ in passwordCharacters[Int(arc4random_uniform(UInt32(passwordCharacters.count)))]})
                        self.generatedPassword = randomPassword
                        
                        
                        
                    }
                    ){
                        Text("Generate password")
                            .accentColor(Color("textColor"))
                            .font(.system(size: 20, weight: .black))
                    }
                    Spacer()
                }
                
            }
            
            
        }.padding()
            .animation(.interactiveSpring())
        
        
    }
}

struct RandomUsernameAndPasswdGenerator_Previews: PreviewProvider {
    static var previews: some View {
        RandomUsernameAndPasswdGenerator()
    }
}
