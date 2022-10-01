//
//  DeviceController.swift
//  SmartHome
//
//  Created by Jicell on 9/30/22.
//

import Foundation

class DeviceController {
    // Single source of truth
    static let shared = DeviceController()
    
    init() {
        
        loadDevices()
    }
    //Source Of Truth
    private (set) var devices: [Device] = []
    
    // URL Computed property
    private var devicesURL: URL? {
    guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
    let url = documentsDirectory.appendingPathComponent("devices.json")
    return url
}

// create device with name parameter.

func createDevice(name: String) {
    let newDevice = Device(text: name)
    devices.append(newDevice)
  saveDevices()
}

// ToggleIsOn method
func toggleIsOn(device: Device) {
    device.isOn.toggle()
    DeviceController.shared.saveDevices()
}
    
    func deleteDevice(device: Device) {
        guard let index = devices.firstIndex(of: device) else { return }
        devices.remove(at: index)
        saveDevices()
    }

// persistance
func saveDevices() {
    
    guard let devicesURL = devicesURL else { return }
    do {
        let data = try JSONEncoder().encode(devices)
        try data.write(to: devicesURL)
    
    } catch {
        print("Error Saving Devices", error)
    }
}

    
func loadDevices() {
    // 1. Get the address to save a file to
    guard let devicesURL = devicesURL else { return }
    do {
        // 2. Load the raw data from the url
        let data = try Data(contentsOf: devicesURL)
        // 3. Convert the raw data into our Swift class
        let devices = try JSONDecoder().decode([Device].self, from: data)
        self.devices = devices
    } catch {
        print("Error Loading Devices", error)
    }
}
}

extension Device: Equatable {
    static func == (lhs: Device, rhs: Device) -> Bool {
      return lhs.name == rhs.name && lhs.isOn == lhs.isOn
       
    }
}
