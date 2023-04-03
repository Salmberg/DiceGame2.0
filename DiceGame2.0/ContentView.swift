//
//  ContentView.swift
//  DiceGame2.0
//
//  Created by David Salmberg on 2023-04-03.
//

import SwiftUI

struct ContentView: View {
    @State var diceNumber1 = 1
    
    var body: some View {
        
        ZStack {
            Color(red: 40/256, green: 108/256, blue: 59/256)
                .ignoresSafeArea()
            
            
            VStack {
                
                
                Spacer()
                
                HStack {
                    DiceView(theDice: diceNumber1)
                }.onAppear() {
                    newDiceValue()
                }
                Button(action: {
                    newDiceValue()
                    
                }, label: {
                    Text("Roll the Dice")
                        .font(.largeTitle)
                        .padding()
                        .foregroundColor(Color.white)
                })
                .background(Color.red)
                .cornerRadius(15.0)
                Spacer()
            }
        }
    }
    
    
    func newDiceValue(){
        diceNumber1 = Int.random(in: 1...6)
        //diceNumber2 = Int.random(in: 1...6)
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



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
