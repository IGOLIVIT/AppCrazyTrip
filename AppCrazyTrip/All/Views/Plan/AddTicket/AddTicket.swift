//
//  AddTicket.swift
//  AppCrazyTrip
//
//  Created by IGOR on 17/12/2024.
//

import SwiftUI

struct AddTicket: View {

    @StateObject var viewModel: PlanViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Button(action: {
                        
                        viewModel.ticCountry = ""
                        viewModel.ticNT = ""
                        viewModel.ticTP = ""
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Image(systemName: "chevron.left.circle")
                            .foregroundColor(.black)
                            .font(.system(size: 17, weight: .regular))
                        
                    })
                    
                    Spacer()
                    
                }
                .padding(.bottom, 25)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 10) {

                        Text("Country")
                            .foregroundColor(.black)
                            .font(.system(size: 17, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.ticCountry.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.ticCountry)
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.2)))

                        HStack {
                            
                            VStack(alignment: .leading, spacing: 8) {
                                
                                Text("Number of tickets")
                                    .foregroundColor(.black)
                                    .font(.system(size: 17, weight: .medium))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                ZStack(content: {
                                    
                                    Text("0")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                        .opacity(viewModel.ticNT.isEmpty ? 1 : 0)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    TextField("", text: $viewModel.ticNT)
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 16, weight: .medium))
                                    
                                })
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.2)))
                            }
                            
                            VStack(alignment: .leading, spacing: 8) {
                                
                                Text("Tickets price")
                                    .foregroundColor(.black)
                                    .font(.system(size: 17, weight: .medium))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                ZStack(content: {
                                    
                                    Text("0 $")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                        .opacity(viewModel.ticTP.isEmpty ? 1 : 0)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    TextField("", text: $viewModel.ticTP)
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 16, weight: .medium))
                                    
                                })
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.2)))
                            }
                        }

                        Button(action: {
                            
                            viewModel.totalSum += Int(viewModel.ticTP) ?? 0
                            viewModel.totalTickets += Int(viewModel.ticNT) ?? 0
                            viewModel.totalCountries += 1
    
                            viewModel.addTicket()
                            
                            viewModel.ticCountry = ""
                            viewModel.ticNT = ""
                            viewModel.ticTP = ""
                            
                            viewModel.fetchTickets()
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddTicket = false
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .medium))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                        })
                        .padding(.top)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 20).fill(.white))
                }
                
            }
            .padding()
        }
    }
}

#Preview {
    AddTicket(viewModel: PlanViewModel())
}
