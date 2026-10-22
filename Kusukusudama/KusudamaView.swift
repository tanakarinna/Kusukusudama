//
//  KusudamaView.swift
//  Kusukusudama
//
//  Created by tanakarinna on 2026/10/07.
//

import SwiftUI

struct KusudamaView: View {
    let message: String
    var body: some View {
        Text(message)
    }
}

#Preview {
    KusudamaView(message: "")
}
