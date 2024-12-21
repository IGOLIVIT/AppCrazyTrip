//
//  LoadingView.swift
//  AppCrazyTrip
//
//  Created by IGOR on 16/12/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("bg")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Spacer()
                
                ProgressView()
                       .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
                       .padding()
                       .padding(.bottom, 130)

            }
        }
    }
}

#Preview {
    LoadingView()
}
