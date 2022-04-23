//
//  ContentView.swift
//  PasswordGenerator
//
//  Created by Federico on 05/03/2022.
//

import SwiftUI
import CoreHaptics

struct ContentView: View {
    @StateObject private var vm = ViewModel()
    @State var sliderValue: Double = 12
    @State private var showingAlert = false
    @State private var passwd: String = ""
    var intProxy: Binding<Double>{
            Binding<Double>(get: {
                //returns the score as a Double
                return Double(vm.length)
            }, set: {
                let generator = UIImpactFeedbackGenerator(style: .rigid)
                generator.impactOccurred(intensity: 1)
                vm.length = Int($0)
            })
        }
    var body: some View {
        Text("PassGen").bold().font(.title)
        Form {
            Section("Options") {
                Toggle("Symbols", isOn: $vm.containsSymbols)
                Toggle("Uppercase", isOn: $vm.containsUppercase)
                HStack{
                    Text("Character count: \(vm.length, specifier: "%i")").padding(.trailing, 10)
                    Spacer()
                    Slider(value: intProxy , in: 6.0...18.0, step: 1.0)
                }
               
                Button("Generate Password", action: vm.createPassword)
                    .centerH()
                TextField("Enter a password to test", text: $passwd)
                Button("Test Entered Password", action: {
                    if passwd != ""{
                        vm.testPassword(passwd: passwd)
                        passwd=""
                    }
                })
                
            }
            Section("Passwords") {
                List(vm.passwords) { password in
                    DisclosureGroup {
                                    if password.content != nil {
                                        ForEach(password.content!) { item in
                                            if (item.entropy != nil){
                                                HStack{
                                                    Text("Entropy: ")
                                                    Spacer()
                                                    Text("\(item.entropy ?? 0) bits")
                                                }
                                            }
                                            else {
                                                HStack{
                                                    Text("Possible Combinations: ")
                                                    Spacer()
                                                    Text("\((item.possibleCombinations?.formatted(FloatingPointFormatStyle())) ?? "0") combinations")
                                                }
                                            }
                                            
                                        }
                                        ForEach(password.content!) { item in
                                            if (item.entropy != nil){
                                                HStack{
                                                    Text("Weak").font(.footnote).offset(x: 6, y: 6)
                                                    StrengthMeter(entropy: item.entropy ?? 0)
                                                    Text("Strong").font(.footnote).offset(x: -6, y: 6)
                                                }
                                            }
                                        }
                                    }
                        HStack{
                            Spacer()
                            Button("Copy to Clipboard") {
                                let pasteboard = UIPasteboard.general
                                pasteboard.string = password.password
                                showingAlert = true
                            }.alert("Password Copied to Clipboard!", isPresented: $showingAlert){
                                Button("Dismiss", role: .cancel) {}
                            }
                            Spacer()
                        }
                        HStack{
                            Spacer()
                            Button("Delete Password") {
                                if let index = vm.passwords.firstIndex(of: password) {
                                    vm.passwords.remove(at: index)
                                }
                            }
                            .foregroundColor(.red)
                            Spacer()
                        }
                                } label: {
                                    HStack {
                                        Text("\(password.password ?? "Default")")
                                            .padding()
                                            .textSelection(.enabled)
                                        Spacer()
                                        Image(systemName: "lock.fill")
                                            .foregroundColor(password.strengthColor)
                                        
                                    }
                                }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
