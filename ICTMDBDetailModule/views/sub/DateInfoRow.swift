//
//  SwiftUIView.swift
//  ICTMDBDetailModule
//
//  Created by Engin Gülek on 24.12.2025.
//

import SwiftUI

struct DateInfoRow: View {
    let label: String
    let value: String
    var body: some View {
        HStack {
            Text(label).fontWeight(.bold)
            Text(value)
        }
        .font(.subheadline)
    }
}

