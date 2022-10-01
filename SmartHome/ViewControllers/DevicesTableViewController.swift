//
//  DevicesTableViewController.swift
//  SmartHome
//
//  Created by Jicell on 9/30/22.
//

import UIKit

class DevicesTableViewController: UITableViewController {

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(DeviceController.shared.devices.count)
        return DeviceController.shared.devices.count
    }
// This func will update the view every time your cell is updated.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //This guard protects the cell from returning nil or with no value
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "deviceCell", for: indexPath) as? DeviceTableViewCell else {return UITableViewCell()}
        
     
        //This the initialization of device
        let device = DeviceController.shared.devices[indexPath.row]
        print(DeviceController.shared.devices[indexPath.row])
        cell.updataViews(device: device)
        cell.delegate = self
        return cell
    }
    
    //This func will delete the cells
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        print( DeviceController.shared.devices[indexPath.row])
            guard editingStyle == .delete else { return }
        let deleteDevice = DeviceController.shared.devices[indexPath.row]
        
    DeviceController.shared.deleteDevice(device: deleteDevice)
        self.tableView.reloadData()
        //deleteRows(at: [indexPath], with: .automatic)
      
        
        }
        
    
    
    
    
    // Create a new device alert controller
    private func presentNewDeviceAlertController() {
        let alertController = UIAlertController(title: "New Device", message: "Enter the name of your device below", preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "New Device Name"
        }
        let dismissAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(dismissAction)
        let confirmAction = UIAlertAction(title: "Create", style: .default) { _ in
            guard let contentTextField = alertController.textFields?.first,
                    let name = contentTextField.text  else { return }
            DeviceController.shared.createDevice(name: name)
            self.tableView.reloadData()
        }
        alertController.addAction(confirmAction)
        present(alertController, animated: true)
    }


    @IBAction func addButtonTapped(_ sender: Any) {
        presentNewDeviceAlertController()
    }
    
}

// MARK: -extension

extension DevicesTableViewController: DeviceTableViewCellDelegate {
    
    func isOnSwitchToggled(_ cell: DeviceTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        let device = DeviceController.shared.devices[indexPath.row]
        DeviceController.shared.toggleIsOn(device: device)
        cell.updataViews(device: device)
    }
}

