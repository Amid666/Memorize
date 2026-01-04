//
//  ContentView.swift
//  Memorize
//
//  Created by Amid Mamedov on 04.01.2026.
//

import SwiftUI

struct ContentView: View {
    let emojes = ["👻", "😈", "😎", "👽", "👹", "💀", "🎃", "🤡", "🕷️", "💩", "🤖", "🧟"]
    
    var body: some View {
        ScrollView {
            cards
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 110))]) {
            ForEach(emojes.indices, id: \.self) { index in
               CardView(content: emojes[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundStyle(.orange)
    }
}

#Preview {
    ContentView()
}

struct CardView: View {
    let content: String
    @State private var isFaceUp = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content)
                    .font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill()
                .opacity(!isFaceUp ? 1 : 0)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}


