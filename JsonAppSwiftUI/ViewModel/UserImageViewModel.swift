//
//  UserViewModel.swift
//  JsonAppSwiftUI
//
//  Created by Developer on 22/07/25.
//

import Foundation

class UserImageViewModel: ObservableObject {
    @Published var users: [UserImage] = []
    
    init() {
        loadUsers()
    }
    
    func loadUsers() {
        guard let url = URL(string: "https://reqres.in/api/users") else { return }
        var request = URLRequest(url: url)

        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("reqres-free-v1", forHTTPHeaderField: "x-api-key")

        URLSession.shared.dataTask(with: request) { data, _, error in
            print(data as Any)
            guard let data = data else {
                print("No data found")
                return
            }
            
            do {
                let response = try JSONDecoder().decode(APIResponse.self, from: data)
        
                print(response)
                DispatchQueue.main.async {
                    self.users = response.data
                }
            } catch let error as NSError {
                print("Error decoding: \(error)")
            }
            
        }.resume()
    }
}
