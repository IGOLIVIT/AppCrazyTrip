//
//  EditBaggage.swift
//  AppCrazyTrip
//
//  Created by IGOR on 25/12/2024.
//

import SwiftUI

struct EditBaggage: View {

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
                    
                }
                .padding(.bottom, 25)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 10) {
                        
                        HStack {
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isAddBag = true
                                }
                                
                            }, label: {
                                
                                Text("Add Weight")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .semibold))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 50)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(Color.black))
                            })
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isEditBagss = false
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
                        
                        if viewModel.bags.isEmpty {
                            
                            Text("Empty")
                                .foregroundColor(.black)
                                .font(.system(size: 22, weight: .semibold))
                                .padding(.top)
                            
                            Text("Add baggage")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                            
                        } else {
                            
                            LazyVStack(spacing: 12) {
                                
                                ForEach(viewModel.bags, id: \.self) { index in
                                    
                                    HStack {
                                        
                                        VStack(alignment: .leading) {
                                            
                                            Text(index.bagCountry ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 17, weight: .semibold))
                                            
                                            Text("Bags: \(index.bagNumber ?? "")")
                                        }
                                        
                                        Spacer()
                                        
                                        Text("\(index.bagWeight ?? "") KG")
                                            .foregroundColor(.black)
                                            .font(.system(size: 18, weight: .bold))
                                        
                                        Button(action: {
                                            
                                            viewModel.selectedBag = index
                                            
                                            withAnimation(.spring()) {
                                                
                                                viewModel.isDeleteBag = true
                                            }
                                            
                                        }, label: {
                                            
                                            Image(systemName: "trash")
                                                .foregroundColor(.black)
                                                .font(.system(size: 16, weight: .regular))
                                        })
                                    }
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
            
            viewModel.fetchBags()
        }
        .sheet(isPresented: $viewModel.isAddBag, content: {
        
            AddBaggage(viewModel: viewModel)
        })
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDeleteBag ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDeleteBag = false
                        }
                    }
                
                VStack(spacing: 19) {

                    Text("Do you want to delete baggage?")
                        .foregroundColor(.black)
                        .font(.system(size: 17, weight: .semibold))
                        .multilineTextAlignment(.center)
                    
                    HStack {
                        
                        Button(action: {
                            
                            CoreDataStack.shared.deleteBag(withBagWeight: viewModel.selectedBag?.bagWeight ?? "", completion: {
                                
                                viewModel.fetchBags()
                            })
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDeleteBag = false
                            }
                            
                        }, label: {
                            
                            Text("Delete")
                                .foregroundColor(.red)
                                .font(.system(size: 18, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                            
                        })
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDeleteBag = false
                            }
                            
                        }, label: {
                            
                            Text("Cancel")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                            
                        })
                    }
                    .padding(.top, 25)

                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                .padding()
                .offset(y: viewModel.isDeleteBag ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    EditBaggage(viewModel: PlanViewModel())
}
