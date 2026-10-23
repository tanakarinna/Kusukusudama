//
//  CardView.swift
//  Kusukusudama
//
//  Created by tanakarinna on 2026/09/05.
//

import SwiftUI

struct CardView: View {

    @Binding var inputMessage: String
    @FocusState var isFocused: Bool
    @State private var emptyStringGuard = false

    var onComplete: () -> Void

    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Text("メッセージを入力してね")
                    .fontWeight(.bold)
                    .foregroundColor(.brown)
                Spacer()
                VStack {
                    TextField("ここだよ", text: $inputMessage)
                        .textFieldStyle(.roundedBorder)
                        .focused($isFocused)
                        .padding(.horizontal, 16)
                        .onChange(of: inputMessage){
                            emptyStringGuard = false
                        }

                    Text("＊何も入力されてないよ〜")
                        .foregroundColor(Color(red: 0.65, green: 0.24, blue: 0.18))
                        .font(.caption)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 16)
                        .opacity(emptyStringGuard == true ? 1 : 0)
                }
                Spacer()
                Button("入力できた！") {
                    isFocused = false
                    if inputMessage.isEmpty{
                        emptyStringGuard = true
                    } else {
                        onComplete()
                    }
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
    CardView(inputMessage: .constant(""), onComplete: {})
}
