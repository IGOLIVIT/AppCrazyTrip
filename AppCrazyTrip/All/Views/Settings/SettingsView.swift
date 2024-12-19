//
//  SettingsView.swift
//  AppCrazyTrip
//
//  Created by IGOR on 16/12/2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("SETTINGS")
                        .foregroundColor(.black)
                        .font(.system(size: 24, weight: .bold))
                    
                    Spacer()
                    
                }
                .padding(.bottom, 30)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 15) {
                        
                        Button(action: {
                            
                            SKStoreReviewController.requestReview()
                            
                        }, label: {
                            
                            Text("Rate App")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 55)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                        })
                        
                        Button(action: {
                            
                            guard let url = URL(string: "https://www.termsfeed.com/live/3a419599-3b7e-4627-ab91-26564f7dbe19") else { return }
                            
                            UIApplication.shared.open(url)
                            
                        }, label: {
                            
                            Text("Usage Policy")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 55)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                        })
                        
                    }
                }
                
            }
            .padding()
        }
    }
}

#Preview {
    SettingsView()
}
