//
//  PlanViewModel.swift
//  AppCrazyTrip
//
//  Created by IGOR on 16/12/2024.
//

import SwiftUI
import CoreData

final class PlanViewModel: ObservableObject {
    
    @AppStorage("totalTickets") var totalTickets: Int = 0
    @AppStorage("totalCountries") var totalCountries: Int = 0
    @AppStorage("totalSum") var totalSum: Int = 0

    @Published var photos: [String] = ["France", "USA", "Italy", "Germany", "South Korea", "New Zeland"]
    @Published var currentPhoto = ""
    
    @Published var weekDays: [String] = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    @Published var currentDay = "Mon"
    @Published var FilterDay = "Mon"

    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    @Published var isTickets: Bool = false
    @Published var isDeleteTic: Bool = false
    @Published var isEditTickets: Bool = false
    @Published var isAddTicket: Bool = false

    @Published var plPhoto: String = ""
    @Published var plCountry: String = ""
    @Published var plCity1: String = ""
    @Published var plCity2: String = ""
    @Published var plCity3: String = ""
    @Published var plCity4: String = ""
    @Published var plSig1: String = ""
    @Published var plSig2: String = ""
    @Published var plSig3: String = ""
    @Published var plSig4: String = ""
    @Published var plDay: String = ""
    @Published var plNT: String = ""
    @Published var plTP: String = ""
    @Published var plSumCity: String = ""
    @Published var plSumSights: String = ""

    @Published var plans: [PlanModel] = []
    @Published var selectedPlan: PlanModel?

    func addPlan() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "PlanModel", into: context) as! PlanModel

        loan.plPhoto = plPhoto
        loan.plCountry = plCountry
        loan.plCity1 = plCity1
        loan.plCity2 = plCity2
        loan.plCity3 = plCity3
        loan.plCity4 = plCity4
        loan.plSig1 = plSig1
        loan.plSig2 = plSig2
        loan.plSig3 = plSig3
        loan.plSig4 = plSig4
        loan.plDay = plDay
        loan.plNT = plNT
        loan.plTP = plTP
        loan.plSumCity = plSumCity
        loan.plSumSights = plSumSights

        CoreDataStack.shared.saveContext()
    }

    func fetchPlans() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<PlanModel>(entityName: "PlanModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.plans = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.plans = []
        }
    }
    
    @Published var ticCountry: String = ""
    @Published var ticNT: String = ""
    @Published var ticTP: String = ""

    @Published var tickets: [TicketModel] = []
    @Published var selectedTicket: TicketModel?

    func addTicket() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "TicketModel", into: context) as! TicketModel

        loan.ticCountry = ticCountry
        loan.ticNT = ticNT
        loan.ticTP = ticTP

        CoreDataStack.shared.saveContext()
    }

    func fetchTickets() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<TicketModel>(entityName: "TicketModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.tickets = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.tickets = []
        }
    }
}
