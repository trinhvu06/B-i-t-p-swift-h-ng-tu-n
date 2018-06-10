//
//  TuongViewController.swift
//  News Game LMHT
//
//  Created by trinh truong vu on 5/25/18.
//  Copyright © 2018 TRUONGVU. All rights reserved.
//

import UIKit

class TuongViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDataSource, UITableViewDelegate {
    var imgPhanLoai = ["Sát thủ","Xạ thủ","Pháp sư","Đấu sĩ","Hỗ trợ","Đỡ đòn"]
    var lbPhanloai = ["Sát thủ","Xạ thủ","Pháp sư","Đấu sĩ","Hỗ trợ","Đỡ đòn"]
//    var hinhTuong = ["Aatrox","Ahri","Akali","Alistar","Amumu","Anivia","Annie","Ashe","Aurelion Sol","Azir"]
//    var nameTuong = ["Aatrox","Ahri","Akali","Alistar","Amumu","Anivia","Annie","Ashe","Aurelion Sol","Azir"]
    var arrayTuong:[ModelTuong] = [

        ModelTuong(nameTuong: "Aatrox", imgTuong: "Aatrox", imgLoaiTuong: "Đấu sĩ", loaiTuong: "Đấu sĩ"),
        ModelTuong(nameTuong: "Ahri", imgTuong: "Ahri", imgLoaiTuong: "Sát thủ", loaiTuong: "Sát thủ"),
        ModelTuong(nameTuong: "Akali", imgTuong: "Akali", imgLoaiTuong: "Sát thủ", loaiTuong: "Sát thủ"),
        ModelTuong(nameTuong: "Alistar", imgTuong: "Alistar", imgLoaiTuong: "Hỗ trợ", loaiTuong: "Hỗ trợ"),
        ModelTuong(nameTuong: "Amumu", imgTuong: "Amumu", imgLoaiTuong: "Đỡ đòn", loaiTuong: "Đỡ đòn"),
        ModelTuong(nameTuong: "Anivia", imgTuong: "Anivia", imgLoaiTuong: "Pháp sư", loaiTuong: "Pháp sư"),
        ModelTuong(nameTuong: "Annie", imgTuong: "Annie", imgLoaiTuong: "Sát thủ", loaiTuong: "Sát thủ"),
        ModelTuong(nameTuong: "Ashe", imgTuong: "Ashe", imgLoaiTuong: "Xạ thủ", loaiTuong: "Xạ thủ"),
        ModelTuong(nameTuong: "Aurelion Sol", imgTuong: "Aurelion Sol", imgLoaiTuong: "Pháp sư", loaiTuong: "Pháp sư"),
        ModelTuong(nameTuong: "Azir", imgTuong: "Azir", imgLoaiTuong: "Pháp sư", loaiTuong: "Pháp sư")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
 
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgPhanLoai.count
    }// collectionView bước 1
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell         {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Phanloaituong", for: indexPath) as! PhanloaituongCollectionViewCell
//        let model = arrayTuong[indexPath.item]
        cell.imgPhanloaituong.image = UIImage(named: imgPhanLoai[indexPath.item])
        cell.lbPhanloaituong.text = lbPhanloai[indexPath.item]
        return cell
        }// collectionView bước 2
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayTuong.count
    } // tableView bước 1(tạo số lượng cell)
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Tuong", for: indexPath) as! TuongTableViewCell
        
        let model = arrayTuong[indexPath.row]
        cell.imgTuong.image = UIImage(named: model.imgTuong)
        cell.lbTuong.text = model.nameTuong
        return cell
    } // tableView bước 2 (lấy thông tin theo ví trí indexpath)


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

   

}
