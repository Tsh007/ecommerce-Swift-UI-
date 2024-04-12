//
//  WelcomeScreen.swift
//  ecomm
//
//  Created by Tejash Singh on 11/04/24.
//

import SwiftUI

let customFont = "Raleway-Regular"

struct WelcomeScreen: View {
    
    @State var showLoginPage: Bool = false
    var body: some View {
        VStack(alignment: .leading){
            Text("Find Your\nProduct ")
                .font(.custom(customFont, size: 55))
                .fontWeight(.bold)
                .foregroundStyle(Color(.white))
            
            Image("welcome")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 30)
            
            Button{
                withAnimation{
                    showLoginPage = true
                }
            }label:{
                Text("Get started")
                    .font(.custom(customFont,size: 18))
                    .fontWeight(.semibold)
                    .padding(.vertical,18)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.1),radius: 5, x:5, y:5)
                    .foregroundColor(Color(red: 0.3, green: 0.2, blue: 1))
            }
            .padding(.horizontal,30)
            .offset(y: 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
        
            Color(red: 0.3, green: 0.2, blue: 1)
        )
        .overlay(
            
            Group{
                if showLoginPage{
                    LoginScreen()
                        .transition(.move(edge: .bottom))
                }
            }
            
        )
    }
}

#Preview {
    WelcomeScreen()
}
