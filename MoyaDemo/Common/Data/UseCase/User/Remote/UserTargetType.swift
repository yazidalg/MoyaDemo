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
    case postUser(String, String)
}

extension UserTargetType: DefaultTargetType {
    var parameters: [String : Any] {
        switch self {
        case .getAllUser:
            return [:]
        case .getDetailUser:
            return [:]
        case .postUser:
            return [:]
        }
    }
    
    var path: String {
        switch self {
        case .getAllUser:
            "/users"
        case .getDetailUser(let id):
            "/users/\(id)"
        case .postUser(_, _):
            "/users"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getAllUser:
            return .get
        case .getDetailUser:
            return .get
        case .postUser:
            return .post
        }
    }
    
    var parameterEncoding: Moya.ParameterEncoding {
        switch self {
        case .getAllUser:
            return URLEncoding.default
        case .getDetailUser:
            return URLEncoding.default
        case .postUser:
            return JSONEncoding.default
        }
    }
    
    var task: Task {
        switch self {
        case .getAllUser:
            return .requestParameters(parameters: parameters, encoding: parameterEncoding)
        case .getDetailUser(let id):
            return .requestParameters(parameters: parameters, encoding: parameterEncoding)
        case .postUser(let name, let job):
            return .requestParameters(parameters: ["name": name, "job": job], encoding: JSONEncoding.default)
        }
    }
}
