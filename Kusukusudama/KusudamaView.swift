//
//  KusudamaView.swift
//  Kusukusudama
//
//  Created by tanakarinna on 2026/10/07.
//

import SwiftUI

struct KusudamaView: View {
    @State private var isOpened = false
    let message: String
    var onRestart: () -> Void
    var body: some View {
        ZStack {
            TaremakuView(message: message)
                .mask(alignment: .top) {
                    Rectangle()
                        .frame(height: isOpened ? 480 : 0)
                }
                .offset(y: 55)

            ZStack {
                HalfCircleView(angle: isOpened ? 120 : 90)
                    .offset(x: isOpened ? -61 : 0)
                HalfCircleView(angle: isOpened ? -120 : -90)
                    .offset(x: isOpened ? 61 : 0)
            }
            .offset(y:-180)
            .onTapGesture {
                withAnimation(.easeOut(duration: 0.3)) {
                    isOpened.toggle()
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(alignment: .topLeading) {
            Button {
                onRestart()
            } label: {
                Image(systemName: "arrow.counterclockwise")
            }
            .buttonStyle(.glass)
            .padding(16)
        }
    }
}

private struct HalfCircleView: View {
    let angle: Double
    var body: some View {
        Circle()
            .trim(from: 0, to: 0.5)
            .fill(Color(red: 0xF2/255, green: 0xB5/255, blue: 0x3B/255))
            .overlay {
                Circle()
                    .trim(from: 0, to: 0.5)
                    .stroke(Color(red: 0xC9/255, green: 0x8A/255, blue: 0x1B/255), lineWidth: 4)
            }
            .rotationEffect(.degrees(angle))
            .frame(width:250, height:250)
    }
}

private struct TaremakuView: View {
    let message: String
    var body: some View {
        RoundedRectangle(cornerRadius: 6)
            .fill(Color(red: 0xFB/255, green: 0xF3/255, blue: 0xE4/255))
            .frame(width:125,height:480)
            .overlay {
                VStack {
                    ForEach(Array(message).indices, id: \.self) { index in
                        Text(String(Array(message)[index]))
                            .foregroundStyle(Color(red: 0x5A/255, green: 0x3E/255, blue: 0x2B/255))
                    }
                }
            }
    }
}

#Preview {
    KusudamaView(message: "おおきいたこやき", onRestart: {})
}
