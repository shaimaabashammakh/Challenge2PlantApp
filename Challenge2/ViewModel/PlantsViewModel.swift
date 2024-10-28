//
//  PlantsViewModel.swift
//  Challenge2
//
//  Created by Shaima Bashammakh on 24/04/1446 AH.
//

import SwiftUI

class PlantsViewModel: ObservableObject {
    @Published var plantsInfoArray: [PlantsInfo] = []
    @Published var checkedPlants: [String: Bool] = [:]
    @Published var navigateToLastScreen = false
    @Published var showNewPage = false
    @Published var selectedPlant: PlantsInfo?

    func toggleChecked(for plant: PlantsInfo) {
        checkedPlants[plant.Name] = !(checkedPlants[plant.Name] ?? false)
        if plantsInfoArray.allSatisfy({ checkedPlants[$0.Name] == true }) {
            navigateToLastScreen = true
        }
    }

    func selectPlantForEditing(_ plant: PlantsInfo) {
        selectedPlant = plant
        showNewPage = false
    }

    func savePlant(Light: String, Room: String, WateringDays: String, Water: String, Name: String) {
        if let index = plantsInfoArray.firstIndex(where: { $0.Name == selectedPlant?.Name }) {
            plantsInfoArray[index] = PlantsInfo(Light: Light, Room: Room, WateringDays: WateringDays, Water: Water, Name: Name)
        } else {
            let newPlant = PlantsInfo(Light: Light, Room: Room, WateringDays: WateringDays, Water: Water, Name: Name)
            plantsInfoArray.append(newPlant)
        }
        showNewPage = true
    }

    func deletePlant() {
        if let plant = selectedPlant,
           let index = plantsInfoArray.firstIndex(where: { $0.Name == plant.Name }) {
            plantsInfoArray.remove(at: index)
            selectedPlant = nil
            showNewPage = true
        }
    }

    // New method to load plant data
    func loadPlantData() {
        guard let plant = selectedPlant else { return }
        selectedPlant = plant
    }
}






//import SwiftUI
//
//class PlantsViewModel: ObservableObject {
//    @Published var plantsInfoArray: [PlantsInfo] = []
//    @Published var checkedPlants: [String: Bool] = [:]
//    @Published var navigateToLastScreen = false
//    @Published var showNewPage = false
//    @Published var selectedPlant: PlantsInfo?
//
//    func toggleChecked(for plant: PlantsInfo) {
//        checkedPlants[plant.Name] = !(checkedPlants[plant.Name] ?? false)
//        if plantsInfoArray.allSatisfy({ checkedPlants[$0.Name] == true }) {
//            navigateToLastScreen = true
//        }
//    }
//
//    func selectPlantForEditing(_ plant: PlantsInfo) {
//        selectedPlant = plant
//        showNewPage = false
//    }
//
//    func savePlant(Light: String, Room: String, WateringDays: String, Water: String, Name: String) {
//        if let index = plantsInfoArray.firstIndex(where: { $0.Name == selectedPlant?.Name }) {
//            plantsInfoArray[index] = PlantsInfo(Light: Light, Room: Room, WateringDays: WateringDays, Water: Water, Name: Name)
//        } else {
//            let newPlant = PlantsInfo(Light: Light, Room: Room, WateringDays: WateringDays, Water: Water, Name: Name)
//            plantsInfoArray.append(newPlant)
//        }
//        showNewPage = true
//    }
//
//    func deletePlant() {
//        if let plant = selectedPlant,
//           let index = plantsInfoArray.firstIndex(where: { $0.Name == plant.Name }) {
//            plantsInfoArray.remove(at: index)
//            selectedPlant = nil
//            showNewPage = true
//        }
//    }
//}
