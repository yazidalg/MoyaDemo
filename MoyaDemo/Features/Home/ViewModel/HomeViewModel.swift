//
//  HomeViewModel.swift
//  MoyaDemo
//
//  Created by Yazid Al Ghozali on 14/02/24.
//

import Foundation

final class HomeViewModel: ObservableObject {
    private let userRepository: UserRepository
    
    @Published var userList: [User] = []
    @Published var searchField = ""
    @Published var showSheet = false
    
    var searchItem: [User] {
        if searchField.isEmpty {
            return userList.compactMap({ $0 })
        } else {
            return userList.filter { item in
                (item.firstName ?? "").contains(searchField) ||
                (item.lastName ?? "").contains(searchField)
            }
        }
    }
    
    init(userRepository: UserRepository = DefaultUserRepository()) {
        self.userRepository = userRepository
    }
    
    @MainActor
    func getAllUser() async {
        do {
            let data = try await userRepository.getAllUser()
            self.userList = data.data ?? []
        } catch {
            print(error.localizedDescription)
        }
    }
}
