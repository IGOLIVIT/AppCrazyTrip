//
//  s5.swift
//  AppCrazyTrip
//
//  Created by IGOR on 16/12/2024.
//

import SwiftUI

struct s5: View {

    @StateObject var viewModel = SViewModel()
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("s6")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Spacer()
                
                VStack {
                    
                    Text("5/6")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .medium))
                        .padding(4)
                        .padding(.horizontal, 7)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("tbg")))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    
                    Text("WHERE ARE YOU FROM?")
                        .foregroundColor(.black)
                        .font(.system(size: 24, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .leading)

                    ZStack(content: {
                        
                        Text("USA, California")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.addFrom.isEmpty ? 1 : 0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        TextField("", text: $viewModel.addFrom)
                            .foregroundColor(Color.black)
                            .font(.system(size: 16, weight: .medium))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.2)))
                    .padding(.vertical)
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        s6()
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
                        
                        viewModel.from = viewModel.addFrom
                    }
                    .padding(.bottom, 25)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 310)
                .background(RoundedRectangle(cornerRadius: 20).fill(.white))
            }
            .ignoresSafeArea()

        }
    }
}

#Preview {
    s5()
}
