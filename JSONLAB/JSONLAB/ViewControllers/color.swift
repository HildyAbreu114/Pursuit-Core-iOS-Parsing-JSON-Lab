//
//  color.swift
//  JSONLAB
//
//  Created by hildy abreu on 8/27/19.
//  Copyright © 2019 hildy abreu. All rights reserved.
//

import Foundation

struct ColorData: Codable {
    let colors:[ColorInfo]
    
    static func getColors(data: Data) throws -> [ColorInfo] {
        do {
            let colorData = try JSONDecoder().decode(ColorData.self, from: data)
            return colorData.colors
        }
        catch {
            throw error
        }
    }
    
    
}




struct ColorInfo: Codable {
    let hex: HexData
    let rgb: RgbData
    let name: NameData
    
    
}

struct HexData: Codable {
    let value: String
    let clean: String
}

struct RgbData: Codable{
    let fraction: FractionData
}

struct FractionData: Codable {
    let r: Float
    let g: Float
    let b: Float
}

struct NameData: Codable {
    let value: String
}
