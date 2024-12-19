//
//  PlanView.swift
//  AppCrazyTrip
//
//  Created by IGOR on 16/12/2024.
//

import SwiftUI

struct PlanView: View {
    
    @StateObject var viewModel = PlanViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("TRAVEL PLANING")
                        .foregroundColor(.black)
                        .font(.system(size: 24, weight: .bold))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isTickets = true
                        }
                        
                    }, label: {
                        
                        Image("ticket")
                    })
                }
                .padding(.bottom, 30)
                
                if viewModel.plans.isEmpty {
                    
                    VStack(alignment: .leading) {
                        
                        Text("You don't have any planned trips yet.")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = true
                            }
                            
                        }, label: {
                            
                            Text("Add")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .medium))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                        })
                        
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                } else {
                    
                    if viewModel.plans.filter({($0.plDay ?? "") == viewModel.FilterDay}).isEmpty {
                        
                        VStack(alignment: .leading) {
                            
                            Text("You don't have any planned trips yet.")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isAdd = true
                                }
                                
                            }, label: {
                                
                                Text("Add")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .medium))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 50)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                            })
                            
                            Spacer()
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                    } else {
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                                
                                ForEach(viewModel.plans.filter({($0.plDay ?? "") == viewModel.FilterDay}), id: \.self) { index in
                                
                                    VStack(alignment: .leading, spacing: 12) {
                                        
                                        Image(index.plPhoto ?? "")
                                            .resizable()
                                            .frame(width: 100, height: 100)
                                        
                                        Text(index.plCountry ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 20, weight: .bold))
                                        
                                        HStack {
                                            
                                            Text("Cities")
                                                .foregroundColor(.black)
                                                .font(.system(size: 16, weight: .regular))
                                            
                                            Spacer()
                                            
                                            Text(index.plSumCity ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 16, weight: .semibold))
                                        }
                                        
                                        HStack {
                                            
                                            Text("Sight")
                                                .foregroundColor(.black)
                                                .font(.system(size: 16, weight: .regular))
                                            
                                            Spacer()
                                            
                                            Text(index.plSumSights ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 16, weight: .semibold))
                                        }
                                        
                                        Button(action: {
                                            
                                            viewModel.selectedPlan = index
                                            
                                            withAnimation(.spring()) {
                                                
                                                viewModel.isDetail = true
                                            }
                                            
                                        }, label: {
                                            
                                            Text("More")
                                                .foregroundColor(.black)
                                                .font(.system(size: 16, weight: .semibold))
                                                .frame(maxWidth: .infinity)
                                                .frame(height: 50)
                                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                                        })
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(RoundedRectangle(cornerRadius: 20).fill(.white))
                                }
                            })
                        }
                    }
                }
                
            }
            .padding()
            
            VStack {
                
                Spacer()
                
                HStack {
                    
                    ForEach(viewModel.weekDays, id: \.self) { index in
                        
                        Button(action: {
                            
                            viewModel.FilterDay = index
                            
                        }, label: {
                            
                            Text(index)
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 15).fill(viewModel.FilterDay == index ? Color("prim") : .white))
                        })
                        
                    }
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = true
                        }
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                            .font(.system(size: 24, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                    })
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 15).fill(Color("tbg")))
            }
        }
        .onAppear{
            
            viewModel.fetchPlans()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddPlan(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            PlanDetail(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isTickets, content: {
            
            TicketsView(viewModel: viewModel)
        })
    }
}

#Preview {
    PlanView()
}
