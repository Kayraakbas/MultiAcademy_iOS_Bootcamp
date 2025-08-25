//
//  ShaderBackgroundView.swift
//  ProfileCard
//
//  Created by Kayra Akbaş on 25.08.2025.
//

import SwiftUI

struct ShaderBackgroundView: View, ShapeStyle {
    
    var body: some View {
        MeshGradient(
            width: 3,
            height: 3,
            points:[
                    [0.0, 0.0], [0.5, 0.0], [1.0, 0.0],
                    [0.0, 0.5], [0.9, 0.9], [1.0, 0.5],
                    [0.0, 1.0], [0.5, 1.0], [1.0, 1.0]
                ],
                colors:
                    [
                        .cyan, .blue, .black,
                        .black, .blue, .purple,
                        .black, .black, .purple.mix(with: .blue, by: 0.5),
                    ])
    }
}

#Preview {
    ShaderBackgroundView()
}
