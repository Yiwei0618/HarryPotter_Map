//
//  SearchTable.swift
//  Project!
//
//  Created by Ellie Wu on 5/3/24.
//

import UIKit

class SearchTable: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let segueID = "location_search"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        filteredLocations = allLocations
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }

    var allLocations = ["The Shambles", "King's Cross", "Seven Sisters Country Park","New College","Ashridge Wood","Piccadilly Circus","Glenfinnan Viaduct","Loch Etive","Durham Cathedral","The Elephant House"]
    var filteredLocations: [String] = []


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return filteredLocations.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = filteredLocations[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        self.performSegue(withIdentifier: "location_search", sender: self)
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return indexPath
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("ENTERING THE SEGUE")
        if segue.identifier == segueID {
            print("1234567890")
            
            let destination = segue.destination as? PopoverPage
            
            print("HERE1")
            
            let indexPath = tableView.indexPathForSelectedRow!
                
                print("HERE2")
                
            let selectedLocation = tableView.cellForRow(at: indexPath)
            //////////////////////////////////////////////////////
            print("HERE3")
            print(selectedLocation?.textLabel?.text ?? "ERROR GETTING DATA1")
            //////////////////////////////////////////////////////
            
            let temp = place(for: selectedLocation?.textLabel?.text ?? "ERROR GETTING DATA1")

            destination?.text = temp?.movieView ?? "ERROR GETTING DATA2"
            destination?.shot = temp?.shotView ?? "ERROR GETTING DATA3"
            destination?.fact = temp?.factView ?? "ERROR GETTING DATA4"
            destination?.image = UIImage(named: temp?.imageName ?? "ERROR GETTING DATA5") ?? UIImage()
            destination?.name = temp?.title ?? "ERROR GETTING DATA6"
            destination?.place = temp
            
        }
    }
    
    func place(for locationName: String) -> Place? {
        return data.first { $0.title == locationName }

    }
}




extension SearchTable: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        // Retrieve the search text
        guard let searchText = searchController.searchBar.text, !searchText.isEmpty else {
            filteredLocations = allLocations // Show all locations if the search is empty
            tableView.reloadData()
            return
        }

        // Filter the placeholder data
        filteredLocations = allLocations.filter { location in
            location.lowercased().contains(searchText.lowercased())
        }

        // Reload the table view with the filtered results
        tableView.reloadData()
    }
}

