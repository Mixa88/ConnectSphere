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
        // 1. Создаем конфигурацию, чтобы данные хранились только в памяти,
        // а не в основной базе данных приложения.
        let config = ModelConfiguration(isStoredInMemoryOnly: true)

        // 2. Создаем сам контейнер для превью.
        let container = try ModelContainer(for: User.self, configurations: config)

        // 3. Создаем образец пользователя, используя наш init.
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

        // 4. ВАЖНО: Вставляем наш образец в контекст контейнера.
        // Этот шаг "оживляет" объект в мире SwiftData.
        container.mainContext.insert(exampleUser)

        // 5. Возвращаем наш View и передаем ему созданный контейнер.
        return DetailView(user: exampleUser)
            .modelContainer(container)

    } catch {
        // Если что-то пошло не так, показываем ошибку.
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
