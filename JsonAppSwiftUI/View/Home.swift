//
//  Home.swift
//  JsonAppSwiftUI
//
//  Created by Developer on 20/07/25.
//

import SwiftUI

struct Home: View {
    
    @EnvironmentObject var login: PostViewModel
    @StateObject var json = UserViewModel()
    
    var body: some View {
        NavigationView {
            if(json.users.isEmpty) {
                ProgressView()
            } else {
                List(json.users, id: \.id) { item in
                    VStack(alignment: .leading) {
                        Text(item.name)
                        Text(item.email)
                        Text(item.address.zipcode)
                    }
                }.navigationTitle("JSON")
                    .navigationBarItems(
                        leading: Button("Salir") {
                            UserDefaults.standard.removeObject(forKey: "sesion")
                            login.authenticated = 0
                        },
                        trailing: NavigationLink(destination: Home2()) {
                            Text("Siguiente")
                        }
                    )
            }
                
        }
    }
}

#Preview {
    Home()
}
