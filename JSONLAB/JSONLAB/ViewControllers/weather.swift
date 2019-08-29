//
//  weather.swift
//  JSONLAB
//
//  Created by hildy abreu on 8/27/19.
//  Copyright © 2019 hildy abreu. All rights reserved.
//

import Foundation
enum JSONError: Error {
    case decodingError(Error)
}

struct Weather: Codable {
    let name: String
    let temp: Int
   

static func getWeather(from data: Data) throws -> [Weather] {
    do {
        let weather = try JSONDecoder().decode([Weather].self, from: data)
        return weather
    } catch {
        throw JSONError.decodingError(error)
    }
}
}

struct ImageWrapper: Codable {
    let medium: String
    let original: String
}
