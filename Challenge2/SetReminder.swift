//
//  ContentView.swift
//  Challenge2
//
//  Created by Shaima Bashammakh on 24/04/1446 AH.
//

// This is a view

import SwiftUI

struct SetReminder: View {
    @ObservedObject var viewModel: PlantsViewModel

    let Room = ["Bedroom", "Living Room", "Kitchen", "Balcony", "Bathroom"]
    let Light = ["Full Sun", "Partial Sun", "Low Light"]
    let WateringDays = ["Every day", "Every 2 days", "Every 3 days", "Once a week", "Every 10 days", "Every 2 weeks"]
    let Water = ["20-50 ml", "50-100 ml", "100-200 ml", "200-300 ml"]

    @State private var SelectedRoom = ""
    @State private var SelectedLight = ""
    @State private var SelectedWateringDays = ""
    @State private var SelectedWater = ""
    @State private var PlantName = ""

    var body: some View {
        ZStack {
            Color.NewGray.ignoresSafeArea()  // Background color for full screen
            VStack {
                HStack {
                    Button(action: { viewModel.showNewPage = true }) {
                        Text("Cancel").foregroundColor(Color.NewGreen)
                    }
                    
                    Text("Set Reminder")
                        .foregroundColor(.white)
                        .padding(.leading, 80)
                        .font(.system(size: 16, weight: .bold))
                    
                    Button(action: {
                        viewModel.savePlant(Light: SelectedLight, Room: SelectedRoom, WateringDays: SelectedWateringDays, Water: SelectedWater, Name: PlantName)
                    }) {
                        Text("Save").foregroundColor(Color.NewGreen)
                            .padding(.leading, 80)
                    }
                }
                
                Form {
                    HStack {
                        Text("Plant Name:")
                            .foregroundColor(.white)
                        
                        ZStack(alignment: .leading) {
                            if PlantName.isEmpty {
                                Text("Enter a name")
                                    .foregroundColor(.gray)
                            }
                            TextField("", text: $PlantName)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .accentColor(.white)
                    .listRowBackground(Color.LightGray)
                    
                    Section {
                        HStack {
                            Image(systemName: "location")
                            Picker("Room", selection: $SelectedRoom) {
                                ForEach(Room, id: \.self) { room in
                                    Text(room)
                                }
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                        .accentColor(.gray)
                        .listRowBackground(Color.LightGray)
                        .frame(height: 30)
                        
                        HStack {
                            Image(systemName: "sun.max")
                            Picker("Light", selection: $SelectedLight) {
                                ForEach(Light, id: \.self) { light in
                                    Text(light)
                                }
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                        .accentColor(.gray)
                        .listRowBackground(Color.LightGray)
                        .frame(height: 30)
                    }
                    
                    Section {
                        HStack {
                            Image(systemName: "drop")
                            Picker("Watering Days", selection: $SelectedWateringDays) {
                                ForEach(WateringDays, id: \.self) { days in
                                    Text(days)
                                }
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                        .accentColor(.gray)
                        .listRowBackground(Color.LightGray)
                        .frame(height: 30)
                        
                        HStack {
                            Image(systemName: "drop")
                            Picker("Water", selection: $SelectedWater) {
                                ForEach(Water, id: \.self) { water in
                                    Text(water)
                                }
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                        .accentColor(.gray)
                        .listRowBackground(Color.LightGray)
                        .frame(height: 30)
                    }
                }
                .background(Color.BlackGray)
                .scrollContentBackground(.hidden)
                .foregroundColor(.white)
                
                // Show delete button only if editing an existing plant
                if viewModel.selectedPlant != nil {
                    Button(action: {
                        viewModel.deletePlant()
                    }) {
                        HStack {
                            Text("Delete")
                                .foregroundColor(.red)
                        }
                        .frame(width: 360, height: 45)
                        .background(Color.LightGray)
                        .cornerRadius(10)
                        .padding(.bottom, 330)
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .onAppear {
                viewModel.loadPlantData() // Call to load plant data from ViewModel
                if let plant = viewModel.selectedPlant {
                    SelectedRoom = plant.Room
                    SelectedLight = plant.Light
                    SelectedWateringDays = plant.WateringDays
                    SelectedWater = plant.Water
                    PlantName = plant.Name
                }
            }
        }
    }
}


//
//import SwiftUI
//
//struct SetReminder: View {
//    @ObservedObject var viewModel: PlantsViewModel
//
//    let Room = ["Bedroom", "Living Room", "Kitchen", "Balcony", "Bathroom"]
//    let Light = ["Full Sun", "Partial Sun", "Low Light"]
//    let WateringDays = ["Every day", "Every 2 days", "Every 3 days", "Once a week", "Every 10 days", "Every 2 weeks"]
//    let Water = ["20-50 ml", "50-100 ml", "100-200 ml", "200-300 ml"]
//
//    @State private var SelectedRoom = ""
//    @State private var SelectedLight = ""
//    @State private var SelectedWateringDays = ""
//    @State private var SelectedWater = ""
//    @State private var PlantName = ""
//
//    var body: some View {
//        ZStack {
//            Color.NewGray.ignoresSafeArea()  // Background color for full screen
//            VStack {
//                HStack {
//                    Button(action: { viewModel.showNewPage = true }) {
//                        Text("Cancel").foregroundColor(Color.NewGreen)
//                    }
//                    
//                    Text("Set Reminder")
//                        .foregroundColor(.white)
//                        .padding(.leading, 80)
//                        .font(.system(size: 16, weight: .bold))
//                    
//                    Button(action: {
//                        viewModel.savePlant(Light: SelectedLight, Room: SelectedRoom, WateringDays: SelectedWateringDays, Water: SelectedWater, Name: PlantName)
//                    }) {
//                        Text("Save").foregroundColor(Color.NewGreen)
//                            .padding(.leading, 80)
//                    }
//                }
//                
//                Form {
//                    HStack {
//                        Text("Plant Name:")
//                            .foregroundColor(.white)
//                        
//                        ZStack(alignment: .leading) {
//                            if PlantName.isEmpty {
//                                Text("Enter a name")
//                                    .foregroundColor(.gray)
//                            }
//                            TextField("", text: $PlantName)
//                                .foregroundColor(.white)
//                                .cornerRadius(10)
//                        }
//                    }
//                    .pickerStyle(MenuPickerStyle())
//                    .accentColor(.white)
//                    .listRowBackground(Color.LightGray)
//                    
//                    Section {
//                        HStack {
//                            Image(systemName: "location")
//                            Picker("Room", selection: $SelectedRoom) {
//                                ForEach(Room, id: \.self) { room in
//                                    Text(room)
//                                }
//                            }
//                        }
//                        .pickerStyle(MenuPickerStyle())
//                        .accentColor(.gray)
//                        .listRowBackground(Color.LightGray)
//                        .frame(height: 30)
//                        
//                        HStack {
//                            Image(systemName: "sun.max")
//                            Picker("Light", selection: $SelectedLight) {
//                                ForEach(Light, id: \.self) { light in
//                                    Text(light)
//                                }
//                            }
//                        }
//                        .pickerStyle(MenuPickerStyle())
//                        .accentColor(.gray)
//                        .listRowBackground(Color.LightGray)
//                        .frame(height: 30)
//                    }
//                    
//                    Section {
//                        HStack {
//                            Image(systemName: "drop")
//                            Picker("Watering Days", selection: $SelectedWateringDays) {
//                                ForEach(WateringDays, id: \.self) { days in
//                                    Text(days)
//                                }
//                            }
//                        }
//                        .pickerStyle(MenuPickerStyle())
//                        .accentColor(.gray)
//                        .listRowBackground(Color.LightGray)
//                        .frame(height: 30)
//                        
//                        HStack {
//                            Image(systemName: "drop")
//                            Picker("Water", selection: $SelectedWater) {
//                                ForEach(Water, id: \.self) { water in
//                                    Text(water)
//                                }
//                            }
//                        }
//                        .pickerStyle(MenuPickerStyle())
//                        .accentColor(.gray)
//                        .listRowBackground(Color.LightGray)
//                        .frame(height: 30)
//                    }
//                }
//                .background(Color.BlackGray)
//                .scrollContentBackground(.hidden)
//                .foregroundColor(.white)
//                
//                // Show delete button only if editing an existing plant
//                if viewModel.selectedPlant != nil {
//                    Button(action: {
//                        viewModel.deletePlant()
//                    }) {
//                        HStack {
//                            Text("Delete")
//                                .foregroundColor(.red)
//                        }
//                        .frame(width: 360, height: 45)
//                        .background(Color.LightGray)
//                        .cornerRadius(10)
//                        .padding(.bottom, 330)
//                    }
//                }
//            }
//            .navigationBarBackButtonHidden(true)
//            .navigationBarHidden(true)
//            .onAppear {
//                if let plant = viewModel.selectedPlant {
//                    loadPlantData(plant)  // Load data if editing
//                }
//            }
//        }
//    }
//    
//    private func loadPlantData(_ plant: PlantsInfo) {
//        SelectedRoom = plant.Room
//        SelectedLight = plant.Light
//        SelectedWateringDays = plant.WateringDays
//        SelectedWater = plant.Water
//        PlantName = plant.Name
//    }
//}




//
//import SwiftUI
//
//struct SetReminder: View {
//    @ObservedObject var viewModel: PlantsViewModel
//
//    let Room = ["Bedroom", "Living Room", "Kitchen", "Balcony", "Bathroom"]
//    let Light = ["Full Sun", "Partial Sun", "Low Light"]
//    let WateringDays = ["Every day", "Every 2 days", "Every 3 days", "Once a week", "Every 10 days", "Every 2 weeks"]
//    let Water = ["20-50 ml", "50-100 ml", "100-200 ml", "200-300 ml"]
//
//    @State private var SelectedRoom = ""
//    @State private var SelectedLight = ""
//    @State private var SelectedWateringDays = ""
//    @State private var SelectedWater = ""
//    @State private var PlantName = ""
//
//    var body: some View {
//        VStack {
//            HStack {
//                Button(action: { viewModel.showNewPage = true }) {
//                    Text("Cancel").foregroundColor(Color.NewGreen)
//                }
//
//                Text("Set Reminder")
//                    .foregroundColor(.white)
//                    .font(.system(size: 16, weight: .bold))
//
//                Button(action: {
//                    viewModel.savePlant(Light: SelectedLight, Room: SelectedRoom, WateringDays: SelectedWateringDays, Water: SelectedWater, Name: PlantName)
//                }) {
//                    Text("Save").foregroundColor(Color.NewGreen)
//                }
//            }
//            
//            // Form, pickers, and data binding implementation
//        }
//        .onAppear {
//            if let plant = viewModel.selectedPlant {
//                loadPlantData(plant)
//            }
//        }
//    }
//
//    private func loadPlantData(_ plant: PlantsInfo) {
//        SelectedRoom = plant.Room
//        SelectedLight = plant.Light
//        SelectedWateringDays = plant.WateringDays
//        SelectedWater = plant.Water
//        PlantName = plant.Name
//    }
//}
//




//import SwiftUI
//struct SetReminder: View {
//    @Binding var plantsInfoArray: [PlantsInfo]
//    @Binding var showNewPage: Bool
//    @Binding var selectedPlant: PlantsInfo?  // Holds the plant being edited, if any
//
//    let Room = ["Bedroom", "Living Room", "Kitchen", "Balcony", "Bathroom"]
//    let Light = ["Full Sun", "Partial Sun", "Low Light"]
//    let WateringDays = ["Every day", "Every 2 days", "Every 3 days", "Once a week", "Every 10 days", "Every 2 weeks"]
//    let Water = ["20-50 ml", "50-100 ml", "100-200 ml", "200-300 ml"]
//
//    @State private var SelectedRoom: String = ""
//    @State private var SelectedLight: String = ""
//    @State private var SelectedWateringDays: String = ""
//    @State private var SelectedWater: String = ""
//    @State private var PlantName: String = ""
//
//    var body: some View {
//        ZStack {
//            Color.NewGray.ignoresSafeArea()
//            VStack {
//                HStack {
//                    Button(action: {
//                        showNewPage = true
//                    }) {
//                        Text("Cancel")
//                            .foregroundColor(Color.NewGreen)
//                    }
//                    
//                    Text("Set Reminder")
//                        .foregroundColor(.white)
//                        .padding(.leading, 80)
//                        .font(.system(size: 16, weight: .bold))
//                    
//                    Button(action: {
//                        savePlant()
//                    }) {
//                        Text("Save")
//                            .foregroundColor(Color.NewGreen)
//                            .padding(.leading, 80)
//                    }
//                }
//                
//                Form {
//                    HStack {
//                        Text("Plant Name:")
//                            .foregroundColor(.white)
//                        
//                        ZStack(alignment: .leading) {
//                            if PlantName.isEmpty {
//                                Text("Enter a name")
//                                    .foregroundColor(.gray)
//                            }
//                            TextField("", text: $PlantName)
//                                .foregroundColor(.white)
//                                .cornerRadius(10)
//                        }
//                    }
//                    .pickerStyle(MenuPickerStyle())
//                    .accentColor(.white)
//                    .listRowBackground(Color.LightGray)
//                    
//                    Section {
//                        HStack {
//                            Image(systemName: "location")
//                            Picker("Room", selection: $SelectedRoom) {
//                                ForEach(Room, id: \.self) { room in
//                                    Text(room)
//                                }
//                            }
//                        }
//                        .pickerStyle(MenuPickerStyle())
//                        .accentColor(.gray)
//                        .listRowBackground(Color.LightGray)
//                        .frame(height: 30)
//                        
//                        HStack {
//                            Image(systemName: "sun.max")
//                            Picker("Light", selection: $SelectedLight) {
//                                ForEach(Light, id: \.self) { light in
//                                    Text(light)
//                                }
//                            }
//                        }
//                        .pickerStyle(MenuPickerStyle())
//                        .accentColor(.gray)
//                        .listRowBackground(Color.LightGray)
//                        .frame(height: 30)
//                    }
//                    
//                    Section{
//                                      HStack {
//              
//                                          Image(systemName: "drop")
//                                          Picker("Watering Days", selection: $SelectedWateringDays) {
//                                              ForEach(WateringDays, id: \.self) { days in
//                                                  Text(days)
//                                              }
//                                          }} .pickerStyle(MenuPickerStyle()).accentColor(.gray).listRowBackground(Color.LightGray).frame(height: 30)
//              
//              
//                                      HStack {
//              
//                                          Image(systemName: "drop")
//                                          Picker("Water", selection: $SelectedWater) {
//                                              ForEach(Water, id: \.self) { water in
//                                                  Text(water)
//                                              }
//                                          }} .pickerStyle(MenuPickerStyle()).accentColor(.gray).listRowBackground(Color.LightGray).frame(height: 30)
//              
//              
//                                  }
//                }
//                .background(Color.BlackGray)
//                .scrollContentBackground(.hidden)
//                .foregroundColor(.white)
//                
//                // Show delete button only if editing an existing plant
//                if selectedPlant != nil {
//                    Button(action: {
//                        deletePlant()
//                    }) {
//                        HStack {
//                            Text("Delete")
//                                .foregroundColor(.red)
//                        }
//                        .frame(width: 360, height: 45)
//                        .background(Color.LightGray)
//                        .cornerRadius(10)
//                        .padding(.bottom, 330)
//                    }
//                }
//            }.navigationBarBackButtonHidden(true)
//                .navigationBarHidden(true)
//            .onAppear {
//                if let plant = selectedPlant {
//                    loadPlantData(plant)  // Load data if editing
//                }
//            }
//        }
//    }
//
//    private func loadPlantData(_ plant: PlantsInfo) {
//        SelectedRoom = plant.Room
//        SelectedLight = plant.Light
//        SelectedWateringDays = plant.WateringDays
//        SelectedWater = plant.Water
//        PlantName = plant.Name
//    }
//
//    private func savePlant() {
//        if let index = plantsInfoArray.firstIndex(where: { $0.Name == selectedPlant?.Name }) {
//            plantsInfoArray[index] = PlantsInfo(
//                Light: SelectedLight,
//                Room: SelectedRoom,
//                WateringDays: SelectedWateringDays,
//                Water: SelectedWater,
//                Name: PlantName
//            )
//        } else {
//            let newPlant = PlantsInfo(
//                Light: SelectedLight,
//                Room: SelectedRoom,
//                WateringDays: SelectedWateringDays,
//                Water: SelectedWater,
//                Name: PlantName
//            )
//            plantsInfoArray.append(newPlant)
//        }
//        showNewPage = true
//    }
//
//    // Delete the selected plant from plantsInfoArray
//    private func deletePlant() {
//        if let plant = selectedPlant,
//           let index = plantsInfoArray.firstIndex(where: { $0.Name == plant.Name }) {
//            plantsInfoArray.remove(at: index)
//            selectedPlant = nil  // Clear selection after deleting
//            showNewPage = true
//        }
//    }
//}
//
//
