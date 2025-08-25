//
//  MainTabBar.swift
//  Prova
//
//  Created by Kayra Akbaş on 23.08.2025.
//

import SwiftUI


struct MainTabBar: View {
    @State private var selectedTab = 0
    @State private var customization = TabViewCustomization()
    
    var body: some View {
        TabView(){
            Tab("Home", systemImage: "house") {
                ContentView()
            }
            .customizationID("com.myApp.home")


            Tab("animal", systemImage: "heart") {
                Animals()
            }
            .customizationID("com.myApp.reports")


            TabSection("Categories") {
                Tab("scroll", systemImage: "scroll") {
                    ScrollEffectView()
                }
                .customizationID("com.myApp.climate")


                Tab("shader", systemImage: "app.background.dotted") {
                    ShaderEffectView()
                }
                .customizationID("com.myApp.lights")
                
                Tab("Lights", systemImage: "lightbulb") {
                    ContentView()
                }
                .customizationID("com.myApp.lights")
                
                Tab("Lights", systemImage: "lightbulb") {
                    ContentView()
                }
                .customizationID("com.myApp.lights")
            }
            .customizationID("com.myApp.browse")
        }
        .tabViewStyle(.sidebarAdaptable)
        .tabViewCustomization($customization)
        
    }
}


#Preview {
    MainTabBar()
}
