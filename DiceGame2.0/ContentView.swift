//
//  ContentView.swift
//  DiceGame2.0
//
//  Created by David Salmberg on 2023-04-03.
//

import SwiftUI

struct ContentView: View {
    @State var computerDice = 0
    @State var playerDice = 0
    @State var computerSum = 0
    @State var playerSum = 0
    @State var showingBustSheet = false


    
    var body: some View {
        
        ZStack {
            Color(red: 40/256, green: 108/256, blue: 59/256)
                .ignoresSafeArea()
            
            
            VStack {
                
                Text("Computers dice")
                    .font(.largeTitle)
                Text("\(computerSum)")
                    .font(.title)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                Spacer()
                
                DiceView(theDice: computerDice)
                
                Text("\(playerSum)")
                    .font(.title)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                DiceView(theDice: playerDice)
                Spacer()
                
                
                HStack {
                    

                    
                }.onAppear() {
                    //newDiceValue()
                }
                Button(action: {
                    rollTheDice()
                    
                }, label: {
                    Text("Roll your dice")
                        .font(.largeTitle)
                        .padding()
                        .foregroundColor(Color.white)
                })
                .background(Color.red)
                .cornerRadius(15.0)
                Spacer()
            }
        }
        .sheet(isPresented: $showingBustSheet, onDismiss: {
            computerSum = 0
            playerSum = 0
        }, content: {
            BustSheet(computerSum: computerSum, playerSum: playerSum)
        })
    }
    
    
    func rollTheDice(){
       newDiceValue()
        
        computerSum += computerDice
        playerSum += playerDice
        
       
    }
    
    func newDiceValue(){
        computerDice = Int.random(in: 1...6)
        playerDice = Int.random(in: 1...6)
      
        
        computerSum += computerDice
        playerSum += playerDice
        
        if (computerSum >= 100 || playerSum >= 100) {
                showingBustSheet = true
            }
    }
}



struct DiceView : View {
    
    let theDice : Int
    var body: some View{
        Image(systemName: "die.face.\(theDice)")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding()
    }
}
struct BustSheet : View {
    let computerSum : Int
    let playerSum : Int
    
    
    var body: some View {
        ZStack{
            Color(red: 38/256, green: 108/256, blue: 59/256)
                .ignoresSafeArea()
            VStack {
                Text("We have a winner!")
                    .foregroundColor(.white)
                    .font(.title)
                Text(" the computer got \(computerSum)")
                    .foregroundColor(.black)
                    .font(.title)
                    .padding()
                Text("and you got \(playerSum)")
                    .foregroundColor(.black)
                    .font(.title)
                    .padding()
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
