//
//  MoyaProvider+defaultProvider.swift
//  MoyaDemo
//
//  Created by Yazid Al Ghozali on 14/02/24.
//

import Foundation
import Moya

extension MoyaProvider {
    static func defaultProvider() -> MoyaProvider {
        return MoyaProvider(plugins: [NetworkLoggerPlugin()])
    }
}
