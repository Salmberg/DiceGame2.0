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
    @State var bet = 0
    @State var showingBustSheet = false
    @State var showingBetSheet = false
    

    
    var body: some View {
        
        
        ZStack {
            Color(red: 40/256, green: 108/256, blue: 59/256)
                .ignoresSafeArea()
            
            VStack {
                Text("Your current bet: \(newBet)$")
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
            BustSheet(computerSum: computerSum, playerSum: playerSum)
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
                Text("Player got \(playerSum)")
                    .foregroundColor(.black)
                    .font(.title)
                    .padding()
            }
        }
    }
}
struct BetSheet : View {
    let computerSum : Int
    let playerSum : Int
    @Binding var newBet: Int
    
    
    var body: some View {
        ZStack{
            Color(red: 38/256, green: 108/256, blue: 59/256)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Place your bet")
                    .foregroundColor(.white)
                    .font(.title)
                Spacer()
                
                Text("Your current bet: \(newBet)$")
                    .font(.largeTitle)
                Spacer()
                Button(action: {
                    newBet += 5
                }, label: {
                    Text("Place 5$")
                        .font(.largeTitle)
                        .padding()
                        .foregroundColor(Color.white)
                })
                .background(Color.red)
                .cornerRadius(15.0)
                
                Button(action: {
                    newBet += 10
                    
                }, label: {
                    Text("Place 10$")
                        .font(.largeTitle)
                        .padding()
                        .foregroundColor(Color.white)
                })
                .background(Color.red)
                .cornerRadius(15.0)
                .padding()
                
                Button(action: {
                    newBet += 20
                    
                }, label: {
                    Text("Place 20$")
                        .font(.largeTitle)
                        .padding()
                        .foregroundColor(Color.white)
                })
                .background(Color.red)
                .cornerRadius(15.0)
                
                Spacer()
                Button(action: {
                    newBet = 0
                    
                }, label: {
                    Text("Reset")
                        .font(.largeTitle)
                        .padding()
                        .foregroundColor(Color.white)
                })
                
                
            }
        }
        
    }
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
