//
//  ListAccViewController.swift
//  News Game LMHT
//
//  Created by trinh truong vu on 6/10/18.
//  Copyright © 2018 TRUONGVU. All rights reserved.
//

import UIKit

class ListAccViewController: UIViewController {

    var arrayUser:[ModelUers] = [ModelUers]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrayUser = self.retrieveItems()
        
    }
    
    func retrieveItems() -> [ModelUers] {
        if let data = UserDefaults.standard.object(forKey: "listUsers") as? NSData {
            let _mySavedList = NSKeyedUnarchiver.unarchiveObject(with: data as Data) as? [ModelUers] ?? []
            return _mySavedList
        }
        
        return []
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
extension ListAccViewController: UITableViewDataSource{
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "ListAcc")
        let userInfo = arrayUser[indexPath.row]
        
        cell.textLabel?.text = userInfo.userName
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayUser.count
    }
}
extension ListAccViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let userInfo = arrayUser[indexPath.row]
        
        // truyền userinfo vào ShowAccViewController
        let showAcc = self.storyboard?.instantiateViewController(withIdentifier: "ShowAccViewController") as? ShowAccViewController
        showAcc!.userInfo = userInfo
        
        self.present(showAcc!, animated: true, completion: nil)
}
}
