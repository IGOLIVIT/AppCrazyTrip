//
//  BaggageView.swift
//  AppCrazyTrip
//
//  Created by IGOR on 25/12/2024.
//

import SwiftUI

struct BaggageView: View {

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
                    
                    Text("BAGGAGE WEIGHT")
                        .foregroundColor(.black)
                        .font(.system(size: 22, weight: .bold))
                    
                }
                .padding(.bottom, 25)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 10) {
                        
                        VStack(alignment: .leading, spacing: 14) {
                            
                            Text("\(viewModel.totalWeight) KG")
                                .foregroundColor(.black)
                                .font(.system(size: 20, weight: .bold))
                                .opacity(0)
                            
                            HStack {
                                
                                Text("Bags")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                                
                                Spacer()
                                
                                Text("\(viewModel.totalBags)")
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
                                    
                                    Text("\(viewModel.totalWeight) KG")
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
                                
                                viewModel.isEditBagss = true
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
        .sheet(isPresented: $viewModel.isEditBagss, content: {
            
            EditBaggage(viewModel: viewModel)
        })
    }
}

#Preview {
    BaggageView(viewModel: PlanViewModel())
}
