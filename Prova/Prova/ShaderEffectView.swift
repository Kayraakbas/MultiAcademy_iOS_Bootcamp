//
//  ShaderEffectView.swift
//  Prova
//
//  Created by Kayra Akbaş on 24.08.2025.
//

import SwiftUI

struct ShaderEffectView: View {
    @State private var degrees = Double.zero
    
    var body: some View {
        ZStack{
            MeshGradient(
                width: 3,
                height: 3,
                points:[
                    [0.0, 0.0], [0.5, 0.0], [1.0, 0.0],
                    [0.0, 0.5], [0.9, 0.3], [1.0, 0.5],
                    [0.0, 1.0], [0.5, 1.0], [1.0, 1.0]
                ],
                colors:
                    [
                        .black,.black,.black,
                        .black, .blue, .purple,
                        .black, .green, .purple.mix(with: .blue, by: 0.5),
                    ])
        }
    }
}

#Preview {
    ShaderEffectView()
}
