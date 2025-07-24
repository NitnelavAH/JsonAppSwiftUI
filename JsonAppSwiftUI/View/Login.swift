//
//  Login.swift
//  JsonAppSwiftUI
//
//  Created by Developer on 20/07/25.
//

import SwiftUI

struct Login: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    @EnvironmentObject var login: PostViewModel
    var body: some View {
        ZStack {
            Color.blue.edgesIgnoringSafeArea(.all)
            VStack {
                Text("Email").foregroundColor(.white).bold()
                
                TextField("Email", text: $email)
                    .background(Color.white)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                
                Text("Password").foregroundColor(.white).bold()
                
                SecureField("Password", text: $password)
                    .background(Color.white)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    login.login(email: email, password: password)
                }) {
                    Text("Enter").foregroundColor(.white).bold()
                }.padding()
            }.padding()
        }
    }
}

#Preview {
    Login()
}
