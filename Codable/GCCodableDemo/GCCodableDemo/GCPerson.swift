//
//  GCPerson.swift
//  SwiftDemo
//
//  Created by GarveyCalvin on 2023/4/9.
//

import Foundation

struct GCPerson: Codable {
    var name: String
    var age: Int
    var height: Float // cm
    var isGoodGrades: Bool
}

struct Address: Codable {
    var zipCode: Int
    var fullAddress: String
    
    enum CodingKeys: String, CodingKey {
        case zipCode = "zip_code"
        case fullAddress = "full_address"
    }
}

struct Activity: Codable {
    var time: Date?
    var url: URL?
}

struct Dog: Codable {
    var name: String
    var sex: Bool // 0/false女 1/true男
    
    init(name: String, sex: Bool) {
        self.name = name
        self.sex = sex
    }
    
    // 必须实现此枚举，在编码解码方法中需要用到
    enum CodingKeys: CodingKey {
        case name
        case sex
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        // 取出来int后再转换为Bool
        let sexInt = try container.decode(Int.self, forKey: .sex)
        sex = sexInt == 1
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.name, forKey: .name)
        // 将sex属性以int类型编码
        try container.encode(sex ? 1 : 0, forKey: .sex)
    }
}
