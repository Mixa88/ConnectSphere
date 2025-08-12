//
//  DetailView.swift
//  ConnectSphere
//
//  Created by Михайло Тихонов on 12.08.2025.
//

import SwiftUI

struct DetailView: View {
    
    let user: User
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading) {
                Text(user.name)
                    .font(.largeTitle.bold())
                Text(user.company)
                    .font(.headline)
                    .foregroundColor(.secondary)
                Text("Age: \(user.age)")
                
            }
            .padding(.bottom)
            
            VStack(alignment: .leading) {
                Text("About myself")
                    .font(.title2.bold())
                Text(user.about)
                    .padding(.top, 4)
                
            }
            
            VStack(alignment: .leading) {
                Text("Contacts")
                    .font(.title2.bold())
                Text("Email: \(user.email)")
                Text("Address: \(user.address)")
            }
            
            VStack(alignment: .leading) {
                Text("Friends")
                     .font(.title2.bold())
                                
                                
                ForEach(user.friends) { friend in
                Text(friend.name)
                   .padding(.vertical, 2)
                }
            }
        }
        .navigationTitle(user.name)
        .navigationBarTitleDisplayMode(.inline)
        .padding()
    }
    
}

#Preview {
        NavigationStack {
                DetailView(user: .example)
            }
    
}
