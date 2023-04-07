//
//  DiceView.swift
//  DiceGame2.0
//
//  Created by David Salmberg on 2023-04-07.
//

import SwiftUI

struct DiceView : View {
    
    let theDice : Int
    var body: some View{
        Image(systemName: "die.face.\(theDice)")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding()
    }
}
