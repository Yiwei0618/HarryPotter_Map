//
//  LocationSearchTable.swift
//  Project!
//
//  Created by Ellie Wu on 4/6/24.
//

import UIKit
import MapKit

//define a protocol
//protocol LocationSearchTableDelegate: AnyObject {
//    func locationSelected(_ place: Place)
//}

class LocationSearchTable: UITableViewController  {
//    weak var delegate: LocationSearchTableDelegate?//delegate method
    
    
    let textCellIdentifier = "cell"
    let segueID = "location_search"
   
    var allLocations = ["The Shambles", "King's Cross", "Seven Sisters Country Park","New College","Ashridge Wood","Piccadilly Circus","Glenfinnan Viaduct","Loch Etive","Durham Cathedral","The Elephant House"]
    var filteredLocations: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Initially display all locations
        filteredLocations = allLocations
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Use the filteredLocations array to determine the number of rows
        return filteredLocations.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue a cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        // Configure the cell with data from the filteredLocations array
        cell.textLabel?.text = filteredLocations[indexPath.row]
        return cell
    }
    
    // select row and get the data
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedPlace = filteredLocations[indexPath.row]
        if let place = data.first(where: { $0.title == selectedPlace }) {
//            delegate?.locationSelected(place)
        }
        dismiss(animated: true, completion: nil)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == segueID {
//            if let destination = segue.destination as? PopoverPage,
//               let indexPath = tableView.indexPathForSelectedRow {
//                
////                let selectedLocation = tableView.cellForRow(at: indexPath)
////                let temp = place(for: selectedLocation?.textLabel?.text ?? "ERROR GETTING DATA1")
////               
////                destination.text = temp?.movieView ?? "ERROR GETTING DATA2"
////                destination.shot = temp?.shotView ?? "ERROR GETTING DATA3"
////                destination.fact = temp?.factView ?? "ERROR GETTING DATA4"
////                destination.image = UIImage(named: temp?.imageName ?? "ERROR GETTING DATA5") ?? UIImage()
////                destination.name = temp?.title ?? "ERROR GETTING DATA6"
////                destination.place = temp
//            }
//        }
//    }
    
//    func place(for locationName: String) -> Place? {
//        return data.first { $0.title == locationName }
//        
//    }
}

//    override func tableView(for segue: UIStoryboardSegue, sender: Any?) {
//    if segue.identifier == location_search {
//        if let destination = segue.destination as? PopoverPage,
//           let indexPath = tableView.indexPathForSelectedRow {
//            let selectedLocation = favListArray[indexPath.row]
//            
//            print("Preparing for segue with location: \(selectedLocation.title)")
//
//            destination.image = UIImage(named: selectedLocation.imageName) ?? UIImage()
//            destination.name = selectedLocation.title
//            destination.text = selectedLocation.movieView
//            destination.shot = selectedLocation.shotView
//            destination.fact = selectedLocation.factView
//            
//            
//            
//            
//        }
//    }
//}




extension LocationSearchTable: UISearchResultsUpdating {
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
