//
//  Numbers.swift
//  GiniAppsProject
//
//  Created by Neria Jerafi on 15/10/2020.
//

import Foundation

struct Numbers:Decodable {
    let numbers:[Number]
}
struct Number:Decodable {
    let number:Int
}
