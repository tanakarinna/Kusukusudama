//
//  CardView.swift
//  Kusukusudama
//
//  Created by tanakarinna on 2026/09/05.
//

import SwiftUI

struct CardView: View {

    @State var inputMessage = ""
    @FocusState var isFocused: Bool
    var body: some View {
        ZStack {

            VStack {
                Spacer()
                Text("メッセージを入力してね")
                    .fontWeight(.bold)
                    .foregroundColor(.brown)
                Spacer()
                TextField("ここだよ", text: $inputMessage)
                    .textFieldStyle(.roundedBorder)
                    .focused($isFocused)
                    .padding(.horizontal, 16)
                Spacer()
                Button("入力できた！") {
                    isFocused = false
                }
                .fontWeight(.bold)
                .foregroundColor(.brown)
                .padding(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.brown, lineWidth: 1)
                )
                Spacer()
            }
            .padding(16)
            .frame(maxWidth: .infinity)
            .frame(height: 250)
            .background(
                Color.white
                    .cornerRadius(16)
                    .shadow(radius: 16)
            )
        }
    }
}

#Preview {
    CardView()
}
