//
//  DeviceTableViewCell.swift
//  SmartHome
//
//  Created by Jicell on 9/30/22.
//

import UIKit

    protocol DeviceTableViewCellDelegate: AnyObject {
        
        func isOnSwitchToggled(_ cell: DeviceTableViewCell)
    }
    
    class DeviceTableViewCell: UITableViewCell {
        
    // MARK: -Outlet (Label for the name of the device)
    @IBOutlet weak var deviceNameLabel: UILabel!
    // MARK: -Outlet (A switch that displays and changes isOn property of the device)
    @IBOutlet weak var deviceIsOnSwitch: UISwitch!
    
// Table view cell that reports when the mark as rea button id tapped.
        weak var delegate: DeviceTableViewCellDelegate?

        //Parameter
        func updataViews(device: Device) {
            deviceNameLabel.text = device.name
            deviceNameLabel.textColor = .systemPink
            deviceIsOnSwitch.isOn = device.isOn
        }
    // MARK: - IBAction
    
    @IBAction func deviceIsOnSwitchValueChanged(_ sender: UISwitch) {
        delegate?.isOnSwitchToggled(self)
    }
    

} //END OF CLASS.
