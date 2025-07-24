//
//  UserViewModel.swift
//  JsonAppSwiftUI
//
//  Created by Developer on 22/07/25.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var users: [User] = []
    
    init() {
        loadUsers()
    }
    
    func loadUsers() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        

        URLSession.shared.dataTask(with: url) { data, _, error in
            print(data as Any)
            guard let data = data else {
                print("No data found")
                return
            }
            
            do {
                let response = try JSONDecoder().decode([User].self, from: data)
        
                print(response)
                DispatchQueue.main.async {
                    self.users = response
                }
            } catch let error as NSError {
                print("Error decoding: \(error)")
            }
            
        }.resume()
    }
}
