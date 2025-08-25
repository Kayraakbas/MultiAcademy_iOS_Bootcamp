//
//  CardView.swift
//  ProfileCard
//
//  Created by Kayra Akbaş on 25.08.2025.
//

import SwiftUI

struct CardView: View {
    private var title: String
    private var num: Int
    private var image: String
    private var foregroundColor: Color
    
    init(title: String, num: Int, image: String, backgroundColor: Color) {
        self.title = title
        self.num = num
        self.image = image
        self.foregroundColor = backgroundColor
    }
    
    var body: some View {
        VStack(spacing: 12) {
                ZStack {
                    Rectangle()
                        .frame(width: 120, height: 60, alignment: .center)
                        .cornerRadius(18)
                        .foregroundStyle(foregroundColor)
                        .opacity(0.15)
                        .blur(radius: 5)
                    
                    HStack(){
                        Label("", systemImage: image)
                            .bold()
                            .foregroundStyle(.white.mix(with: .gray, by: 0.6))
                            
                        Text("\(num)")
                            .foregroundStyle(.white.mix(with: .gray, by: 0.6))
                            .bold()
                    }
                }
                Text("\(title)")
                .foregroundStyle(.white.mix(with: .gray, by: 0.6))
                .bold()
                
        }
            
    }
}

#Preview {
    CardView(title: "Followers" , num: 12, image: "person", backgroundColor: .blue)
}
