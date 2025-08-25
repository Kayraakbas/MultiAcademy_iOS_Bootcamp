//
//  ContentView.swift
//  Prova
//
//  Created by Kayra Akbaş on 22.08.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var scale: Double = 1.0
    @State private var userAgreed: Bool = false
    @State private var cardColor: Color = .black.mix(with: .purple, by: 0.8, in: .perceptual)
    @State private var followersCount: Int = 15
    @State private var isFollowing: Bool = false
    
    private var lorem: String = "Recent Computer Engineering graduate passionate about building innovative software solutions. I develop iOS mobile applications using Swift, focusing on performance, user experience, and clean design. Building exciting, real-world projects within the 42 Network’s rigorous, project-based learning environment. Skilled in Swift, SwiftUI, C/C++, Python and Git, I thrive in collaborative, fast-paced settings where problem-solving meets creativity."

    
    var body: some View {
        ZStack {
            NavigationStack{
                ZStack{
                    ShaderBackgroundView()
                        .ignoresSafeArea()
                    ScrollView{
                        VStack{
                            Image(.IMG_2689)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 150)
                                .clipShape(.circle)
                                .padding()
                                .scaleEffect(scale)
                                .animation(.easeInOut, value: scale)
                                .onTapGesture {
                                    scale = scale == 1.0 ? 1.2 : 1.0
                                }
                            Text("Ömer Kayra Akbaş")
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                                .padding()
                                .foregroundStyle(.primary.opacity(0.7))
                            
                            Text("Passionate iOS deceloper")
                            
                            HStack(){
                                CardView(title: "Followers", num: followersCount, image: "person.fill", backgroundColor: cardColor)
                                
                                CardView(title: "Following", num: 12, image: "person.3.fill", backgroundColor: cardColor)
                                
                                CardView(title: "Likes", num: 12, image: "heart.fill", backgroundColor: cardColor)
                            }
                            
                            Text("About Me")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundStyle(.white.opacity(0.7))
                                .frame(maxWidth: .infinity, alignment: .leadingFirstTextBaseline)
                                .padding()
                            
                          
                            Text("\(lorem)")
                                .foregroundStyle(.white.opacity(0.7))
                                .padding()
                            HStack(spacing: 16){
                                
                                Button{
                                    
                                } label: {
                                    Text("Message")
                                }
                                    .buttonStyle(.borderedProminent)
                                    .buttonBorderShape(.capsule)
                                    .padding(.horizontal)
                                
                                Button{
                                    isFollowing.toggle()
                                    followersCount = isFollowing ? followersCount + 1 : followersCount - 1
                                } label: {
                                    Text(isFollowing ? "Unfollow" : "Follow")
                                }
                                .buttonStyle(.borderedProminent)
                                .buttonBorderShape(.capsule)
                                .padding(.horizontal)
                            }
                        }
                    }
                }
                .navigationTitle(Text("Kayraakbas"))
            }
            
        }
    }
}

#Preview {
    ContentView()
}
