//
//  ContentView.swift
//  testkeyboard
//
//  Created by Bogdan on 8/14/20.
//  Copyright © 2020 Bogdan Zarioiu. All rights reserved.
//

import SwiftUI



enum ActiveSheet {
    case first
    case second
}


struct ContentView: View {
    @State private var activeSheet: ActiveSheet = .first
    @State private var minValue = 1.0
    @State private var maxValue = 200.0
    @State private var randomNumber = 0
    @State private var howMany = 1.0
    @State private var showSheet = false
    @EnvironmentObject var numbers: RandomNumberGenerator
    
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                VStack(alignment: .leading, spacing: 0) {
                    
                    Text("Choose a range to generate random numbers")
                        .font(.footnote)
                        .foregroundColor(Color("chooseRangeColor"))
                        .padding()
                    Text("Minimum:\(self.minValue, specifier: "%.0f")")
                        .font(.system(size: 40, weight: .black))
                        .foregroundColor(Color("textColor"))
                        .padding()
                    Slider(value: self.$minValue, in: 1...50, step: 1, onEditingChanged: { value in
                        let impactMed = UIImpactFeedbackGenerator(style: .medium)
                        impactMed.impactOccurred()
                    })
                        .padding()
                        .accentColor(Color("chooseRangeColor"))
                    //                    Spacer()
                    //                        .frame(width: 20, height: 40)
                    // Divider()
                    Text("Maximum:\(self.maxValue, specifier: "%.0f")")
                        .font(.system(size: 40, weight: .black))
                        .foregroundColor(Color("textColor"))
                        .padding()
                    Slider(value: self.$maxValue, in: self.minValue...200, step: 1)
                        .padding()
                        .accentColor(Color("chooseRangeColor"))
                    
                    // Divider()
                    HStack {
                        Text("How many?")
                            .font(.system(size: 20, weight: .black))
                            .foregroundColor(Color("textColor"))
                            .padding()
                        Text("\(self.howMany, specifier: "%.0f")")
                            .font(.system(size: 20, weight: .black))
                            .foregroundColor(Color("textColor"))
                        
                    }
                    
                    Slider(value: self.$howMany, in: 1...6, step: 1)
                        .padding()
                        .accentColor(Color("chooseRangeColor"))
                }
                
                
                HStack {
                    Spacer()
                    Button(action: {
                        self.showSheet.toggle()
                        self.activeSheet = .first
                        self.numbers.randomNumbers = []
                        for _ in 1...Int(self.howMany) {
                            if self.minValue == self.maxValue {
                                self.randomNumber = 0
                                self.numbers.randomNumbers.append(self.randomNumber)
                            } else {
                                self.randomNumber = Int.random(in: Int(self.minValue)...Int(self.maxValue))
                                self.numbers.randomNumbers.append(self.randomNumber)
                                
                            }
                            
                            print(self.numbers.randomNumbers.count)
                            
                        }
                        print("========")
                        print(self.numbers.randomNumbers.count)
                        
                    }) {
                        Text("Generate")
                            .accentColor(Color("textColor"))
                            .padding()
                            .font(.system(size: 40, weight: .black))
                        
                        
                    }
                    Spacer()
                }
                Button(action: {
                    self.showSheet.toggle()
                    self.activeSheet = .second
                }
                ){
                    Text("Need more randomness?")
                        .font(.footnote)
                        .foregroundColor(Color("chooseRangeColor"))
                }
                
            }
                
            .frame(width: geometry.size.width, height: geometry.size.height)
                
            .background(Color("backgroundColor"))
                .sheet(isPresented: self.$showSheet) {
                    if self.activeSheet == .first {
                        RandomNumbers().environmentObject(self.numbers)
                    } else {
                        RandomUsernameAndPasswdGenerator()
                    }
            }
            
        }.edgesIgnoringSafeArea([.all])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().colorScheme(.dark)
    }
}






