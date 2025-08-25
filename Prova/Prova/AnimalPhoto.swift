//
//  AnimalPhoto.swift
//  Prova
//
//  Created by Kayra Akbaş on 24.08.2025.
//

import SwiftUI

struct AnimalPhoto: View {
    @State private var image: String
    @State private var name: String
    
    init(image: String, name: String) {
        self.image = image
        self.name = name
    }
    
    var body: some View {
        VStack(alignment: .center){
            Image(image)
                .resizable()
                .scaledToFit()
                .cornerRadius(32)
                .frame(height: 440,alignment: .center)
                .padding(.horizontal)
               
            Text(name)
        }
    }
}

#Preview {
    AnimalPhoto(image: "IMG_2685" , name: "Kayra")
}
