//
//  SViewModel.swift
//  AppCrazyTrip
//
//  Created by IGOR on 16/12/2024.
//

import SwiftUI
import CoreData

final class SViewModel: ObservableObject {
    
    @Published var oftenTravel: [String] = ["Once a year", "Once a week", "Twicw a year", "Once a month", "Live on a journey", "Other"]
    @Published var currTravel = ""
    @AppStorage("appOfTrav") var appOfTrav: String = ""
    
    @Published var whereTravel: [String] = ["Europe", "Australia", "America", "Africa", "Asia", "Antarctica"]
    @Published var currWhereTrav = ""
    @AppStorage("appWhereTrav") var appWhereTrav: String = ""

    @AppStorage("categories") var categories: [String] = []
    @Published var addCateg: String = ""
    @Published var currCateg: String = ""

    @AppStorage("status") var status: Bool = false
    
    @AppStorage("name") var name: String = ""
    @Published var addName: String = ""

    @AppStorage("whereTrav") var whereTrav: String = ""
    @Published var addWhereTrav: String = ""
    
    @AppStorage("from") var from: String = ""
    @Published var addFrom: String = ""
    
    @Published var howNows: [String] = ["Instagram", "Google", "Facebook", "Youtube", "Twitter", "Other"]
    @Published var currHowKnow = ""
    @AppStorage("appHowKnow") var appHowKnow: String = ""
}
