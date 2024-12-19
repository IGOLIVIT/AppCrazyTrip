//
//  s3.swift
//  AppCrazyTrip
//
//  Created by IGOR on 16/12/2024.
//

import SwiftUI

struct s3: View {

    @StateObject var viewModel = SViewModel()
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("s3")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Spacer()
                
                VStack {
                    
                    Text("3/6")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .medium))
                        .padding(4)
                        .padding(.horizontal, 7)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("tbg")))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    
                    Text("WHERE WOULD YOU LIKE TO TRAVEL?")
                        .foregroundColor(.black)
                        .font(.system(size: 24, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ZStack(content: {
                        
                        Text("Text here...")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.addWhereTrav.isEmpty ? 1 : 0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        TextField("", text: $viewModel.addWhereTrav)
                            .foregroundColor(Color.black)
                            .font(.system(size: 16, weight: .medium))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 100, alignment: .top)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.2)))
                    .padding(.vertical)
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        s4()
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
                        
                        viewModel.whereTrav = viewModel.addWhereTrav
                    }
                    .padding(.bottom, 25)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 370)
                .background(RoundedRectangle(cornerRadius: 20).fill(.white))
            }
            .ignoresSafeArea()

        }
    }
}

#Preview {
    s3()
}
