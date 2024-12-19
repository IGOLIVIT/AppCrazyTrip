//
//  AddSight.swift
//  AppCrazyTrip
//
//  Created by IGOR on 17/12/2024.
//

import SwiftUI

struct AddSight: View {

    @StateObject var viewModel: ItemsViewModel
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
                        
                        Menu(content: {
                            
                            ForEach(viewModel.sightPhotos, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.currentSPhoto = index
                                    
                                }, label: {
                                    
                                    Text(index)
                                })
                            }
                            
                        }, label: {
                            
                            if viewModel.currentSPhoto.isEmpty {
                                
                                VStack(spacing: 15) {
                                    
                                    Image(systemName: "photo")
                                        .foregroundColor(.gray.opacity(0.6))
                                        .font(.system(size: 18, weight: .regular))
                                    
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .frame(height: 250)
                                .background(RoundedRectangle(cornerRadius: 20).fill(.gray.opacity(0.2)))
                                
                            } else {
                                
                                Image(viewModel.currentSPhoto)
                                    .resizable()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 250)
                            }
                        })
                        .padding(.bottom)
                        
                        Text("Sight")
                            .foregroundColor(.black)
                            .font(.system(size: 17, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.sigName.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.sigName)
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.2)))

                        Button(action: {

                            viewModel.sigPhoto = viewModel.currentSPhoto
                            
                            viewModel.addSight()
                            
                            viewModel.sigName = ""
                            viewModel.currentSPhoto = ""
                            
                            viewModel.fetchItems()
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddSight = false
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .medium))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                        })
                        .opacity(viewModel.sigName.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.sigName.isEmpty ? true : false)
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
    AddSight(viewModel: ItemsViewModel())
}
