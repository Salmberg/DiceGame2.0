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
    @State var newBet = 0
    @State var amount = 0
    //@State var bet = 0
    @State var showingBustSheet = false
    @State var showingBetSheet = false
    

    
    var body: some View {
        
        
        ZStack {
            Color(red: 40/256, green: 108/256, blue: 59/256)
                .ignoresSafeArea()
            
            VStack {
                Text("Your current bet: \(newBet)$")
                Text("Your current amount: \(amount)$")
                HStack {
                    Spacer()
                    Text("Computer")
                        .font(.largeTitle)
                        .padding(30)
                   
                    Spacer()
                    Text("Player")
                        .font(.largeTitle)
                        .padding(30)
                    
                                    }
                HStack {
                    
                    Text("\(computerSum)")
                        .font(.title)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(70)
                    
                    Spacer()
                    Text("\(playerSum)")
                        .font(.title)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(70)
                  

                }
                HStack {
                    DiceView(theDice: computerDice)
                    
                    DiceView(theDice: playerDice)
                                    }
        
                HStack {
                    
                }.onAppear() {
                    //newDiceValue()
                }
                Button(action: {
                    rollTheDice()
                    
                }, label: {
                    Text("Roll the dice")
                        .font(.largeTitle)
                        .padding()
                        .foregroundColor(Color.white)
                })
                .background(Color.red)
                .cornerRadius(15.0)
                Spacer()
                
                Button(action: {
                    //go to place bet view
                    showingBetSheet = true
                }, label: {
                    Text("Bet on the players")
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
            BustSheet(computerSum: computerSum, playerSum: playerSum, newAmount: amount)
        })
        
        .sheet(isPresented: $showingBetSheet, onDismiss: {
            computerSum = 0
            playerSum = 0
            
            }, content: {
                BetSheet(computerSum: computerSum, playerSum: playerSum, newBet: $newBet)
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

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }


