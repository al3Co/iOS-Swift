//
//  dataSaved.swift
//  speakBoard
//
//  Created by Aldo Contreras on 4/19/17.
//  Copyright © 2017 Aldo Contreras. All rights reserved.
//
import Foundation
import UIKit


class usersData: NSObject {
    static func saveData(Data: Int, key: String){
        // saving Data on key
        UserDefaults.standard.set(Data , forKey: key)
        UserDefaults.standard.synchronize()
        print("Data: \(Data) saved in the key: \(key)")
    }
    
    static func reviewData(key: String) -> Int {
        //  para consultar el dato:
        let savedKeyData:Int = UserDefaults.standard.integer(forKey: key)
        print("Data: \(savedKeyData) from the key: \(key)")
        return savedKeyData
    }
}
