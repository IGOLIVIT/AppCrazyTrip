//
//  TicketsView.swift
//  AppCrazyTrip
//
//  Created by IGOR on 17/12/2024.
//

import SwiftUI

struct TicketsView: View {

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
                        
                        VStack(alignment: .leading, spacing: 14) {
                            
                            Text("$ \(viewModel.totalSum)")
                                .foregroundColor(.black)
                                .font(.system(size: 20, weight: .bold))
                                .opacity(0)
                            
                            HStack {
                                
                                Text("Tickets")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                                
                                Spacer()
                                
                                Text("\(viewModel.totalTickets)")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .semibold))
                            }
                            
                            HStack {
                                
                                Text("Countries")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                                
                                Spacer()
                                
                                Text("\(viewModel.totalCountries)")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .semibold))
                            }
                         
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 130)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg")))
                        .overlay (
                        
                            VStack {
                                
                                ZStack {
                                    
                                    Image("volna")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .cornerRadius(20)
                                    
                                    Text("$ \(viewModel.totalSum)")
                                        .foregroundColor(.black)
                                        .font(.system(size: 20, weight: .bold))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding()
                                    
                                }
                                
                                Spacer()
                            }
                            
                        )
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isEditTickets = true
                            }
                            
                        }, label: {
                            
                            Text("Edit")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                        })
                        
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
        .sheet(isPresented: $viewModel.isEditTickets, content: {
            
            EditTickets(viewModel: viewModel)
        })
    }
}

#Preview {
    TicketsView(viewModel: PlanViewModel())
}
