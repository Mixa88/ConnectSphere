//
//  DetailView.swift
//  ConnectSphere
//
//  Created by Михайло Тихонов on 12.08.2025.
//

import SwiftUI
import SwiftData

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
    do {
    
        let config = ModelConfiguration(isStoredInMemoryOnly: true)

        
        let container = try ModelContainer(for: User.self, configurations: config)

        
        let exampleUser = User(
            id: UUID(),
            isActive: true,
            name: "Taylor Swift",
            age: 26,
            company: "Big Machine",
            email: "taylor.swift@example.com",
            address: "555, Taylor Swift Avenue, Nashville, TN 37203",
            about: "A sample user for SwiftUI preview.",
            registered: Date(),
            tags: ["pop", "country"],
            friends: [] // Для превью можно обойтись без друзей
        )

        
        container.mainContext.insert(exampleUser)

        
        return DetailView(user: exampleUser)
            .modelContainer(container)

    } catch {
        
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
