//
//  HomeView.swift
//  Bouncy
//
//  Created by Basheer Abdulmalik on 05/08/2024.
//

import SwiftUI

struct HomeView: View {
    
    @State private var didPressPlay = false
    
    var body: some View {
        ZStack {
            HomeBackgroundView()
            
            VStack {
                Spacer()
                
                HomeButton(title: "Play") {
                    didPressPlay = true
                }
                
                HomeButton(title: "Boards") {
                    print("Boards")
                }
                
                HomeButton(title: "Settings") {
                    print("Settings")
                }
                
                Spacer()
                    .frame(height: 15)
            }
        }
        .fullScreenCover(isPresented: $didPressPlay) {
            GameView(isPresented: $didPressPlay)
        }
    }
}

#Preview {
    HomeView()
}