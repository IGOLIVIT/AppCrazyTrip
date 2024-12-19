//
//  s6.swift
//  AppCrazyTrip
//
//  Created by IGOR on 16/12/2024.
//

import SwiftUI

struct s6: View {

    @StateObject var viewModel = SViewModel()
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("s7")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Spacer()
                
                VStack {
                    
                    Text("6/6")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .medium))
                        .padding(4)
                        .padding(.horizontal, 7)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("tbg")))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    
                    Text("HOW DID YOU KNOW ABOUT US?")
                        .foregroundColor(.black)
                        .font(.system(size: 22, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
     
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 18, content: {
                        
                        ForEach(viewModel.howNows, id: \.self) { index in
                        
                            Button(action: {
                                
                                viewModel.currHowKnow = index
                                
                            }, label: {
                                
                                HStack {
                                    
                                    ZStack {
                                        
                                        Circle()
                                            .fill(.gray.opacity(0.2))
                                            .frame(width: 30)
                                        
                                        Circle()
                                            .fill(Color("prim"))
                                            .frame(width: 17)
                                            .opacity(viewModel.currHowKnow == index ? 1 : 0)
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
                    
                    Button(action: {
                        
                        viewModel.appHowKnow = viewModel.currHowKnow
                        viewModel.status = true
                        
                    }, label: {
                        
                        Text("Continue")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                    })
                    .padding(.bottom, 25)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 390)
                .background(RoundedRectangle(cornerRadius: 20).fill(.white))
            }
            .ignoresSafeArea()

        }
    }
}

#Preview {
    s6()
}
