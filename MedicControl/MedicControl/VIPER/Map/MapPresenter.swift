//
//  MapPresenter.swift
//  MedicControl
//
//  Created by Andrés Aguirre on 31/03/2019.
//  Copyright © 2019 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation
import MapKit

protocol MapPresenterProtocol: AnyObject, CLLocationManagerDelegate {
    var mapDTO: MapDTO? { get set }
    var pharmacies: [PharmacyModel]? { get set }
    func mapViewDidLoad()
    func getCurrentLocation()
    func createPharmacyItemAlert()
}

final class MapPresenter: BasePresenter<MapView, MapRouterProtocol, MapInteractorProtocol>, MapPresenterProtocol, CLLocationManagerDelegate {
    var mapDTO: MapDTO? 
    var locationManager = CLLocationManager()
    var pharmacies: [PharmacyModel]?
    
    // MARK: Internal functions declaration of all functions and protocol variables
    internal func mapViewDidLoad() {
        self.mapViewDidLoadAction()
        self.chechPermissionsAction()
        self.getPharmacies()
    }
    internal func getCurrentLocation() {
        self.getCurrentLocationAction()
    }
    
    internal func createPharmacyItemAlert() {
        self.createPharmacyItemAlertAction()
    }
    
    internal func getPharmacies () {
        self.getPharmaciesAction()
    }
    
    // MARK: Fileprivate functions declaration of all functions that return something to the protocol or perform an activity that should not be exposed
    fileprivate func mapViewDidLoadAction() {
        
    }
    
    fileprivate func createPharmacyItemAlertAction() {
        let alert = UIAlertController(title: "Nueva Farmacia",
                                      message: "Añade una farmacia",
                                      preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Guardar", style: .default) { _ in
        
            guard let textField = alert.textFields?.first, let text = textField.text,
                let coordinates = self.locationManager.location?.coordinate else { return }
            
            self.interactor?.saveItem(name: text, latitude: coordinates.latitude, longitude: coordinates.longitude)
                                        
        }
        
        let cancelAction = UIAlertAction(title: "Cancelar",
                                         style: .cancel)
        
        alert.addTextField()
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        self.view?.present(alert, animated: true, completion: nil)
    }
    
    fileprivate func getPharmaciesAction() {
        self.interactor?.getFarmacias(success: { pharmacies in
            self.pharmacies = pharmacies
            var listPharmacyAnnotations: [PharmacyAnnotation] = []
            guard let pharmaciesModel = self.pharmacies else {
                return
            }
            for pharmacy in pharmaciesModel {
                listPharmacyAnnotations.append(PharmacyAnnotation(coordinate: CLLocationCoordinate2D(latitude: pharmacy.latitude,
                                                                                                     longitude: pharmacy.longitude),
                                                                  title: pharmacy.key.uppercased(), subtitle: pharmacy.name))
            }
            self.view?.mapView.addAnnotations(listPharmacyAnnotations)
        })
    }
    
    // FUNCIÓN PARA OBTENER EL PERMISO DE ACCESO A LA LOCALIZACIÓN DEL USUARIO
    fileprivate func chechPermissionsAction() {
        let authStatus = CLLocationManager.authorizationStatus()
        if authStatus == .notDetermined {
            self.locationManager.requestWhenInUseAuthorization()
        }
    }
    
    fileprivate func getCurrentLocationAction() {
        let authStatus = CLLocationManager.authorizationStatus()
        switch authStatus {
        case .notDetermined:
            self.locationManager.requestWhenInUseAuthorization()
        case .denied, .restricted:
            self.showLocationServicesDeniedAlert()
        default:
            if CLLocationManager.locationServicesEnabled() {
                self.locationManager.delegate = self
                self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
                self.locationManager.startUpdatingLocation()
                self.getPharmacies()
            }
        }
    }
    
    fileprivate func showLocationServicesDeniedAlert() {
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel)
        let settingsAction = UIAlertAction(title: "Ajustes", style: .default) { _ -> Void in
            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                return
            }
            
            if UIApplication.shared.canOpenURL(settingsUrl) {
                UIApplication.shared.open(settingsUrl, completionHandler: nil)
            }
        }
        let alert = UIAlertController(title: "Alerta", message: "", preferredStyle: .alert)
        alert.addAction(cancelAction)
        alert.addAction(settingsAction)
        self.view?.present(alert, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationManager.stopUpdatingLocation()
        self.view?.mapView.showsUserLocation = true
        self.centreMap()
    }
    
    fileprivate func centreMap() {
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05 )
        guard let myLocation = self.locationManager.location?.coordinate else {
            return
        }
        let myLocationCoordinate: CLLocationCoordinate2D = CLLocationCoordinate2DMake(myLocation.latitude, myLocation.longitude)
        let region = MKCoordinateRegion(center: myLocationCoordinate, span: span)
        self.view?.mapView.setRegion(region, animated: true)
    }
}
