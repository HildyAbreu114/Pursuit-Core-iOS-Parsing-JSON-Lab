//
//  randomUser.swift
//  JSONLAB
//
//  Created by hildy abreu on 8/27/19.
//  Copyright © 2019 hildy abreu. All rights reserved.
//
import Foundation

struct RandomUserData: Codable {
    let results: [PeopleInfo]
    
    static func getRandomUsers(data: Data) throws -> [PeopleInfo] {
        do {
            let randomUserData = try JSONDecoder().decode(RandomUserData.self, from: data)
            return randomUserData.results
        }
        catch {
           throw error
        }
    }
    
    
    
    
}

struct PeopleInfo: Codable {
    let name: NameInfo
    let location: LocationInfo
    let email: String
}

struct NameInfo: Codable {
    let title: String
    let first: String
    let last: String
}

struct LocationInfo: Codable{
    let street: String
    let city: String
    let state: String
}
