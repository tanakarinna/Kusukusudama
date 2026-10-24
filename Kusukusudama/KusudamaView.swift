//
//  KusudamaView.swift
//  Kusukusudama
//
//  Created by tanakarinna on 2026/10/07.
//

import SwiftUI

struct KusudamaView: View {
    let message: String
    var onRestart: () -> Void
    var body: some View {
        VStack {
            ZStack {
                HalfCircleView(angle: 90)
                HalfCircleView(angle: -90)
            }
            Text(message)
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

#Preview {
    KusudamaView(message: "", onRestart: {})
}
