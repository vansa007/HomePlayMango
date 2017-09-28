//
//  ListItemViewController.swift
//  HomePlay Mango
//
//  Created by Vansa Pha on 8/29/17.
//  Copyright © 2017 Vansa Pha. All rights reserved.
//

import UIKit

class ListItemViewController: UIViewController {

    @IBOutlet weak var renderViw: UIView!
    @IBOutlet weak var tableViw: UITableView!
    let dataSource = [
        [
        "loc_id": 1,
        "loc_name": "PhyAdd living",
        "loc_phone": "012215467",
        "loc_address": "samnong 12",
        "loc_image": "",
        "loc_lat": "11.561011",
        "loc_long": "104.891864",
        "loc_desc": "fresh city",
        "created_at": "",
        "updated_at": ""
        ],
        [
        "loc_id": 2,
        "loc_name": "test1",
        "loc_phone": "012345678",
        "loc_address": "pp",
        "loc_image": "",
        "loc_lat": "123",
        "loc_long": "456",
        "loc_desc": "",
        "created_at": "2017-07-28 19:16:31",
        "updated_at": "2017-07-28 19:16:31"
        ],
        [
        "loc_id": 3,
        "loc_name": "test2",
        "loc_phone": "565131851",
        "loc_address": "BB",
        "loc_image": "1501270498baby-dog_112983-1920x1080.jpg",
        "loc_lat": "452",
        "loc_long": "351",
        "loc_desc": "XXe",
        "created_at": "2017-07-28 19:34:58",
        "updated_at": "2017-07-28 19:34:58"
        ],
        [
        "loc_id": 4,
        "loc_name": "test3",
        "loc_phone": "0112555466",
        "loc_address": "KPS",
        "loc_image": "15012711274398b277a5f00055bf12416b62b54fcc.jpg",
        "loc_lat": "54565",
        "loc_long": "545551",
        "loc_desc": "dog dog",
        "created_at": "2017-07-28 19:45:27",
        "updated_at": "2017-07-28 19:45:27"
        ],
        [
        "loc_id": 5,
        "loc_name": "test4",
        "loc_phone": "012524554",
        "loc_address": "KEP",
        "loc_image": "1501271390dog_puppy_white_baby_11435_1920x1080.jpg",
        "loc_lat": "54656",
        "loc_long": "51656",
        "loc_desc": "with her",
        "created_at": "2017-07-28 19:49:50",
        "updated_at": "2017-07-28 19:49:50"
        ],
        [
        "loc_id": 6,
        "loc_name": "Sothea si plok",
        "loc_phone": "0325255546",
        "loc_address": "Phnom Penh Tmey",
        "loc_image": "1502349470Nico-J-Post-686.jpg",
        "loc_lat": "15.5555",
        "loc_long": "12.45544",
        "loc_desc": "Holly Shit",
        "created_at": "2017-08-10 07:17:50",
        "updated_at": "2017-08-10 07:17:50"
        ],
        [
        "loc_id": 7,
        "loc_name": "sothea",
        "loc_phone": "012515665",
        "loc_address": "phnom penh tmey, battambang, Siem Reab, Pursat, Phnom Penh, phnom penh tmey, battambang, Siem Reab, Pursat, Phnom Penh",
        "loc_image": "1502952888Pestario-–-Post-212.jpg",
        "loc_lat": "12256.255",
        "loc_long": "122.2565",
        "loc_desc": "fhkfhsfhsjfs",
        "created_at": "2017-08-17 06:54:48",
        "updated_at": "2017-08-17 06:54:48"
        ]
    ]
    
    var alert = UIAlertController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //config table display
        self.tableViw.estimatedRowHeight = 150.0
        self.tableViw.rowHeight = UITableViewAutomaticDimension
        self.renderViw.layoutIfNeeded()
        self.renderViw.roundCorners(corners: [.allCorners], radius: 10.0)

    }
    
    @IBAction func closeListItemAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func alertCallMapAction(idx:Int, sms:String) {
        alert = UIAlertController(title: sms, message: "You should map the location before call them.", preferredStyle: .actionSheet)
        let mapBtn = UIAlertAction(title: "Maps", style: .default, handler: nil)
        let callBtn = UIAlertAction(title: "Call", style: .default, handler: nil)
        let cancelBtn = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(mapBtn)
        alert.addAction(callBtn)
        alert.addAction(cancelBtn)
        self.present(alert, animated: true, completion: nil)
    }
}

extension ListItemViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? customListItemCell {
            cell.itemName.text = self.dataSource[indexPath.row]["loc_name"] as? String ?? ""
            cell.itemPhoneNumber.text = self.dataSource[indexPath.row]["loc_phone"] as? String ?? ""
            cell.itemAddress.text = self.dataSource[indexPath.row]["loc_address"] as? String ?? ""
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let phoneNumber = self.dataSource[indexPath.row]["loc_phone"] as? String ?? ""
        self.alertCallMapAction(idx: indexPath.row, sms: phoneNumber)
    }
    
}

class customListItemCell: UITableViewCell {
    @IBOutlet weak var thumnailImg: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemPhoneNumber: UILabel!
    @IBOutlet weak var itemAddress: UILabel!
}
