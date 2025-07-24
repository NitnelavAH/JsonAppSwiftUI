//
//  Home.swift
//  JsonAppSwiftUI
//
//  Created by Developer on 20/07/25.
//

import SwiftUI

struct Home2: View {
    
    @EnvironmentObject var login: PostViewModel
    @StateObject var json = UserImageViewModel()
    
    var body: some View {
        NavigationView {
            if(json.users.isEmpty) {
                ProgressView()
            } else {
                List(json.users, id: \.id) { item in
                    NavigationLink(destination: Detail(id: item.id)) {
                        HStack {
                            AsyncImage(url: URL(string: item.avatar)) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 80, height: 80)
                            .clipped()
                            .clipShape(Circle())

                            VStack(alignment: .leading) {
                                Text(item.first_name)
                                Text(item.email)
                            }
                        }
                    }
                }.navigationTitle("JSON con imagen")
                    .navigationBarItems(
                        leading: Button("Salir") {
                            UserDefaults.standard.removeObject(forKey: "sesion")
                            login.authenticated = 0
                        }
                    )
            }
                
        }
    }
}


#Preview {
    Home()
}
