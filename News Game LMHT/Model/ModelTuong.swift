//
//  ModelTuong.swift
//  News Game LMHT
//
//  Created by trinh truong vu on 6/4/18.
//  Copyright © 2018 TRUONGVU. All rights reserved.
//

import UIKit

class ModelTuong {
    var nameTuong: String = ""
    var imgTuong: String = ""
    var imgLoaiTuong: String = ""
//    var urlTieuDiemTuong: String = ""
   var loaiTuong: String = ""
    init(nameTuong: String,imgTuong: String,imgLoaiTuong: String,loaiTuong: String )
    {
        self.nameTuong = nameTuong
        self.imgTuong = imgTuong
        self.imgLoaiTuong = imgLoaiTuong
        self.loaiTuong = loaiTuong
        // self.loaiTuong = loaiTuong
    }

}

