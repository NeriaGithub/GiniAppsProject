//
//  DataManager.swift
//  GiniAppsProject
//
//  Created by Neria Jerafi on 15/10/2020.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    private init(){}
    var numbers:Numbers?
    var uniqueNumbers:[Int] = []
    
    
    
    func findNumbers() {
        guard let numbersArray = numbers?.numbers else { return  }
        let sum = 0
        var dictionary: [Int: Int] = [:]
        for element in numbersArray {
            let difference = sum - element.number
            if let _ = dictionary[difference] {
                print("(\(element.number), \(difference))")
                uniqueNumbers.append(element.number)
                uniqueNumbers.append(difference)
                
            }
            dictionary[element.number] = element.number
        }
    }
}
