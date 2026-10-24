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
            Circle()
                .trim(from: 0, to: 0.5)
                .fill(Color(red: 0xF2/255, green: 0xB5/255, blue: 0x3B/255))
                .rotationEffect(.degrees(90))
                .frame(width:250, height:250)
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

#Preview {
    KusudamaView(message: "", onRestart: {})
}
