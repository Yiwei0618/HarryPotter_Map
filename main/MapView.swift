//
//  MapView.swift
//  Project!
//
//  Created by Ellie Wu on 3/24/24.
//

import UIKit
import MapKit
import CoreLocation


struct Place {
    let title: String
    let imageName: String
    let movieView: String
    let shotView: String
    let factView: String
    
}

var favListArray:[Place] = []

let data: [Place] = [
    Place(title: "King's Cross Station", imageName: "King's Cross",movieView: "Movie : The station can bee seen in all movies (to be confirmed)", shotView: "Shot : King’s Cross is the station where students board the Hogwarts Express on Platform 9 ¾.", factView: "Fun fact: For filming, platforms 4 and 5 were renumbered 9 and 10 and this is where you'll find the hidden access to platform 9 3/4"

            
            
            ),
    Place(title: "Glenfinnan Viaduct", imageName: "Glenfinnan Viaduct",movieView: "Movie: The Chamber of Secrets, The Prisoner of Azkaban, and The Goblet of Fire.", shotView: "Shots: The Glenfinnan viaduct is part of the Hogworts Express train route.", factView:"Fun Fact: The bridge is 380 metres long and 31 metre high. The construction of the bridge was finished in 1898 and cost £18.904."),
    
    Place(title: "The Shambles", imageName: "The Shambles",movieView: "Movie: This street can bee seen in all movies (to be confirmed)", shotView:"Shot: The Shambles is believed to have been the inspiration behind Diagon Alley", factView: "Fun Fact: ???"),

    
    Place(title: "Seven Sisters Country Park", imageName: "Seven Sisters",movieView: "Movie: Harry Potter and The Goblet of Fire", shotView:"Shot: As soon as they pick the boot in the Goblet of Fire everyone gets transported here.", factView: "Fun Fact: The Seven Sisters are entirely made of chalk situated by the English Channel. In movies they are often used as stand-in for the White Cliffs of Dover since they are relatively free of modern architecture."),
    
    Place(title: "New College", imageName: "New College",movieView: "Movie: Harry Potter and the Goblet of Fire", shotView:"Shot: Where everyone sports the 'Potter stinks' badges during the triwizard tournament.", factView: "Fun Fact: Every year during the Easter holidays a 3 day murder mystery event is hosted at the Cloisters. During the 3 day period the attendees can attend academic activities, forensic science workshops and a formal dinner."),
    
    
    
    Place(title: "Ashridge Wood", imageName: "Ashridge Wood",movieView: "Movie: Harry Potter and the Goblet of Fire", shotView:"Shot: The Woods where the Quidditch world cup is held.", factView: "Fun Fact: Ashridge Wood is famous for its range of flowering plants and trees, making the woods a pleasant location for walks."),
    
    Place(title: "Piccadilly Circus", imageName: "Piccadilly Circus",movieView: "Movie: Deathly Hallows pt.1", shotView:"Shot: Exterior shots where we see Harry, Hermione and Ron rushing through London’s West End.", factView: "Fun Fact: The statue erected in the center of Piccadilly Circus is named the Shaftesbury Memorial Fountain (to honour the philanthropist Lord Shaftesbury) but many call it the Statue of Eros (the Greek god of love). Its creator Alfred Gilbert actually sculpted the statue as an image of Eros’ twin brother Anteros."),
    Place(title: "Loch Etive", imageName: "Loch Etive",movieView: "Movie: The Deathly Hallows Part 1", shotView:"Shot: This loch has been used as a setting in Harry's, Hermione's and Ron's camping tour. The scene was filmed at the northern part of the lake.", factView: "Fun Fact: Loch Etive is a 30 km sea loch in Argyll and Bute, Scotland. The name Etive is believed to mean little ugly one from the Gaelic Goddess associated with the loch"),
    Place(title: "Loch Eilt", imageName: "Loch Eilt",movieView: "Movie: The Chamber of Secrets, The prisoner of Azkaban, The Goblet of Fire, The Deathly Hallows Part 2", shotView:"Shot: Loch Eilt has been used for Exterior Shots of the Hogwarts grounds and also shows the island of Dumbledore's grave.", factView: "Fun Fact: The lake is 5km long and 750 metres wide"),
    
    Place(title: "Durham Cathedral", imageName: "Durham Cathedral",movieView: "Movie: The Philosopher's Stone, The Chamber of Secrets and The Prisoner of Azkaban.", shotView:"Shots: Durham Cathedral has been used to shoot various exterior and interior shots of Hogwarts.", factView: "Fun Fact: The cathedral was founded in 1093 and is  home of the Shrine of St Cuthbert. Durham Cathedral has been proclaimed a World Heritage Site in 1986."),
    Place(title: "The Elephant House", imageName: "The Elephant House",movieView: "Movie: N/A", shotView:"N/A", factView: "Fun Fact: the “birthplace” of the series of Harry Potter novels!Author J.K. Rowling ,had her first book published while she was writing in the back room overlooking Edinburgh Castle."),


    
    
    
]




class MapView: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate, UIPopoverPresentationControllerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        fetchLocationsOnMap(locations)
        
       let centerOfUK = CLLocationCoordinate2D(latitude: 54.3134, longitude: -2.2304)
        
       let span = MKCoordinateSpan(latitudeDelta: 8.0, longitudeDelta: 8.0)
        
       let ukRegion = MKCoordinateRegion(center: centerOfUK, span: span)
        
       mapView.setRegion(ukRegion, animated: true)
        
        let locationSearchTable = storyboard!.instantiateViewController(withIdentifier: "SearchTable") as! SearchTable
//        locationSearchTable.delegate = self //add delegate!!!
        resultSearchController = UISearchController(searchResultsController: locationSearchTable)
        resultSearchController?.searchResultsUpdater = locationSearchTable
        
        
        let searchBar = resultSearchController!.searchBar
        searchBar.sizeToFit()
        searchBar.placeholder = "Search for places"
        navigationItem.titleView = resultSearchController?.searchBar
        
        resultSearchController?.hidesNavigationBarDuringPresentation = false
        resultSearchController?.obscuresBackgroundDuringPresentation = true
        definesPresentationContext = true
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    struct Location {
        var name: String
        var lattitude: CLLocationDegrees
        var longtitude: CLLocationDegrees
    }
    
    
    let locations =
    [Location(name: "King's Cross", lattitude: 51.531723507713465, longtitude: -0.12355488757843247),
    Location(name: "The Shambles", lattitude: 53.95944052127716, longtitude: -1.0800600316222835),
    Location(name: "Seven Sisters Country Park", lattitude: 50.76627155924246, longtitude: 0.1616194836598667),
     Location(name: "New College", lattitude: 51.82096647379198, longtitude: -1.2251252141367057),
     Location(name: "Ashridge Wood", lattitude: 51.525195012724566, longtitude: -1.2959107166057138),
     Location(name: "Piccadilly Circus", lattitude: 51.51041915149273, longtitude: -0.13419533740133177),
     Location(name: "Glenfinnan Viaduct", lattitude: 56.87632270320493, longtitude: -5.4317374446792375),
     Location(name: "Loch Etive", lattitude: 56.479747656102695, longtitude: -5.157108847264836),
     Location(name: "Loch Eilt", lattitude: 56.881702837961434, longtitude:  -5.601782690437301),
     Location(name: "Durham Cathedral", lattitude: 54.773375208970194, longtitude: -1.5764242890492002),
     Location(name: "The Elephant House", lattitude: 55.94769533309181, longtitude:  -3.191797345098157),
    
    
    ]
    
    
    
    
    func fetchLocationsOnMap(_ locations: [Location]) {
        for location in locations {
            let annotations = MKPointAnnotation()
            annotations.title = location.name
            annotations.coordinate = CLLocationCoordinate2D(latitude:
                                                                location.lattitude, longitude: location.longtitude)
            mapView.addAnnotation(annotations)
        }
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.requestLocation()
        }
    }
    
    
    
func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if let location = locations.first {
//            let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
//            let region = MKCoordinateRegion(center: location.coordinate, span: span)
//            mapView.setRegion(region, animated: true)
//        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error:: \(error)")
        
    }
    
    var resultSearchController:UISearchController? = nil
    
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let annotation = view.annotation,
              let locationData = location(for: annotation) else { return }
        
        // Load the view controller from the storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil) // Adjust
        if let popoverVC = storyboard.instantiateViewController(withIdentifier: "PopoverVC") as? PopoverPage {

            let temp = place(for: locationData.name)

            popoverVC.text = temp?.movieView ?? "ERROR GETTING DATA1"
            popoverVC.shot = temp?.shotView ?? "ERROR GETTING DATA2"
            popoverVC.fact = temp?.factView ?? "ERROR GETTING DATA3"
            popoverVC.image = UIImage(named: temp?.imageName ?? "ERROR GETTING DATA4") ?? UIImage()
            popoverVC.name = temp?.title ?? "ERROR GETTING DATA5"
            popoverVC.place = temp
          
            
            
            
            
            popoverVC.modalPresentationStyle = .popover
            
            if let popover = popoverVC.popoverPresentationController {
                popover.delegate = self
                popover.sourceView = view
                popover.sourceRect = view.bounds
                popover.permittedArrowDirections = .any
            }
            present(popoverVC, animated: true, completion: nil)
        }
        
        let selectedAnnotations = mapView.selectedAnnotations
        for annotation in selectedAnnotations {
              mapView.deselectAnnotation(annotation, animated: false)
        }
    }
    
    
   
    
    func location(for annotation: MKAnnotation) -> Location? {
        return locations.first { $0.name == annotation.title }
        
    }
    
    func place(for locationName: String) -> Place? {
        return data.first { $0.title == locationName }
        
    }
}



