//
//  ContentView.swift
//  ConnectSphere
//
//  Created by Михайло Тихонов on 11.08.2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var users = [User]()
    
    var body: some View {
        NavigationStack {
            List(users) { user in
                Text(user.name)
            }
            .navigationTitle("ConnectSphere")
            .task {
                if users.isEmpty {
                    await fetchData()
                }
            }
        }
    }
    
    func fetchData() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else { print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            let decodedUsers = try decoder.decode([User].self, from: data)
            users = decodedUsers
        } catch {
            print("Error fetching or decoding data: \(error.localizedDescription)")
        }
    }
}

#Preview {
    ContentView()
}
