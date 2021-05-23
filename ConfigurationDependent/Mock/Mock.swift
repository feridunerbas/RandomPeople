//
//  Mock.swift
//  Random People
//
//  Created by Feridun Erbas on 23.05.2021.
//

import Foundation

struct Mock: Decodable {
    var status: Int32?
    var method: String?
    var headers: [String: String]?
    var urlPath: String
}
