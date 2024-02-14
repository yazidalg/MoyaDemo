//
//  Repository.swift
//  MoyaDemo
//
//  Created by Yazid Al Ghozali on 14/02/24.
//

import Foundation
import Moya

// Repository: tempat menyimpan semua yang berkaitan dengan pemanggilan data local maupun remote
protocol UserRepository {
    func getAllUser() async throws -> AllDataResponse<User>
    func getDetailUser(by id: Int) async throws -> DetailDataResponse<User>
}

final class DefaultUserRepository: UserRepository {
    private let provider: MoyaProvider<UserTargetType>
    
    init(provider: MoyaProvider<UserTargetType> = .defaultProvider()) {
        self.provider = provider
    }
    
    func getAllUser() async throws -> AllDataResponse<User> {
        try await provider.asyncRequest(.getAllUser, model: AllDataResponse<User>.self)
    }
    
    func getDetailUser(by id: Int) async throws -> DetailDataResponse<User> {
        try await provider.asyncRequest(.getDetailUser(id), model: DetailDataResponse<User>.self)
    }
}
