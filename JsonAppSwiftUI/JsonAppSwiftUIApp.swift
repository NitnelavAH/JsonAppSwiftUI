//
//  JsonAppSwiftUIApp.swift
//  JsonAppSwiftUI
//
//  Created by Developer on 20/07/25.
//

import SwiftUI

@main
struct JsonAppSwiftUIApp: App {
    var body: some Scene {
        let login = PostViewModel()
        WindowGroup {
            ContentView().environmentObject(login)
        }
    }
}
