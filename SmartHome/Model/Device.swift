//
//  Device.swift
//  SmartHome
//
//  Created by Jicell on 9/30/22.
//

import Foundation

class Device: Codable {
    //MARK: - Properties
    
    //name of the device
    let name: String
    //isOn boolean that indicates the currently state
    var isOn: Bool
    
    // MARK: - Parameters
    init(text: String, isOn: Bool = false) {
        self.name = text
        self.isOn = isOn
    }
}
