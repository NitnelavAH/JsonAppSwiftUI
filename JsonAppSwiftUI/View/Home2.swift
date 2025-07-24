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
                    HStack {
                        Image(systemName: "person.fill")
                            .data(url: URL(string: item.avatar)!)
                            .frame(width: 80, height: 80)
                            .clipped()
                            .clipShape(Circle())
                        VStack(alignment: .leading) {
                            Text(item.first_name)
                            Text(item.email)
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

extension Image {
    func data(url: URL) -> Self {
        if let data = try? Data(contentsOf: url) {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        }
        return self.resizable()
    }
}

#Preview {
    Home()
}
