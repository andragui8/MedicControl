//
//  MapView.swift
//  MedicControl
//
//  Created by Andrés Aguirre on 31/03/2019.
//  Copyright © 2019 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class MapView: BaseView<MapPresenterProtocol>, MKMapViewDelegate {
    // MARK: IBOutlets declaration of all controls
    @IBOutlet weak var labelMapTitle: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var viewTitleMap: UIView!
    @IBOutlet weak var viewUserLocationButton: UIView!
    @IBOutlet weak var buttonGetUserLocation: UIButton!
    
    // MARK: Fileprivate Variables all variables must be for internal use, we should only have access to controls from the presenter
    
    // MARK: UIViewController Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeUI()
        self.i18N()
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.addPharmacyTapped))
        //let play = UIBarButtonItem(title: "Play", style: .plain, target: self, action: #selector(playTapped))
        self.navigationItem.setRightBarButton(add, animated: true)
        //self.navigationController?.navigationItem.rightBarButtonItems = [add]
        self.presenter?.mapViewDidLoad()
        self.mapView.delegate = self
    }
    
    // MARK: IBActions declaration of all the controls
    @IBAction func searchCurrentLocation(_ sender: Any) {
        self.presenter?.getCurrentLocation()
    }
    
    @objc func addPharmacyTapped() {
        self.presenter?.createPharmacyItemAlert()
    }
    
    // MARK: Private Functions
    
    // MARK: Maps - delegates
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let identifier = "Annotation"
        if annotation is MKUserLocation {
            return nil
        }
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil {
            
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            guard var frameAnnotation = annotationView?.frame else {
                return nil
            }
            
            let customView = UIView(frame: CGRect(x: 0, y: 0, width: frameAnnotation.width, height: frameAnnotation.height))
            customView.backgroundColor = UIColor.green
            
            let imageView = UIImageView(image: #imageLiteral(resourceName: "ico-farmacia-abierta"))
            
            frameAnnotation.size.height = 25
            frameAnnotation.size.width = 25
            customView.frame = frameAnnotation
            customView.layer.cornerRadius = customView.frame.width / 2
            annotationView?.frame = frameAnnotation
            frameAnnotation.size.height = 15
            frameAnnotation.size.width = 15
            imageView.frame = frameAnnotation
            imageView.center = customView.center
            
            customView.addSubview(imageView)
            annotationView?.addSubview(customView)
            
            //annotationView?.image = #imageLiteral(resourceName: "ico-farmacia-abierta")
        } else {
            annotationView?.annotation = annotation
        }
        
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.didTapPin(onMap:)))
//        annotationView?.addGestureRecognizer(tapGesture)
        
        return annotationView
    }
    
    @objc fileprivate func didTapPin(onMap: MKMapView) {
        
    }
}

// MARK: Extensions declaration of all extension and implementations of protocols 
extension MapView: BaseViewControllerRefresh {
    func refresh() {
        
    }
    
    func i18N() {
        self.title = "Mapa"
        self.labelMapTitle.text = "Encuentra las farmacias abiertas"
    }
    
    func initializeUI() {
        //Label del título
        MedicControlUtils.applyShadow(view: self.viewTitleMap)
        
        //Botón de localización del usuario
        self.viewUserLocationButton.layer.cornerRadius = self.viewUserLocationButton.frame.width / 2
        MedicControlUtils.applyShadowAtTop(view: self.viewUserLocationButton)
        
        //Vista donde se encuentra el botón de localización del usuario
        let origImage = #imageLiteral(resourceName: "ico-localizacion")
        let tintedImage = origImage.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        self.buttonGetUserLocation.setImage(tintedImage, for: .normal)
        self.buttonGetUserLocation.tintColor = UIColor.gray
    }
}

final class PharmacyAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String?, subtitle: String?) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        super.init()
    }
    
    var region: MKCoordinateRegion {
        let span = MKCoordinateSpan(latitudeDelta: 0.8, longitudeDelta: 0.8)
        return MKCoordinateRegion(center: coordinate, span: span)
    }
    
}
