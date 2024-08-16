//
//  SavedList.swift
//  Project!
//
//  Created by Ellie Wu on 3/24/24.
//

import UIKit


class SavedList: UIViewController,UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    let textCellIdentifier = "TextCell"
    let segueID = "LocationSegueIdentifier"
        
        //Segue! Segue between table and detailed page
        
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
        override func viewDidLoad() {
            super.viewDidLoad()
            tableView.delegate = self
            tableView.dataSource = self
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return favListArray.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let location = favListArray[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
            cell.label.text = location.title
            cell.iconImageView.image = UIImage(named: location.imageName)
            return cell
        }
        
        func tableView(_ tableView:UITableView, heightForRowAt indexPath: IndexPath) ->
        CGFloat{
            return 140
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            self.tableView.deselectRow(at: indexPath, animated: true)
           // performSegue(withIdentifier: segueID, sender: self)

        }
      
        func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
            return indexPath
        }
        
     
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == segueID {
                if let destination = segue.destination as? DetailPage,
                   let indexPath = tableView.indexPathForSelectedRow {
                    let selectedLocation = favListArray[indexPath.row]
                    
                    print("Preparing for segue with location: \(selectedLocation.title)")

                    destination.image = UIImage(named: selectedLocation.imageName) ?? UIImage()
                    destination.name = selectedLocation.title
                    destination.text = selectedLocation.movieView
                    destination.shot = selectedLocation.shotView
                    destination.fact = selectedLocation.factView
                    
                    
                    
                    
                }
            }
        }
        
    }

