//
//  PlanDetail.swift
//  AppCrazyTrip
//
//  Created by IGOR on 17/12/2024.
//

import SwiftUI

struct PlanDetail: View {
    
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
                    
                    Text(viewModel.selectedPlan?.plCountry ?? "")
                        .foregroundColor(.black)
                        .font(.system(size: 22, weight: .bold))
                }
                .padding(.bottom, 25)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(alignment: .leading, spacing: 12) {
                        
                        Image(viewModel.selectedPlan?.plPhoto ?? "")
                            .resizable()
                            .frame(maxWidth: .infinity)
                            .frame(height: 170)
                        
                        Text(viewModel.selectedPlan?.plCountry ?? "")
                            .foregroundColor(.black)
                            .font(.system(size: 22, weight: .bold))
                        
                        Text("Cities")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .semibold))
                        
                        HStack {
                            
                            Text(viewModel.selectedPlan?.plCity1 ?? "")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                            
                            Text(viewModel.selectedPlan?.plCity2 ?? "")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        }
                        
                        HStack {
                            
                            Text(viewModel.selectedPlan?.plCity3 ?? "")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                            
                            Text(viewModel.selectedPlan?.plCity4 ?? "")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        }
                        
                        Text("Sights")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .semibold))
                        
                        HStack {
                            
                            Text(viewModel.selectedPlan?.plSig1 ?? "")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                            
                            Text(viewModel.selectedPlan?.plSig2 ?? "")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        }
                        
                        HStack {
                            
                            Text(viewModel.selectedPlan?.plSig3 ?? "")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                            
                            Text(viewModel.selectedPlan?.plSig4 ?? "")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        }
                        
                        HStack {
                            
                            Text("Number of tickets")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .semibold))
                            
                            Spacer()
                            
                            Text(viewModel.selectedPlan?.plNT ?? "")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .semibold))
                        }
                        
                        HStack {
                            
                            Text("Tickets price")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .semibold))
                            
                            Spacer()
                            
                            Text(viewModel.selectedPlan?.plTP ?? "")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .semibold))
                        }
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = true
                            }
                            
                        }, label: {
                            
                            Text("Delete")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 15).fill(.black))
                        })
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 20).fill(.white))
                }
            }
            .padding()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                    }
                
                VStack(spacing: 19) {

                    Text("Do you want to delete \(Text(viewModel.selectedPlan?.plCountry ?? ""))?")
                        .foregroundColor(.black)
                        .font(.system(size: 17, weight: .semibold))
                        .multilineTextAlignment(.center)
                    
                    HStack {
                        
                        Button(action: {
                            
                            CoreDataStack.shared.deletePlan(withPlCity1: viewModel.selectedPlan?.plCity1 ?? "", completion: {
                                
                                viewModel.fetchPlans()
                            })
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                                viewModel.isDetail = false
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
                                
                                viewModel.isDelete = false
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
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    PlanDetail(viewModel: PlanViewModel())
}
