//
//  File.swift
//  Swift期末專案
//
//  Created by 阿黃 on 2021/6/21.
//

import Foundation

struct motorBike : Decodable{
    let id: String
    let location: Double
    let battery: Int
    let rate: String
    let rented: Bool
    let date: String?
    let time: String?
    let timestamp: Int?
}

struct accountRecord : Decodable {
    let id: String
    let date: String?
    let time: String
    let cost: Int
}
