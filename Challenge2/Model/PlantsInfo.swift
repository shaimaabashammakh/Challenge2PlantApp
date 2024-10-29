//
//  PlantsInfo.swift
//  Challenge2
//
//  Created by Shaima Bashammakh on 24/04/1446 AH.
//

// This is a Model

import Foundation

struct PlantsInfo: Identifiable {
    let id = UUID()  // Unique identifier for each plant
    var Light: String
    var Room: String
    var WateringDays: String
    var Water: String
    var Name: String
    var isChecked: Bool = false
    
    init(Light: String, Room: String, WateringDays: String, Water: String, Name: String) {
        self.Light = Light
        self.Room = Room
        self.WateringDays = WateringDays
        self.Water = Water
        self.Name = Name
    }
}

