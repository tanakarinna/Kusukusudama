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
    @State private var maxMessageGuard = false
    private let maxMessage = 16

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
                            maxMessageGuard = false
                        }

                    if emptyStringGuard {
                        Text("＊何も入力されてないよ〜")
                            .foregroundColor(Color(red: 0.65, green: 0.24, blue: 0.18))
                            .font(.caption)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 16)
                    } else if maxMessageGuard {
                        Text("＊文字数が多すぎるよ")
                            .foregroundColor(Color(red: 0.65, green: 0.24, blue: 0.18))
                            .font(.caption)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 16)
                    } else {
                        Text("\(maxMessage)文字までだよ")
                            .foregroundColor(Color(.brown))
                            .font(.caption)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 16)
                    }
                }
                Spacer()
                Button("入力できた！") {
                    isFocused = false
                    if inputMessage.isEmpty{
                        emptyStringGuard = true
                    } else if inputMessage.count > maxMessage {
                        maxMessageGuard = true
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
