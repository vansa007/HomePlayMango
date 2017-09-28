//
//  MapViewController.swift
//  HomePlay Mango
//
//  Created by Vansa Pha on 8/29/17.
//  Copyright © 2017 Vansa Pha. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {

    @IBOutlet weak var mapDisplay: GMSMapView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mapDisplay.layoutIfNeeded()
        self.mapDisplay.roundCorners(corners: [.allCorners], radius: 10.0)
        self.mapDisplay = initMapView()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    //config google maps
    func initMapView() -> GMSMapView {
        let camera = GMSCameraPosition.camera(withLatitude: 11.565874, longitude: 104.937396, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        return mapView
    }
    
    @IBAction func closeMapAction(_ sender: UIButton) {
        //self.unwind(for: UIStoryboardSegue, towardsViewController: ViewController)
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension UIView {
    func roundCorners(corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}
