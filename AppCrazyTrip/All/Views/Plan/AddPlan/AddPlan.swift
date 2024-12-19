//
//  AddPlan.swift
//  AppCrazyTrip
//
//  Created by IGOR on 17/12/2024.
//

import SwiftUI

struct AddPlan: View {
    
    @StateObject var viewModel: PlanViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Button(action: {
                        
                        viewModel.plCountry = ""
                        viewModel.plCity1 = ""
                        viewModel.plCity2 = ""
                        viewModel.plCity3 = ""
                        viewModel.plCity4 = ""
                        viewModel.plSig1 = ""
                        viewModel.plSig2 = ""
                        viewModel.plSig3 = ""
                        viewModel.plSig4 = ""
                        viewModel.plTP = ""
                        viewModel.plNT = ""
                        
                        viewModel.currentDay = ""
                        viewModel.currentPhoto = ""
                        
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
                            
                            ForEach(viewModel.photos, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.currentPhoto = index
                                    
                                }, label: {
                                    
                                    Text(index)
                                })
                            }
                            
                        }, label: {
                            
                            if viewModel.currentPhoto.isEmpty {
                                
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
                                
                                Image(viewModel.currentPhoto)
                                    .resizable()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 250)
                            }
                        })
                        .padding(.bottom)
                        
                        Text("Country")
                            .foregroundColor(.black)
                            .font(.system(size: 17, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.plCountry.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.plCountry)
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.2)))
                        
                        Text("Cities")
                            .foregroundColor(.black)
                            .font(.system(size: 17, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack {
                            
                            ZStack(content: {
                                
                                Text("1")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.plCity1.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.plCity1)
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
                                    .opacity(viewModel.plCity2.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.plCity2)
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
                                    .opacity(viewModel.plCity3.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.plCity3)
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
                                    .opacity(viewModel.plCity4.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.plCity4)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.2)))
                            
                        }
                        
                        Text("Sights")
                            .foregroundColor(.black)
                            .font(.system(size: 17, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack {
                            
                            ZStack(content: {
                                
                                Text("1")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.plSig1.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.plSig1)
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
                                    .opacity(viewModel.plSig2.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.plSig2)
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
                                    .opacity(viewModel.plSig3.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.plSig3)
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
                                    .opacity(viewModel.plSig4.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.plSig4)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.2)))
                            
                        }
                        
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
                                        .opacity(viewModel.plNT.isEmpty ? 1 : 0)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    TextField("", text: $viewModel.plNT)
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
                                        .opacity(viewModel.plTP.isEmpty ? 1 : 0)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    TextField("", text: $viewModel.plTP)
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 16, weight: .medium))
                                    
                                })
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.2)))
                            }
                        }
                        
                        HStack {
                            
                            ForEach(viewModel.weekDays, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.currentDay = index
                                    
                                }, label: {
                                    
                                    Text(index)
                                        .foregroundColor(.black)
                                        .font(.system(size: 14, weight: .semibold))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 50)
                                        .background(RoundedRectangle(cornerRadius: 15).fill(viewModel.currentDay == index ? Color("prim") : .gray.opacity(0.2)))
                                })
                            }
                        }
                        
                        Button(action: {
                            
                            if viewModel.plCity2.isEmpty && viewModel.plCity3.isEmpty && viewModel.plCity4.isEmpty {
                                
                                viewModel.plSumCity = String("1")
                                
                            } else if viewModel.plCity3.isEmpty && viewModel.plCity4.isEmpty {
                                
                                viewModel.plSumCity = String("2")
                                
                            } else if viewModel.plCity4.isEmpty {
                                
                                viewModel.plSumCity = String("3")
                                
                            } else {
                                
                                viewModel.plSumCity = String("3")
                                
                            }
                            
                            if viewModel.plSig2.isEmpty && viewModel.plSig3.isEmpty && viewModel.plSig4.isEmpty {
                                
                                viewModel.plSumSights = String("1")
                                
                            } else if viewModel.plSig3.isEmpty && viewModel.plSig4.isEmpty {
                                
                                viewModel.plSumSights = String("2")
                                
                            } else if viewModel.plSig4.isEmpty {
                                
                                viewModel.plSumSights = String("3")
                                
                            } else {
                                
                                viewModel.plSumSights = String("4")
                                
                            }
                            
                            viewModel.totalSum += Int(viewModel.plTP) ?? 0
                            viewModel.totalTickets += Int(viewModel.plNT) ?? 0
                            viewModel.totalCountries += 1

                            viewModel.plPhoto = viewModel.currentPhoto
                            viewModel.plDay = viewModel.currentDay
                            
                            viewModel.addPlan()
                            
                            viewModel.plCountry = ""
                            viewModel.plCity1 = ""
                            viewModel.plCity2 = ""
                            viewModel.plCity3 = ""
                            viewModel.plCity4 = ""
                            viewModel.plSig1 = ""
                            viewModel.plSig2 = ""
                            viewModel.plSig3 = ""
                            viewModel.plSig4 = ""
                            viewModel.plTP = ""
                            viewModel.plNT = ""
                            viewModel.plSumCity = ""
                            viewModel.plSumSights = ""
                            
                            viewModel.currentDay = ""
                            viewModel.currentPhoto = ""
                            
                            viewModel.fetchPlans()
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .medium))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                        })
                        .opacity(viewModel.plCountry.isEmpty || viewModel.plCity1.isEmpty || viewModel.plNT.isEmpty || viewModel.plTP.isEmpty || viewModel.currentPhoto.isEmpty || viewModel.currentDay.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.plCountry.isEmpty || viewModel.plCity1.isEmpty || viewModel.plNT.isEmpty || viewModel.plTP.isEmpty || viewModel.currentPhoto.isEmpty || viewModel.currentDay.isEmpty ? true : false)
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
    AddPlan(viewModel: PlanViewModel())
}
