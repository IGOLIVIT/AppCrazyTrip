//
//  s2.swift
//  AppCrazyTrip
//
//  Created by IGOR on 16/12/2024.
//

import SwiftUI

struct s2: View {

    @StateObject var viewModel = SViewModel()
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("s2")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Spacer()
                
                VStack {
                    
                    Text("2/6")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .medium))
                        .padding(4)
                        .padding(.horizontal, 7)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("tbg")))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    
                    Text("HOW OFTEN DO YOU TRAVEL?")
                        .foregroundColor(.black)
                        .font(.system(size: 22, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
     
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 18, content: {
                        
                        ForEach(viewModel.oftenTravel, id: \.self) { index in
                        
                            Button(action: {
                                
                                viewModel.currTravel = index
                                
                            }, label: {
                                
                                HStack {
                                    
                                    ZStack {
                                        
                                        Circle()
                                            .fill(.gray.opacity(0.2))
                                            .frame(width: 30)
                                        
                                        Circle()
                                            .fill(Color("prim"))
                                            .frame(width: 17)
                                            .opacity(viewModel.currTravel == index ? 1 : 0)
                                    }
                                    
                                    Text(index)
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .regular))
                                    
                                    Spacer()
                                }
                            })
                        }
                    })
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        s3()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Text("Continue")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                    })
                    .onTapGesture {
                        
                        viewModel.appOfTrav = viewModel.currTravel
                    }
                    .padding(.bottom, 25)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 360)
                .background(RoundedRectangle(cornerRadius: 20).fill(.white))
            }
            .ignoresSafeArea()

        }
    }
}

#Preview {
    s2()
}
