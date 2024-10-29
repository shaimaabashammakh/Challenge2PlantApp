//
//  PlantsScreen.swift
//  Challenge2
//
//  Created by Shaima Bashammakh on 24/04/1446 AH.
//


// This is a view

import SwiftUI

extension Color {
    static let NewGreen = Color(red: 40/255, green: 224/255, blue: 168/255)

    static let NewGray = Color(red: 28/255, green: 28/255, blue: 30/255)

    static let NewGraay = Color(red: 44/255, green: 44/255, blue: 46/255)

    static let BlackGray = Color(red: 28/255, green: 28/255, blue: 30/255)

    static let LightGray = Color(red: 44/255, green: 44/255, blue: 46/255)

    static let NewBlue = Color(red: 44/255, green: 44/255, blue: 46/255)

    static let NewYellow = Color(red: 44/255, green: 44/255, blue: 46/255)
}


struct PlantsScreen: View {
    @StateObject private var viewModel = PlantsViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.showPlantsScreen {
                    ZStack {
                        Color.black.ignoresSafeArea()
                        VStack(alignment: .leading) {
                            
                            // Title
                            Text("My Plants 🌱")
                                .foregroundColor(.white)
                                .font(.largeTitle.bold())
                                .padding(.leading)
                            
                            // Subtitle
                            Text("Today")
                                .foregroundColor(.white)
                                .padding(.leading)
                                .padding(.top, 10)
                                .font(.system(size: 24, weight: .bold))
                            
                            Divider().background(Color.gray.opacity(0.9))
                            
                            // Plant List with Details and Delete Action
                            List {
                                ForEach(viewModel.plantsInfoArray.sorted {
                                    !(viewModel.checkedPlants[$0.Name] ?? false) && (viewModel.checkedPlants[$1.Name] ?? false)
                                }, id: \.Room) { plant in
                                    
                                    VStack(alignment: .leading, spacing: 10) {
                                        HStack {
                                            Image(systemName: "paperplane").foregroundColor(.gray)
                                            Text("in \(plant.Room)")
                                                .foregroundColor(.gray)
                                                .font(.subheadline)
                                        }
                                        .padding(.leading, 40)
                                        
                                        HStack {
                                            Image(systemName: viewModel.checkedPlants[plant.Name] == true ? "checkmark.circle.fill" : "circle")
                                                .foregroundColor(viewModel.checkedPlants[plant.Name] == true ? .NewGreen : .gray)
                                                .font(.system(size: 25))
                                                .onTapGesture {
                                                    viewModel.toggleChecked(for: plant)
                                                }
                                            
                                            Text(plant.Name)
                                                .font(.title2.bold())
                                                .foregroundColor(viewModel.checkedPlants[plant.Name] == true ? .gray : .white)
                                                .padding(.leading, 10)
                                                .onTapGesture {
                                                    viewModel.selectPlantForEditing(plant)
                                                }
                                        }
                                        
                                        HStack(spacing: 20) {
                                            HStack {
                                                Image(systemName: "sun.max").foregroundColor(.yellow)
                                                Text(plant.Light)
                                                    .foregroundColor(.yellow)
                                                    .font(.caption)
                                                    .padding(8)
                                                    .background(Color.gray.opacity(0.2))
                                                    .cornerRadius(10)
                                            }
                                            
                                            HStack {
                                                Image(systemName: "drop").foregroundColor(.blue)
                                                Text("\(plant.Water) ml")
                                                    .foregroundColor(.blue)
                                                    .font(.caption)
                                                    .padding(8)
                                                    .background(Color.gray.opacity(0.2))
                                                    .cornerRadius(10)
                                            }
                                        }
                                        .padding(.leading, 40)
                                    }
                                    .swipeActions(edge: .trailing) {
                                        Button(role: .destructive) {
                                            viewModel.deletePlant()
                                        } label: {
                                            Label("", systemImage: "trash")
                                        }
                                        .tint(.red)
                                    }
                                    .listRowBackground(Color.black)
                                   
                                    
                                }.environment(\.defaultMinListRowHeight, 220)
                                
                               
                                
                            }
                            .scrollContentBackground(.hidden)
                            
                            // Button to switch back to the form
                            Button(action: { viewModel.showPlantsScreen = false }) {
                                HStack {
                                    Image(systemName: "plus.circle.fill")
                                        .foregroundColor(.NewGreen)
                                        .padding(.leading, 42)
                                        .font(.system(size: 26))
                                    Text("New Reminder").foregroundColor(.NewGreen)
                                }
                            }
                        }
                    }
                } else {
                    // Show SetReminder for entering plant details
                    SetReminder(viewModel: viewModel)
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .navigationDestination(isPresented: $viewModel.navigateToLastScreen) {
                LastScreen()
            }
        }
    }
}

