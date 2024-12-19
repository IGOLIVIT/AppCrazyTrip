//
//  s4.swift
//  AppCrazyTrip
//
//  Created by IGOR on 16/12/2024.
//

import SwiftUI

struct s4: View {

    @StateObject var viewModel = SViewModel()
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("s4")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Spacer()
                
                VStack {
                    
                    Text("4/6")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .medium))
                        .padding(4)
                        .padding(.horizontal, 7)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("tbg")))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    
                    Text("WHERE HAVE TOU TRAVELED MOST OFTEN?")
                        .foregroundColor(.black)
                        .font(.system(size: 22, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
     
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 18, content: {
                        
                        ForEach(viewModel.whereTravel, id: \.self) { index in
                        
                            Button(action: {
                                
                                viewModel.currWhereTrav = index
                                
                            }, label: {
                                
                                HStack {
                                    
                                    ZStack {
                                        
                                        Circle()
                                            .fill(.gray.opacity(0.2))
                                            .frame(width: 30)
                                        
                                        Circle()
                                            .fill(Color("prim"))
                                            .frame(width: 17)
                                            .opacity(viewModel.currWhereTrav == index ? 1 : 0)
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
                        
                        s5()
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
                        
                        viewModel.appWhereTrav = viewModel.currWhereTrav
                    }
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
    s4()
}
