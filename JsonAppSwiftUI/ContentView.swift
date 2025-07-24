//
//  ContentView.swift
//  JsonAppSwiftUI
//
//  Created by Developer on 20/07/25.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var login: PostViewModel
    var body: some View {
        Group {
            if login.authenticated == 0 {
                Login()
            } else if login.authenticated == 1 {
                Home()
            } else if login.authenticated == 2 {
                VStack{
                    Text("User wrong")
                    
                    Button("Regresar") {
                        login.authenticated = 0
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
