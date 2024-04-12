//
//  LoginModel.swift
//  ecomm
//
//  Created by Tejash Singh on 11/04/24.
//

import Foundation
import SwiftUI

class LoginModel: ObservableObject{
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showPassword: Bool = false
    
    
    @Published var registerUser: Bool = false
    @Published var reEnterPassword: String = ""
    @Published var showReEnterPassword: Bool = false
    
    func Login(){
        
    }
    
    func Register(){
        
    }

    func ForgotPassword(){
        
    }
    
}
