//
//  PlantsViewModel.swift
//  Challenge2
//
//  Created by Shaima Bashammakh on 24/04/1446 AH.


// This is a ViewModel

import SwiftUI

class PlantsViewModel: ObservableObject {
    @Published var plantsInfoArray: [PlantsInfo] = []
    // Dictionary: (key is Name), (Value is a Bool-checked or unchecked-)
    @Published var checkedPlants: [String: Bool] = [:]
    @Published var navigateToLastScreen = false
    @Published var showPlantsScreen = false
    // Optional: can be nil
    @Published var selectedPlant: PlantsInfo?

    // Use for to make calling the function readable
    func toggleChecked(for plant: PlantsInfo) {
        // Check state of a specific plant
        
        // ?? is nil-coalescing operator:
        // If checkedPlants[plant.Name] is nil (it doesn’t exist in the dictionary), use false as the default value
        // ??: if the plant.Name does not exist, give it a default -> false
        checkedPlants[plant.Name] = !(checkedPlants[plant.Name] ?? false)
        // Checks if all plants are checked
        // [$0.Name]: accesses each plant’s name in dictionary
        if plantsInfoArray.allSatisfy({ checkedPlants[$0.Name] == true }) {
            navigateToLastScreen = true
        }
    }

    func selectPlantForEditing(_ plant: PlantsInfo) {
        selectedPlant = plant
        showPlantsScreen = false
    }

    func savePlant(Light: String, Room: String, WateringDays: String, Water: String, Name: String) {
        // If name of the selectedPlant found in plantInfoArray
        if let index = plantsInfoArray.firstIndex(where: { $0.Name == selectedPlant?.Name }) {
            plantsInfoArray[index] = PlantsInfo(Light: Light, Room: Room, WateringDays: WateringDays, Water: Water, Name: Name)
        } else {
            let newPlant = PlantsInfo(Light: Light, Room: Room, WateringDays: WateringDays, Water: Water, Name: Name)
            plantsInfoArray.append(newPlant)
        }
        showPlantsScreen = true
    }

    func deletePlant() {
        if let plant = selectedPlant,
           let index = plantsInfoArray.firstIndex(where: { $0.Name == plant.Name }) {
            plantsInfoArray.remove(at: index)
            selectedPlant = nil
            showPlantsScreen = true
        }
    }

    func loadPlantData() {
        // guard: allows to exit from a function early if a condition isn’t met
        // If selectedPlant is nil, the function exits early (return)
        guard let plant = selectedPlant else { return }
        selectedPlant = plant
    }
}




