//
//  PersonView.swift
//  Prova
//
//  Created by Kayra Akbaş on 23.08.2025.
//

import SwiftUI

struct Animal: Identifiable, Hashable {
    let name: String
    let image: String
    let id = UUID().uuidString
}

 

struct Animals: View {
    @State private var selected: Bool = false
    @State private var dummyData = [
        Animal(name: "Lion", image: "e404e503-8c05-4a4f-99d2-506710b2c6aa"),
        Animal(name: "Elephant", image: "IMG_2685"),
        Animal(name: "Tiger", image: "IMG_2689"),
        Animal(name: "Giraffe", image: "IMG_2690"),
        Animal(name: "Zebra", image: "IMG_2691"),
        Animal(name: "Panda", image: "IMG_2692")
    ]
    var body: some View {
        ScrollView(.horizontal){
            ZStack {
//                MeshGradient(
//                    width: 4,
//                    height: 3,
//                    points:[
//                        [0.0, 0.0], [0.4, 0.0], [0.8, 0.0], [1, 0],
//                        [0.0, 0.5], [0.1, 0.4], [0.5, 0.4], [1, 0.5],
//                        [0.0, 1.0], [0.3, 1.0], [0.6, 1], [1, 1]
//                    ],
//                    colors:
//                        [
//                            .black, .cyan, .green, .yellow,
//                            .yellow, .green.mix(with: .black, by: 0.5), .cyan, .red,
//                            .green.mix(with: .black, by: 0.5), .brown.mix(with: .black, by: 0.4), .cyan, .green.mix(with: .blue, by: 0.5),
//                    ])
                
                LazyHStack(alignment: .top, spacing: 22) {
                    ForEach(dummyData, id: \.self) { data in
                        ZStack {
                            
                            AnimalPhoto(image: data.image, name: data.name)
                                .scrollTransition(
                                    axis: .horizontal,
                                ) { content, phase in
                                    content
                                        .rotationEffect(.degrees(phase.value * 2.5))
                                        .offset(x: phase.value * -150)
                                        //.blur(radius: phase.isIdentity ?  0 : 6)
                                        //.scaleEffect(x: phase.isIdentity ? 1.0 : 0.6, y: phase.isIdentity ? 1.0 : 0.6)
                                        .opacity(phase.isIdentity ?  1 : 0)
                                }
                                .containerRelativeFrame(.horizontal)
                                .clipShape(RoundedRectangle(cornerRadius: 32))
                            
                        }
                    }
                }
            }
        }.scrollTargetBehavior(.viewAligned)
        
       
    }

}


#Preview {
    Animals()
}
