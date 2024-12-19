//
//  ItemsViewModel.swift
//  AppCrazyTrip
//
//  Created by IGOR on 16/12/2024.
//

import SwiftUI
import CoreData

final class ItemsViewModel: ObservableObject {
    
    @Published var variants: [String] = ["City", "Sight"]
    @Published var varForAdd = ""
    @Published var variantsForFilter = "City"

    @Published var cityPhotos: [String] = ["Paris", "Seoul", "Berlin", "Melbourne"]
    @Published var currentCPhoto = ""
    
    @Published var sightPhotos: [String] = ["Eifel Tower", "Reichstag", "Genbokgun", "Statue of Liberty"]
    @Published var currentSPhoto = ""
    
    @Published var weekDays: [String] = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    @Published var currentDay = "Mon"
    @Published var FilterDay = "Mon"

    @Published var isAdd: Bool = false
    @Published var isAddCity: Bool = false
    @Published var isAddSight: Bool = false
    @Published var isDetailCity: Bool = false
    @Published var isDetailSight: Bool = false
    @Published var isDelete: Bool = false
    
    @Published var itPhoto: String = ""
    @Published var itCity: String = ""
    @Published var itSig1: String = ""
    @Published var itSig2: String = ""
    @Published var itSig3: String = ""
    @Published var itSig4: String = ""
    @Published var itSumSig: String = ""

    @Published var items: [ItemsModel] = []
    @Published var selectedItem: ItemsModel?

    func addItem() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "ItemsModel", into: context) as! ItemsModel

        loan.itPhoto = itPhoto
        loan.itCity = itCity
        loan.itSig1 = itSig1
        loan.itSig2 = itSig2
        loan.itSig3 = itSig3
        loan.itSig4 = itSig4
        loan.itSumSig = itSumSig

        CoreDataStack.shared.saveContext()
    }

    func fetchItems() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<ItemsModel>(entityName: "ItemsModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.items = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.items = []
        }
    }
    
    @Published var sigPhoto: String = ""
    @Published var sigName: String = ""

    @Published var sights: [SightModel] = []
    @Published var selectedSight: SightModel?

    func addSight() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "SightModel", into: context) as! SightModel

        loan.sigPhoto = sigPhoto
        loan.sigName = sigName

        CoreDataStack.shared.saveContext()
    }

    func fetchSights() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<SightModel>(entityName: "SightModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.sights = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.sights = []
        }
    }
}
