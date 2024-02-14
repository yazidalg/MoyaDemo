//
//  DefaultResponse.swift
//  MoyaDemo
//
//  Created by Yazid Al Ghozali on 14/02/24.
//

import Foundation

struct AllDataResponse<T: Codable>: Codable {
    var data: [T]?
}

struct DetailDataResponse<T: Codable>: Codable {
    var data: T?
}
