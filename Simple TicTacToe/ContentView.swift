//
//  ContentView.swift
//  Simple TicTacToe
//
//  Created by Danang Wijaya on 05/06/21.
//

import SwiftUI

struct ContentView: View {
    let cols: [GridItem] = [GridItem(.flexible()),
                           GridItem(.flexible()),
                           GridItem(.flexible())]
    @State private var moves: [Move?] = Array(repeating: nil, count:9)
    @State private var isHumanTurn = true
    var body: some View {
        GeometryReader{ geo in
            VStack{
                Spacer()
                Spacer()
                LazyVGrid(columns:cols,spacing:5){
                    ForEach(0..<9){i in
                        ZStack{
                            Circle()
                                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/).opacity(0.5)
                                .frame(width: geo.size.width/3-15, height: geo.size.width/3-14)
                            Image(systemName:moves[i]?.indicator ?? "")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.white)
                        }
                        .onTapGesture {
                            moves[i] = Move(player: isHumanTurn ? .human : .bot, index: i)
                            isHumanTurn.toggle()
                        }
                    }
                }
                Spacer()
                
        }
    }
}
    
    enum Player {
        case human, bot
    }
    struct Move {
        let player : Player
        let index: Int
        var indicator: String{
            return player == .human ? "xmark" : "circle"
        }
        
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
