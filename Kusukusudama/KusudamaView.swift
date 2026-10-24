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


#Preview {
    KusudamaView(message: "", onRestart: {})
}
