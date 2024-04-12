//
//  LoginScreen.swift
//  ecomm
//
//  Created by Tejash Singh on 11/04/24.
//

import SwiftUI

struct LoginScreen: View {
    
    @StateObject var loginData = LoginModel()
    @State var showProductPage: Bool = false
    var body: some View {
        
        
        GeometryReader { geometry in
            VStack{
                
                Text("Welcome\nBack")
                    .font(.custom(customFont,size: 55).bold())
                    .foregroundStyle(Color(.white))
                    .frame(height: geometry.size.height / 3.5)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding()
                //in vid he added a custom background no need
                
                ScrollView(.vertical,showsIndicators: false){
                    
                    //login form
                    
                    VStack(spacing: 15){
                        Text(loginData.registerUser ? "Register":"Login")
                            .font(.custom(customFont, size: 22).bold())
                            .frame(maxWidth: .infinity,alignment: .leading)
                        
                        //custom text field
                        CustomTextField(icon: "envelope", title: "Email", hint: "abc@gmail.com", value: $loginData.email, showPassword: .constant(false)).padding(.top,30 )
                        
                        CustomTextField(icon: "lock", title: "Password", hint: "123456", value: $loginData.password, showPassword: $loginData.showPassword).padding(.top,30 )
                        //register reenter password
                        if loginData.registerUser{
                            CustomTextField(icon: "envelope", title: "re enter password", hint: "123456", value: $loginData.reEnterPassword, showPassword: $loginData.showReEnterPassword).padding(.top,10 )
                        }
                        //forgot password Button
                        
                        Button{
                            loginData.ForgotPassword()
                        }label:{
                            Text("forgot pass?")
                                .font(.custom(customFont,size: 14))
                                .fontWeight(.semibold)
                                .foregroundStyle(Color(red: 0.3, green: 0.2, blue: 1))
                        }
                        .padding(.top,8)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        
                        //Login Button.....
                        
                        Button{
                            if loginData.registerUser{
                                loginData.Register()
                                showProductPage = true
                            }else{
                                showProductPage = true
                                loginData.Login()
                            }
                        }label:{
                            Text("Login")
                                .font(.custom(customFont,size: 17).bold())
                                .padding(.vertical,20)
                                .frame(maxWidth: .infinity)
                                .foregroundStyle(Color.white)
                                .background(Color(red: 0.3, green: 0.2, blue: 1))
                                .cornerRadius(15)
                                .shadow(color: Color.black.opacity(0.07),radius: 5,x:5,y:5)
                        }
                        .padding(.top,8)
                        
                        //register button
                        
                        Button{
                            withAnimation{
                                loginData.registerUser.toggle()
                            }
                        }label:{
                            Text(loginData.registerUser ? "Back to login":"Create account")
                                .font(.custom(customFont,size: 14))
                                .fontWeight(.semibold)
                                .foregroundStyle(Color(red: 0.3, green: 0.2, blue: 1))
                        }
                        .padding(.top,8)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        
                        
                        
                    }
                    .padding(30)
                    
                }
                .frame(maxWidth: .infinity,maxHeight: .infinity)
                .background(Color(.white)
                    .clipShape(CustomCorner(corners: [.topLeft,.topRight], radius: 25))
                    .ignoresSafeArea()
                )
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 0.3, green: 0.2, blue: 1))
            
            //claearing data when changes will do later
        }
        .overlay(
            
            Group{
                if showProductPage{
                    ProductView()
                        .transition(.move(edge: .bottom))
                }
            }
            
        )
    }
    
    
    
    @ViewBuilder
    func CustomTextField(icon: String, title: String, hint:String,value:Binding<String>,showPassword:Binding<Bool>)-> some View{
        
        VStack(alignment: .leading, spacing: 12){
            Label{
                Text(title)
                    .font(.custom(customFont, size: 14))
            } icon:{
                Image(systemName: icon)
            }
            .foregroundStyle(Color.black.opacity(0.8))
            
            if title.contains("Password") && !showPassword.wrappedValue{
                SecureField(hint, text: value)
                    .padding(.top,2)
            }else{
                TextField(hint, text: value)
                    .padding(.top,2)
            }
            
            Divider()
                .background(Color.black.opacity(0.4))
        }
        //showing button for password field....
        .overlay(
            Group{
                if title.contains("Password"){
                    Button(action:{
                        showPassword.wrappedValue.toggle()
                    },label:{
                        Text(showPassword.wrappedValue ? "Hide":"show")
                            .font(.custom(customFont,size: 13).bold())
                            .foregroundStyle(Color(red: 0.3, green: 0.2, blue: 1))
                    })
                    .offset(y: 8)
                }
                
            }
            ,alignment: .trailing
            
        )
    }
    
//op
    
}

#Preview {
    LoginScreen()
}
