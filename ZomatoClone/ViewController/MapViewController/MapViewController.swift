//
//  MapViewController.swift
//  ZomatoClone
//
//  Created by PCS213 on 27/06/22.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var currentLocationLabel: UILabel!
    
    let locationManager = CLLocationManager()
    var previousLocation: CLLocation?
    
    let geoCoder = CLGeocoder()
    var directionsArray: [MKDirections] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backButton = UIBarButtonItem()
        backButton.title = "  Choose Your Location"
        backButton.tintColor = UIColor.black
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        checkLocationService()
    }
    
    
    @IBAction func chnageLocationPressed(_ sender: UIButton)
    {
        let shareVc = storyboard?.instantiateViewController(withIdentifier: StringConstant.locationSearchVc) as! LocationSearchViewController
        
        if let sheet = shareVc.sheetPresentationController {
            sheet.detents = [ .medium(), .large()]
        }
        shareVc.navController = self.navigationController
        present(shareVc, animated: true, completion: nil)
    }
    
    
    @IBAction func confirmLocationPressed(_ sender: UIButton)
    {
        let a = self.navigationController?.viewControllers[0] as? DeliveryViewController
        a?.currentLocation = currentLocationLabel.text ?? ""
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func useCurrentLocationPressed(_ sender: UIButton)
    {
        getDirections()
    }
    
    func checkLocationService () {
        if CLLocationManager.locationServicesEnabled(){
            setupLoactionManager()
            checkLocationAuthorization()
        }
        else {
            print("Location Service is not enabled!")
        }
    }
    
    func setupLoactionManager () {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            startTackingUserLocation()
            break
        case .denied:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            break
        case .authorizedAlways:
            break
        @unknown default:
            break
        }
    }
    
    func startTackingUserLocation()
    {
        mapView.showsUserLocation = true
        centerViewOnUserLocation()
        locationManager.startUpdatingLocation()
        previousLocation = getCenterLocation(for: mapView)
    }
    
    func getCenterLocation(for mapView: MKMapView) -> CLLocation
    {
        let latitude = mapView.centerCoordinate.latitude
        let longitude = mapView.centerCoordinate.longitude
        
        return CLLocation(latitude: latitude, longitude: longitude)
    }
    
    func getDirections() {
        guard let location = locationManager.location?.coordinate else {
            //TODO: Inform user we don't have their current location
            return
        }
        
        let request = createDirectionsRequest(from: location)
        let directions = MKDirections(request: request)
        resetMapView(withNew: directions)
        
        directions.calculate { [unowned self] (response, error) in
            //TODO: Handle error if needed
            guard let response = response else { return } //TODO: Show response not available in an alert
            
            //      self.mapView.addOverlay(response.routes.first!.polyline)
            self.mapView.setVisibleMapRect(response.routes.first!.polyline.boundingMapRect, animated: true)
            
        }
    }
    
    
    func createDirectionsRequest(from coordinate: CLLocationCoordinate2D) -> MKDirections.Request {
        let destinationCoordinate       = getCenterLocation(for: mapView).coordinate
        let startingLocation            = MKPlacemark(coordinate: coordinate)
        let destination                 = MKPlacemark(coordinate: destinationCoordinate)
        
        let request                     = MKDirections.Request()
        request.source                  = MKMapItem(placemark: startingLocation)
        request.destination             = MKMapItem(placemark: destination)
        request.transportType           = .automobile
        request.requestsAlternateRoutes = true
        
        return request
    }
    
    
    func resetMapView(withNew directions: MKDirections) {
        mapView.removeOverlays(mapView.overlays)
        directionsArray.append(directions)
        let _ = directionsArray.map { $0.cancel() }
    }
    
    func centerViewOnUserLocation () {
        if let location = locationManager.location?.coordinate{
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: 10000, longitudinalMeters: 10000)
            mapView.setRegion(region, animated: true)
        }
    }
    
}


extension MapViewController : CLLocationManagerDelegate {
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
}


extension MapViewController : MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let center = getCenterLocation(for: mapView)
        let geoCoder = CLGeocoder()
        
        guard let previousLocation = self.previousLocation else { return }
        
        guard center.distance(from: previousLocation) > 50 else { return }
        self.previousLocation = center
        
        geoCoder.cancelGeocode()
        
        geoCoder.reverseGeocodeLocation(center) { [weak self] (placemarks, error) in
            guard let self = self else { return }
            
            if let _ = error {
                
                return
            }
            
            guard let placemark = placemarks?.first else {
                return
            }
            
            //            let streetNumber = placemark.subThoroughfare ?? ""
            //            let streetName = placemark.thoroughfare ?? ""
            let landMark = placemark.subLocality ?? ""
            
            DispatchQueue.main.async {
                self.currentLocationLabel?.text = "\(landMark)"
            }
        }
    }
}
