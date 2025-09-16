//
//  ContentView.swift
//  MultiAcademy-iOS-Bootcamp-3
//
//  Created by Kayra Akbaş on 16.09.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var count: Int = 0

    var body: some View {
        VStack(spacing: 24) {
            Text("Counter")
                .font(.title)
                .fontWeight(.semibold)

            Text("\(count)")
                .font(.system(size: 64, weight: .bold, design: .rounded))
                .monospacedDigit()

            HStack(spacing: 16) {
                Button {
                    if count > 0 { count -= 1 }
                } label: {
                    Image(systemName: "minus.circle.fill")
                        .font(.system(size: 40))
                }
                .tint(.red)
                .buttonStyle(.borderedProminent)

                Button {
                    count = 0
                } label: {
                    Text("Reset")
                        .font(.headline)
                        .padding(.horizontal, 8)
                }
                .tint(.gray)
                .buttonStyle(.bordered)

                Button {
                    count += 1
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 40))
                }
                .tint(.green)
                .buttonStyle(.borderedProminent)
            }
            .padding(.top, 8)

            Spacer(minLength: 0)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
