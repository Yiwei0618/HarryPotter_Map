//
//  PopoverTableViewController.swift
//  Project!
//
//  Created by Ellie Wu on 4/19/24.
//

import UIKit

class PopoverTableViewController: UITableViewController {
    var locationDetails: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Use the locationDetails here to update the UI, if needed
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locationDetails != nil ? 1 : 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = locationDetails  // Display the location details
        return cell
    }
}
