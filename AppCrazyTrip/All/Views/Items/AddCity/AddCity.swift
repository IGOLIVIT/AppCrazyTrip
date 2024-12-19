//
//  AddCity.swift
//  AppCrazyTrip
//
//  Created by IGOR on 17/12/2024.
//

import SwiftUI

struct AddCity: View {

    @StateObject var viewModel: ItemsViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Button(action: {
                        
                        viewModel.itSig1 = ""
                        viewModel.itSig2 = ""
                        viewModel.itSig3 = ""
                        viewModel.itSig4 = ""
                        viewModel.currentCPhoto = ""
                        
                        viewModel.itSumSig = ""
                        
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
                            
                            ForEach(viewModel.cityPhotos, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.currentCPhoto = index
                                    
                                }, label: {
                                    
                                    Text(index)
                                })
                            }
                            
                        }, label: {
                            
                            if viewModel.currentCPhoto.isEmpty {
                                
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
                                
                                Image(viewModel.currentCPhoto)
                                    .resizable()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 250)
                            }
                        })
                        .padding(.bottom)
                        
                        Text("City")
                            .foregroundColor(.black)
                            .font(.system(size: 17, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.itCity.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.itCity)
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.2)))

                        Text("Sights")
                            .foregroundColor(.black)
                            .font(.system(size: 17, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack {
                            
                            ZStack(content: {
                                
                                Text("1")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.itSig1.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.itSig1)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.2)))
                            
                            ZStack(content: {
                                
                                Text("2")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.itSig2.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.itSig2)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.2)))
                            
                        }
                        
                        HStack {
                            
                            ZStack(content: {
                                
                                Text("3")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.itSig3.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.itSig3)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.2)))
                            
                            ZStack(content: {
                                
                                Text("4")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.itSig4.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.itSig4)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.2)))
                            
                        }
                        
                        Button(action: {

                            if viewModel.itSig2.isEmpty && viewModel.itSig3.isEmpty && viewModel.itSig4.isEmpty {
                                
                                viewModel.itSumSig = String("1")
                                
                            } else if viewModel.itSig3.isEmpty && viewModel.itSig4.isEmpty {
                                
                                viewModel.itSumSig = String("2")
                                
                            } else if viewModel.itSig4.isEmpty {
                                
                                viewModel.itSumSig = String("3")
                                
                            } else {
                                
                                viewModel.itSumSig = String("4")
                                
                            }
                            
                            viewModel.itPhoto = viewModel.currentCPhoto
                            
                            viewModel.addItem()
                            
                            viewModel.itSig1 = ""
                            viewModel.itSig2 = ""
                            viewModel.itSig3 = ""
                            viewModel.itSig4 = ""
                            viewModel.currentCPhoto = ""
                            
                            viewModel.itSumSig = ""
                            
                            viewModel.fetchItems()
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddCity = false
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .medium))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                        })
                        .opacity(viewModel.itCity.isEmpty || viewModel.itSig1.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.itCity.isEmpty || viewModel.itSig1.isEmpty ? true : false)
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
    AddCity(viewModel: ItemsViewModel())
}
