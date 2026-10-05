//
//  ContentView.swift
//  Kusukusudama
//
//  Created by tanakarinna on 2026/07/11.
//

import SwiftUI

enum Screen {
    case card
    case kusudama
}

struct ContentView: View {
    // 重要なのはScreen型のscreenっていう変数を定義して、初期値をcardにしていること
    @State private var screen: Screen = .card
    var body: some View {
        switch screen {
            case .card:
            CardView(onComplete: {
                screen = .kusudama
            })
                  .padding(.horizontal, 16)
        case .kusudama:
            Text("kusudama")
        }

    }
}

#Preview {
    ContentView()
}
