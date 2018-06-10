//
//  ModelUers.swift
//  News Game LMHT
//
//  Created by trinh truong vu on 6/6/18.
//  Copyright © 2018 TRUONGVU. All rights reserved.
//

import UIKit

class ModelUers: NSObject, NSCoding {
    //lưu lại
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.userName, forKey: "Tài Khoản")
        aCoder.encode(self.passWord, forKey: "Mật khẩu")
        aCoder.encode(self.gender, forKey: "Giới tính")
        aCoder.encode(self.age, forKey: "Tuổi")

    }
// gọi ra
    required init?(coder aDecoder: NSCoder) {
        
        // Kiểu String
        self.userName = aDecoder.decodeObject(forKey: "Tài Khoản") as! String
        self.passWord = aDecoder.decodeObject(forKey: "Mật khẩu") as! String
        self.gender = aDecoder.decodeObject(forKey: "Giới tính") as! String
            
        // Kiểu Int
        
        self.age = Int(aDecoder.decodeCInt(forKey: "Tuổi"))
        
        // Kiểu Bool
        //        aDecoder.decodeBool(forKey: "Bool")
        
        // Kiểu Float
        //        aDecoder.decodeFloat(forKey: "Float")
    }
    

    var userName: String = ""
    var passWord: String = ""
    var gender: String = ""
    var age: Int
    init(userName: String, passWord: String,gender: String = "",age: Int = 0 ) {
        self.userName = userName
        self.passWord = passWord
        self.gender = gender
        self.age = age
        
    } // 2.1 tạo model
    
    func getInfo() -> [(title: String, subTitle: String)] {
        var result: [(title: String, subTitle: String)] = []
        
        result.append(("Tài khoản", self.userName))
        result.append(("Mật khẩu", self.passWord))
        result.append(("Giới tính", self.gender))
        result.append(("Tuổi", "\(self.age)"))
        
        return result
    }

}
