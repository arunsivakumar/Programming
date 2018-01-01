//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Lakshmi on 12/10/16.
//  Copyright © 2016 Lakshmicom.arunsivakumar. All rights reserved.
//


import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var  mapView = MKMapView()
    
    override func loadView(){
       
        view = mapView
        
        let segmentedControl = UISegmentedControl(items:["Standard", "Hybrid","Satellite"])
        segmentedControl.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentIndex = 0
        view.addSubview(segmentedControl)
        
        //        let topConstraint = segmentedControl.topAnchor.constraintEqualToAnchor(view.topAnchor)
        //        let leadingConstraint = segmentedControl.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor)
        //        let trailingConstraint = segmentedControl.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor)
        
        let topConstraint = segmentedControl.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor, constant: 8)
        
        let margin = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraintEqualToAnchor(margin.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraintEqualToAnchor(margin.trailingAnchor)
        
        topConstraint.active = true
        leadingConstraint.active = true
        trailingConstraint.active = true
        
        segmentedControl.addTarget(self, action: #selector(MapViewController.mapTypeChanged(_:)), forControlEvents: .ValueChanged)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Loaded")
    }
    
    func mapTypeChanged(segControl:UISegmentedControl){
        switch segControl.selectedSegmentIndex{
        case 0 :
            mapView.mapType = .Standard
        case 1 :
            mapView.mapType = .Hybrid
        case 2 :
            mapView.mapType = .Satellite
        default :
            break
        }
        
    }
    
}
