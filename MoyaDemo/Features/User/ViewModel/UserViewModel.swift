//
//  UserViewModel.swift
//  MoyaDemo
//
//  Created by Ahmad Fadli Akbar on 2/29/24.
//

import Foundation

class UserViewModel: ObservableObject {
    private let userRepository: UserRepository
    
    @Published var nameField: String = ""
    @Published var jobField: String = ""
    @Published var user: User?
    
    init(userRepository: UserRepository = DefaultUserRepository()) {
        self.userRepository = userRepository
    }
    
    @MainActor
    func postUser() async {
        do {
            let data = try await userRepository.postUser(name: nameField, job: jobField)
            self.user = data.data ?? User()
        } catch {
            print(error.localizedDescription)
        }

    }
}
