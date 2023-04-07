//
//  BetSheet.swift
//  DiceGame2.0
//
//  Created by David Salmberg on 2023-04-07.
//

import SwiftUI

struct BetSheet : View {
    let computerSum : Int
    let playerSum : Int
    @Binding var newBet: Int
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        ZStack{
            Color(red: 38/256, green: 108/256, blue: 59/256)
                .ignoresSafeArea()
            VStack {
                Text("Place your bet")
                    .foregroundColor(.white)
                    .font(.title)
                
                Text("Your current bet: \(newBet)$")
                    .font(.largeTitle)
                
                Spacer()
                
                Button(action: {
                    newBet += 5
                }, label: {
                    Text("Place 5$")
                        .font(.title)
                        .padding()
                        .foregroundColor(Color.white)
                })
                .background(Color.red)
                .cornerRadius(15.0)
                
                Button(action: {
                    newBet += 10
                    
                }, label: {
                    Text("Place 10$")
                        .font(.title)
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
                        .font(.title)
                        .padding()
                        .foregroundColor(Color.white)
                })
                .background(Color.red)
                .cornerRadius(15.0)
                
                Spacer()
                HStack{
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Computer")
                            .font(.title)
                            .padding()
                            .foregroundColor(Color.white)
                    })
                    .background(Color.black)
                    .cornerRadius(15.0)
                    .padding(30)

                    Spacer()
                    
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Player")
                            .font(.title)
                            .padding()
                            .foregroundColor(Color.white)
                    })
                    .background(Color.black)
                    .cornerRadius(15.0)
                    .padding(30)

                }

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
