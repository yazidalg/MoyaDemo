//
//  UserTargetType.swift
//  MoyaDemo
//
//  Created by Yazid Al Ghozali on 14/02/24.
//

import Foundation
import Moya

enum UserTargetType {
    case getAllUser
    case getDetailUser(Int)
}

extension UserTargetType: DefaultTargetType {
    var parameters: [String : Any] {
        switch self {
        case .getAllUser:
            return [:]
        case .getDetailUser:
            return [:]
        }
    }
    
    var path: String {
        switch self {
        case .getAllUser:
            "/users"
        case .getDetailUser(let id):
            "/users/\(id)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getAllUser:
            return .get
        case .getDetailUser:
            return .get
        }
    }
    
    var parameterEncoding: Moya.ParameterEncoding {
        switch self {
        case .getAllUser:
            return URLEncoding.default
        case .getDetailUser:
            return URLEncoding.default
        }
    }
    
    var task: Task {
        return .requestParameters(parameters: parameters, encoding: parameterEncoding)
    }
}
