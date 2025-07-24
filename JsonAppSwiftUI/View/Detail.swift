//
//  UserDetail.swift
//  JsonAppSwiftUI
//
//  Created by Developer on 23/07/25.
//

import SwiftUI

struct Detail: View {
    var id: Int
    
    @StateObject var user = UserDetailViewModel()
    var body: some View {
        VStack {
            if(user.user == nil) {
                ProgressView()
            } else {
                AsyncImage(url: URL(string: user.user!.avatar)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 180, height: 180)
                .clipped()
                .clipShape(Circle())
                
                Text(user.user!.firstName)
                Text(user.user!.email)
            }
        }.onAppear {
            user.loadUserDetail(id: id)
        }
    }
}
