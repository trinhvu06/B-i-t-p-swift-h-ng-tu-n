//
//  ShowAccViewController.swift
//  News Game LMHT
//
//  Created by trinh truong vu on 6/10/18.
//  Copyright © 2018 TRUONGVU. All rights reserved.
//

import UIKit

class ShowAccViewController: UIViewController, UITableViewDataSource {
    var userInfo: ModelUers!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userInfo.getInfo().count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "ShowAcc")
        let info = userInfo.getInfo()[indexPath.row]
        
        cell.textLabel?.text = info.title
        cell.detailTextLabel?.text = info.subTitle
        
        return cell
    }
    @IBAction func backAction(_ sender: UIButton) {
         self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

