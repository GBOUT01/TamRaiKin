//
//  FoodData.swift
//  Test
//
//  Created by admin on 22/6/2567 BE.
//

import Foundation

struct FoodData {
    static var list: [String: [String]] = [
        "friedcrabinyellowcurry": ["ปู", "ผัก", "พริก", "ไข่"],
        "crispyporkwithchinesebroccoli": ["หมู", "ผัก", "น้ำมัน"],
        "spicymincedpork": ["หมู", "ผัก", "พริก", "มะนาว", "น้ำปลา"],
        "friedchicken": ["ไก่", "น้ำมัน"],
        "friedshimp": ["กุ้ง", "เกลือ", "พริกไทย"],
    ]
    
    static var images: [String: String] = [
        "ปู": "crab",
        "ผัก": "vegateble",
        "พริก": "chili",
        "ไข่": "egg",
        "หมู": "pork",
        "น้ำมัน": "oil",
        "มะนาว": "lemon",
        "น้ำปลา": "fishsauce",
        "ไก่": "chicken",
        "กุ้ง": "shrimp",
        "เกลือ": "salt",
        "พริกไทย": "pepper",
    ]
    
    static func randomFood() -> [String: [String]] {
        let key: String = list.keys.randomElement() ?? ""
        let data: [String] = list[key] ?? [""]
        return [key: data]
    }
}
