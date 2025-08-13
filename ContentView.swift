//
//  ContentView.swift
//  ConnectSphere
//
//  Created by Михайло Тихонов on 11.08.2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @Query(sort: \User.name) var users: [User]
    
    var body: some View {
        NavigationStack {
            List(users) { user in
                
                NavigationLink {
                    
                    DetailView(user: user)
                } label: {
                    
                    HStack {
                        Circle()
                            .fill(user.isActive ? .green : .gray)
                            .frame(width: 10, height: 10)
                        
                        Text(user.name)
                    }
                }
            }
            .navigationTitle("ConnectSphere")
            .task {
                if users.isEmpty {
                    await loadData()
                }
            }
        }
    }
    
    func loadData() async {
        guard users.isEmpty else { return }
        
        do {
            let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
            let (data, _) = try await URLSession.shared.data(from: url)

            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            let decodedUsers = try decoder.decode([User].self, from: data)
            
            
            for users in decodedUsers {
                modelContext.insert(users)
            }
        } catch {
            print("Failed to load data: \(error.localizedDescription)")
        }
        
    }
    
    
}

#Preview {
    ContentView()
}
