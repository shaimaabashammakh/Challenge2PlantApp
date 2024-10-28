//
//  SplashScreen.swift
//  Challenge2
//
//  Created by Shaima Bashammakh on 24/04/1446 AH.
//




// This is a view
// correct
import SwiftUI

struct SplashScreen: View {
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack {
                    Text("My Plants 🌱")
                        .padding(.leading, -180.0)
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                    
                    Divider()
                        .background(Color.gray)
                        .padding(.bottom, 60)
                    
                    Image("Plant")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .padding(.bottom, 19.0)
                    
                    Text("Start your plant journey!")
                        .padding(.top, 20.0)
                        .padding(.bottom, 19.0)
                        .foregroundStyle(.white)
                        .font(.system(size: 24, weight: .bold))
                    
                    Text("Now all your plants will be in one place and we will help you take care of them :)🪴")
                        .foregroundStyle(.gray)
                        .padding(.bottom, 20)
                        .padding(.horizontal, 35)
                    
                    NavigationLink(destination: PlantsScreen()) {
                        Text("Set Plant Reminder")
                            .frame(width: 280, height: 40)
                            .background(Color.NewGreen)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                    }
                    .padding(.bottom, 220)
                }
                .background(Color.black.edgesIgnoringSafeArea(.all))
                
            }
            
        }
    }
}

#Preview {
    SplashScreen()
}


