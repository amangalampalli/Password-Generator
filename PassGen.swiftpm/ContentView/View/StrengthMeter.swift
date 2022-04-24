//
//  SwiftUIView.swift
//  
//
//  Created by Aditya Mangalampalli on 4/22/22.
//

import SwiftUI

struct StrengthMeter: View {
    
    @State var offset = CGFloat()
    let entropy: Double
    let gradient = Gradient(stops: [
        .init(color: .red, location: 0),
        .init(color: .orange, location: 0.25),
        .init(color: .yellow, location: 0.75),
        .init(color: .green, location: 1),
    ])
    let ratio:CGFloat = 250
    
    var body: some View {
        
        VStack {
            
            VStack(alignment: .center) {
                
                Spacer().frame(height: 15)
                
                HStack {
                    
                    Spacer()
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(LinearGradient(gradient: gradient, startPoint: .leading, endPoint: .trailing))
                        .frame(width: 190 * UIScreen.main.bounds.width / ratio, height: 17)
                        .overlay(
                            VStack(alignment: .center) {
                                Rectangle()
                                    .fill(LinearGradient(gradient: gradient, startPoint: .leading, endPoint: .trailing))
                                    .frame(width: 190 * UIScreen.main.bounds.width / ratio, height: 80)
                            }
                            
                                .mask(
                                    VStack(alignment: .center) {
                                        Image(systemName: "triangle.fill")
                                            .rotationEffect(Angle(degrees: 180))
                                            .font(.system(size: 10))
                                    }
                                        .offset(x: calculateOffset(entropy: entropy), y: -20)
                                        .foregroundColor(.blue)
                                        .shadow(radius: 1)
                                        .transition(.opacity)))
                    
                    Spacer()
                    
                }
            }
        }
    }
}



extension StrengthMeter {
    
    func calculateOffset(entropy: Double) -> CGFloat {
        
        switch(entropy) {
        case 0...30:
            return ((-190 * UIScreen.main.bounds.width / ratio) / 2) + 5 * UIScreen.main.bounds.width / ratio
        case 100...120:
            return ((-190 * UIScreen.main.bounds.width / ratio) / 2) + 186 * UIScreen.main.bounds.width / ratio
        default:
            return ((-190 * UIScreen.main.bounds.width / ratio) / 2) + entropy * UIScreen.main.bounds.width / ratio
        }
    }
}

struct SecurityInfoViewswift_Previews: PreviewProvider {
    static var previews: some View {
        Form {
            StrengthMeter(entropy: 0)
                .preferredColorScheme(.dark)
        }
    }
}
