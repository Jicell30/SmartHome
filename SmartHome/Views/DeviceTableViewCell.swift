//
//  DeviceTableViewCell.swift
//  SmartHome
//
//  Created by Jicell on 9/30/22.
//

import UIKit

class DeviceTableViewCell: UITableViewCell {
    
    // MARK: -Outlet (Label for the name of the device)
    
    @IBOutlet weak var deviceNameLabel: UILabel!
    // MARK: -Outlet (A switch that displays and changes isOn property of the device)
    
    @IBOutlet weak var deviceIsOnSwitch: UISwitch!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    // MARK: - IBAction
    
    @IBAction func deviceIsOnSwitchValueChanged(_ sender: UISwitch) {
    }
    

}
