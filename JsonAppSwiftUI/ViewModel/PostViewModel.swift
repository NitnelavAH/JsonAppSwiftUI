//
//  PostViewModel.swift
//  JsonAppSwiftUI
//
//  Created by Developer on 20/07/25.
//

import Foundation

class PostViewModel: ObservableObject {
    @Published var authenticated = 0;
    
    init() {
        if let sesion = UserDefaults.standard.string(forKey: "sesion") {
            authenticated = Int(sesion) ?? 0
        } else {
            authenticated = 0
        }
    }
    
    
    func login(email: String, password: String) {
        guard let url = URL(string: "https://reqres.in/api/login") else { return }
        let parametros: [String: String] = ["email": email, "password": password]
        let body = try! JSONSerialization.data(withJSONObject: parametros)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = body
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("reqres-free-v1", forHTTPHeaderField: "x-api-key")
        
        URLSession.shared.dataTask(with: request) {data, response, error in
            if let response = response {
                print(response)
            }
            
            guard let data = data else { return }
            
            do {
                let datos = try JSONDecoder().decode(PostModel.self, from: data)
                print(datos)
                
                if !datos.token.isEmpty {
                    DispatchQueue.main.async {
                        self.authenticated = 1
                        UserDefaults.standard.setValue(1, forKey: "sesion")
                    }
                }
            } catch let error as NSError {
                print("Error on post", error.localizedDescription)
                DispatchQueue.main.async {
                        self.authenticated = 2
                }
            }
            
            if let error = error {
                print(error)
            }
        }.resume()
    }
}
