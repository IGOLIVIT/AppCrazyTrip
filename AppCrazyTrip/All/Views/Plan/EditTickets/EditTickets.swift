//
//  EditTickets.swift
//  AppCrazyTrip
//
//  Created by IGOR on 17/12/2024.
//

import SwiftUI

struct EditTickets: View {

    @StateObject var viewModel: PlanViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Image(systemName: "chevron.left.circle")
                            .foregroundColor(.black)
                            .font(.system(size: 17, weight: .regular))
                        
                    })
                    
                    Spacer()
                    
                    Text("TICKET PRICE")
                        .foregroundColor(.black)
                        .font(.system(size: 22, weight: .bold))
                    
                }
                .padding(.bottom, 25)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 10) {
                        
                        HStack {
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isAddTicket = true
                                }
                                
                            }, label: {
                                
                                Text("Add Tickets")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .semibold))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 50)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(Color.black))
                            })
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isEditTickets = false
                                }
                                
                            }, label: {
                                
                                Text("Save")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .semibold))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 50)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                            })
                            
                        }
                        
                        LazyVStack(spacing: 12) {
                            
                            ForEach(viewModel.plans, id: \.self) { index in
                                                                    
                                    HStack {
                                        
                                        VStack(alignment: .leading) {
                                            
                                            Text(index.plCountry ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 17, weight: .semibold))
                                            
                                            Text("Tickets: \(index.plNT ?? "")")
                                        }
                                        
                                        Spacer()
                                        
                                        Text("\(index.plTP ?? "") $")
                                            .foregroundColor(.black)
                                            .font(.system(size: 18, weight: .bold))
                                    }
                                }
                            
                            ForEach(viewModel.tickets, id: \.self) { indexer in
                                
                                HStack {
                                    
                                    VStack(alignment: .leading) {
                                        
                                        Text(indexer.ticCountry ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 17, weight: .semibold))
                                        
                                        Text("Tickets: \(indexer.ticNT ?? "")")
                                    }
                                    
                                    Spacer()
                                    
                                    Text("\(indexer.ticTP ?? "") $")
                                        .foregroundColor(.black)
                                        .font(.system(size: 18, weight: .bold))
                                }
                            }
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 20).fill(.white))
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchPlans()
        }
        .onAppear {
            
            viewModel.fetchTickets()
        }
        .sheet(isPresented: $viewModel.isAddTicket, content: {
        
            AddTicket(viewModel: viewModel)
        })
    }
}

#Preview {
    EditTickets(viewModel: PlanViewModel())
}
