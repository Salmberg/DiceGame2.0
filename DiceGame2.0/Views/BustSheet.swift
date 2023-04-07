//
//  BustSheet.swift
//  DiceGame2.0
//
//  Created by David Salmberg on 2023-04-07.
//

import SwiftUI

struct BustSheet : View {
    let computerSum : Int
    let playerSum : Int
    let newAmount : Int
    
    
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
