//
//  ContentView.swift
//  calculator
//
//  Created by Prashant Nigam on 17/03/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            
            VStack {
                Spacer(minLength: 300)
                
                HStack {
                    Spacer()
                    Text("120 x 3 + 608 + 1080")
                        .fontWeight(.regular)
                        .font(.body)
                        .foregroundStyle(Color("lightText"))
                        .padding(.bottom, 1)
                        .padding(.horizontal)
                }
                
                HStack {
                    Spacer()
                    Text("2,048")
                        .fontWeight(.bold)
                        .font(.largeTitle)
                        .foregroundStyle(Color("text"))
                        .padding(.horizontal)
                }
                
                ZStack {
                    Color("surface")
                        .cornerRadius(36)
                        .ignoresSafeArea()
                        .frame(height: 500)
                    
                    HStack(spacing: 35) {
                        VStack(spacing: 40) {
                            CircularButton(label: "+/-")
                            NumButton(label: "7")
                            NumButton(label: "4")
                            NumButton(label: "1")
                            GradientNumButton(label: "AC")
                        }
                        
                        VStack(spacing: 40) {
                            CircularButton(label: "%")
                            NumButton(label: "8")
                            NumButton(label: "5")
                            NumButton(label: "2")
                            NumButton(label: "0")
                        }
                        
                        VStack(spacing: 40) {
                            CircularButton(label: "÷")
                            NumButton(label: "9")
                            NumButton(label: "6")
                            NumButton(label: "3")
                            NumButton(label: ".")
                        }
                        
                        VStack(spacing: 40) {
                            BackButton()
                            GradientNumButton(label: "×")
                            GradientNumButton(label: "-")
                            GradientNumButton(label: "+")
                            GradientNumButton(label: "=")
                        }
                    }.padding(.bottom)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}


struct NumButton<T> : View where T: StringProtocol{
    
    var label: T
    
    init(label: T) {
        self.label = label
    }
    
    var body: some View {
        Text(label)
            .fontWeight(.regular)
            .font(.title)
            .foregroundStyle(Color("lightText"))
    }
}

struct GradientNumButton<T> : View where T: StringProtocol{
    
    var label: T
    
    init(label: T) {
        self.label = label
    }
    
    var body: some View {
        
        Text(label)
            .fontWeight(.regular)
            .font(.title)
            .overlay {
                LinearGradient(
                    colors: [Color("pink"), Color("orange")],
                    startPoint: .leading,
                    endPoint: .trailing
                ).mask {
                    Text(label)
                        .fontWeight(.regular)
                        .font(.title)
                }
            }
    }
}

struct CircularButton<T> : View where T: StringProtocol{
    
    var label: T
    
    init(label: T) {
        self.label = label
    }
    
    var body: some View {
        
        ZStack {
            Circle()
                .fill(Color("button"))
                .frame(width: 60)
            
            GradientNumButton(label: label)
        }
        
    }
}



struct BackButton : View {
    
    var body: some View {
        
        ZStack {
            Circle()
                .fill(Color("button"))
                .frame(width: 60)
            
            Image(systemName: "delete.backward")
                .overlay {
                    LinearGradient(
                        colors: [Color("pink"), Color("orange")],
                        startPoint: .leading,
                        endPoint: .trailing
                    ).mask {
                        Image(systemName: "delete.backward")
                    }
                }
            
        }
        
    }
}
