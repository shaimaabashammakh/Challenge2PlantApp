//
//  LastScreen.swift
//  Challenge2
//
//  Created by Shaima Bashammakh on 24/04/1446 AH.
//


// This is a view

import SwiftUI

struct LastScreen: View {
    
    @State private var isShowingSetReminder = false
    
    var body: some View {
        NavigationView { // Wrap everything in a NavigationView
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack {
                    Text("My Plants 🌱")
                        .padding(.leading, -180.0)
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                    
                    Divider().background(Color.gray).padding(.bottom, 130)
                    
                    Image("HappyPlant").resizable()
                        .frame(width: 200, height: 200).padding(.bottom, 19.0)
                    
                    Text("All Done!🎉")
                        .padding(.top, 20.0)
                        .foregroundStyle(.white)
                        .font(.system(size: 24, weight: .bold))
                    
                    Text("All Reminders Completed")
                        .foregroundColor(.gray)
                        .padding(.bottom, 20)
                        .padding(.horizontal, 35)
                    
                    NavigationLink(destination: PlantsScreen()) {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.NewGreen)
                                .padding(.leading, 30)
                                .font(.system(size: 26))
                            
                            Text("New Reminder")
                                .foregroundColor(.NewGreen)
                        }
                        .padding(.top, 210)
                        .padding(.trailing, 220)
                    }
                }
            }.navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
            
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
    }
}



#Preview {
    LastScreen()
}
