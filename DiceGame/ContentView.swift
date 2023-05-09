//
//  ContentView.swift
//  DiceGame
//
//  Created by Ian Slane on 4/12/23.
//

import SwiftUI

struct ContentView: View {

    @State  var roll1 = 1
    @State  var roll2 = 1

    var body: some View {
        ZStack {
            // Background img
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack {

                // Las Vegas Logo
                Image("diceeLogo")
                    .frame(width:100, height:410 ,alignment: .top)

                // Dice Image Subview
                DiceView(roll1: $roll1, roll2: $roll2)

                // Button action
                Button(action: {
                    roll1 = Int.random(in: 1...6)
                    roll2 = Int.random(in: 1...6)
                }) {
                    // Button Look
                    Text("Roll")
                        .font(.largeTitle)
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                    // Do the Sum!
                  
                }
                .padding()
                .background(.ultraThinMaterial, in: Capsule())
                .frame(width:500, height: 200, alignment: .bottom)
            }
            .padding()
        }
    }
}

struct DiceView: View {
    @Binding var roll1: Int
    @Binding var roll2: Int
    var body: some View {
        HStack{
            Image("dice\(roll1)")
                .imageScale(.large)
                .foregroundColor(.accentColor)
                .scaleEffect(1.4)

            Spacer()
                .frame(maxWidth: 100)

            Image("dice\(roll2)")
                .imageScale(.large)
                .foregroundColor(.accentColor)
                .scaleEffect(1.4)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

