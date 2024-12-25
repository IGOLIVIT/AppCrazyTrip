//
//  AddBaggage.swift
//  AppCrazyTrip
//
//  Created by IGOR on 25/12/2024.
//

import SwiftUI

struct AddBaggage: View {

    @StateObject var viewModel: PlanViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Button(action: {
                        
                        viewModel.bagCountry = ""
                        viewModel.bagNumber = ""
                        viewModel.bagWeight = ""
                        
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
                                .opacity(viewModel.bagCountry.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.bagCountry)
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.2)))

                        HStack {
                            
                            VStack(alignment: .leading, spacing: 8) {
                                
                                Text("Number of bags")
                                    .foregroundColor(.black)
                                    .font(.system(size: 17, weight: .medium))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                ZStack(content: {
                                    
                                    Text("0")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                        .opacity(viewModel.bagNumber.isEmpty ? 1 : 0)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    TextField("", text: $viewModel.bagNumber)
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 16, weight: .medium))
                                    
                                })
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.2)))
                            }
                            
                            VStack(alignment: .leading, spacing: 8) {
                                
                                Text("Baggage weight")
                                    .foregroundColor(.black)
                                    .font(.system(size: 17, weight: .medium))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                ZStack(content: {
                                    
                                    Text("0")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                        .opacity(viewModel.bagWeight.isEmpty ? 1 : 0)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    TextField("", text: $viewModel.bagWeight)
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 16, weight: .medium))
                                    
                                })
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.2)))
                            }
                        }

                        Button(action: {
                            
                            viewModel.totalWeight += Int(viewModel.bagWeight) ?? 0
                            viewModel.totalBags += Int(viewModel.bagNumber) ?? 0

                            viewModel.addBag()
                            
                            viewModel.bagCountry = ""
                            viewModel.bagNumber = ""
                            viewModel.bagWeight = ""
                            
                            viewModel.fetchBags()
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddBag = false
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
                        .opacity(viewModel.bagCountry.isEmpty || viewModel.bagNumber.isEmpty || viewModel.bagWeight.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.bagCountry.isEmpty || viewModel.bagNumber.isEmpty || viewModel.bagWeight.isEmpty ? true : false)
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
    AddBaggage(viewModel: PlanViewModel())
}
