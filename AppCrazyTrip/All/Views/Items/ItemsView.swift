//
//  ItemsView.swift
//  AppCrazyTrip
//
//  Created by IGOR on 16/12/2024.
//

import SwiftUI

struct ItemsView: View {
    
    @StateObject var viewModel = ItemsViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("ITEMS")
                        .foregroundColor(.black)
                        .font(.system(size: 24, weight: .bold))
                    
                    Spacer()
                    
                    Menu(content: {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddCity = true
                            }
                            
                        }, label: {
                            
                            Text("Add city")
                                .foregroundColor(.black)
                                .font(.system(size: 22, weight: .medium))
                        })
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddSight = true
                            }
                            
                        }, label: {
                            
                            Text("Add sight")
                                .foregroundColor(.black)
                                .font(.system(size: 22, weight: .medium))
                        })
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                            .font(.system(size: 22, weight: .medium))
                    })
                    
                }
                .padding(.bottom, 30)
                
                if viewModel.items.isEmpty && viewModel.sights.isEmpty {
                    
                    VStack(alignment: .leading) {
                        
                        Text("You don't have any cities and sights yet.")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                        
                        Menu(content: {
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isAddCity = true
                                }
                                
                            }, label: {
                                
                                Text("Add city")
                                    .foregroundColor(.black)
                                    .font(.system(size: 22, weight: .medium))
                            })
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isAddSight = true
                                }
                                
                            }, label: {
                                
                                Text("Add sight")
                                    .foregroundColor(.black)
                                    .font(.system(size: 22, weight: .medium))
                            })
                            
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
                    
                    HStack {
                        
                        ForEach(viewModel.variants, id: \.self) { index in
                            
                            Button(action: {
                                
                                viewModel.variantsForFilter = index
                                
                            }, label: {
                                
                                Text(index)
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .semibold))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 50)
                                    .background(RoundedRectangle(cornerRadius: 40).fill(viewModel.variantsForFilter == index ? Color("tbg") : .white))
                            })
                        }
                    }
                    .padding(.vertical)
                    
                    if viewModel.variantsForFilter == "City" {
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                                
                                ForEach(viewModel.items, id: \.self) { index in
                                    
                                    VStack(alignment: .leading, spacing: 12) {
                                        
                                        Image(index.itPhoto ?? "")
                                            .resizable()
                                            .frame(width: 100, height: 100)
                                        
                                        Text(index.itCity ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 20, weight: .bold))
                                        
                                        HStack {
                                            
                                            Text("Sight")
                                                .foregroundColor(.black)
                                                .font(.system(size: 16, weight: .regular))
                                            
                                            Spacer()
                                            
                                            Text(index.itSumSig ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 16, weight: .semibold))
                                        }
                                        
                                        Button(action: {
                                            
                                            viewModel.selectedItem = index
                                            
                                            withAnimation(.spring()) {
                                                
                                                viewModel.isDetailCity = true
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
                        
                    } else {
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                                
                                ForEach(viewModel.sights, id: \.self) { index in
                                    
                                    VStack(alignment: .leading, spacing: 12) {
                                        
                                        Image(index.sigPhoto ?? "")
                                            .resizable()
                                            .frame(width: 100, height: 100)
                                        
                                        Text(index.sigName ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 20, weight: .bold))
                                        
                                        Button(action: {
                                            
                                            viewModel.selectedSight = index
                                            
                                            withAnimation(.spring()) {
                                                
                                                viewModel.isDetailSight = true
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
        }
        .onAppear{
            
            viewModel.fetchItems()
        }
        .onAppear {
            
            viewModel.fetchSights()
        }
        .sheet(isPresented: $viewModel.isAddCity, content: {
            
            AddCity(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isAddSight, content: {
            
            AddSight(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isDetailCity, content: {
            
            CityDetail(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isDetailSight, content: {
            
            SightDetail(viewModel: viewModel)
        })
    }
}

#Preview {
    ItemsView()
}
