//
//  ContentView.swift
//  Prova
//
//  Created by Kayra Akbaş on 22.08.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var isRotated = false
    @State private var scale: CGFloat = 1.0
    @State private var isPlaying: Bool = false
    @State private var position = CGPoint(x: 200, y: 200)
    @State private var new_pos = CGPoint(x: 100, y: 100)
    @State private var frame = CGSize(width: 100, height: 100)
    @State private var isMooved: Bool = false
    @State private var degrees = Double.zero
    @State private var degrees2 = Double.zero

    
    var body: some View {
        ZStack {
            NavigationStack{
                ScrollView{
                    VStack{
                        Spacer()
                        Image(systemName: "globe")
                            .padding()
                            .imageScale(.large)
                            .foregroundStyle(.tint)
                        
                        Capsule()
                            .padding()
                            .shadow(radius: 0.8)
                            .rotation3DEffect(.degrees(degrees), axis: (x: 0, y: 1, z: 0))
                            .animation(.easeInOut(duration: 2.8), value: degrees)
                            .rotationEffect(.degrees(degrees2))
                            .animation(.easeInOut(duration: 2.2), value: degrees2)
                        Spacer()
                        Circle()
                            .fill(Color.red)
                            .frame(width: 50, height: 50)
                            .padding()
                            .scaleEffect(scale)
                            .animation(.spring(.bouncy), value: scale)
                            .onTapGesture {
                                withAnimation {
                                    scale = scale == 1.0 ? 1.5 : 1.0
                                }
                            }
                        
                        Spacer()
                        Image(systemName: isPlaying ? "pause.circle" : "play.circle")
                            .scaleEffect(isPlaying ? 1 : 1.5)
                            .animation(.spring, value: isPlaying)
                            .padding()
                        Spacer()
                        Rectangle()
                            .fill(.blue)
                            .frame(width: frame.width, height: frame.height)
                            .position(isMooved ? position : new_pos)
                            .animation(.spring(.smooth), value: isMooved)
                        Spacer()
                        Button("Animate") {
                            isRotated.toggle()
                            isPlaying.toggle()
                            scale = scale == 1.0 ? 1.5 : 1.0
                            isMooved.toggle()
                            degrees = (degrees == .zero) ? 360 : .zero
                            degrees2 = (degrees2 == .zero) ? 360 : .zero
                        }
                        .buttonBorderShape(.capsule)
                        .buttonStyle(.borderedProminent)
                        .dynamicTypeSize(.xxxLarge)
                    }
                }
                .navigationTitle(Text("kayra").foregroundStyle(.white))
                .background(ignoresSafeAreaEdges: .all)
                .backgroundStyle(.linearGradient(colors: [ .purple.mix(with: .black, by: 0.3), .black, .blue.mix(with: .black, by: 0.5)], startPoint: .top , endPoint: .bottom))
 
                
                    
                
            }
            
        }
    }
}

#Preview {
    ContentView()
}
