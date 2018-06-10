//
//  ViewController.swift
//  Bài tập tuần 2-ngày 1
//
//  Created by trinh truong vu on 5/31/18.
//  Copyright © 2018 TRUONGVU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Login: UIButton!
    
    @IBOutlet weak var LoginFB: UIButton!
   
    @IBOutlet weak var viewPass: UIView!
    
    @IBOutlet weak var viewUse: UIView!
    
    @IBOutlet weak var imgUser: UIImageView!
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passTextField: UITextField!
    
    @IBOutlet weak var imgPass: UIImageView!
    
    var arrayLogin:[ModelUers] = [
            ModelUers(userName: "trinhtruongvu", passWord: "123456", gender:"Nam" , age: 25),
            ModelUers(userName: "nguyenconghau", passWord: "123456", gender: "Nam", age: 25)
    ] //2.2 tạo array model
    
    //1.1 tạo các giá trị cần nhận dữ liệu
//    var userName : String?
//    var pasWord : String?
//    weak var signUpViewController: SignUpViewController?


    override func viewDidLoad() {
        super.viewDidLoad()
            //2.1 gán giá trị vào view
            //        usernameTextField.text = userName
            //        passTextField.text = pasWord
        
        
        // self.Login.layer.cornerRadius = 4 //bo tròn
        // self.LoginFB.layer.cornerRadius = 4 //bo tròn
        self.Login.layer.cornerRadius = self.Login.frame.size.height/2.0 // bo tròn

        self.LoginFB.layer.cornerRadius = self.LoginFB.frame.size.height/2.0 // bo tròn
        self.LoginFB.layer.borderWidth = 1 //tạo viền
        self.LoginFB.layer.borderColor = UIColor.blue.cgColor //tạo màu viền
        
        self.viewUse.layer.borderWidth = 0.5 //tạo viền ////tạo màu viền
        self.viewUse.layer.borderColor = UIColor.gray.cgColor
        
        self.viewPass.layer.borderWidth = 0.5 //tạo viền
        self.viewPass.layer.borderColor = UIColor.gray.cgColor ////tạo màu viền
        self.imgUser.layer.borderWidth = 0.5
        self.imgUser.layer.borderColor = UIColor.gray.cgColor
        
        self.imgPass.layer.borderWidth = 0.5
        self.imgPass.layer.borderColor = UIColor.gray.cgColor
        
        // let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapSignUp(_:)))
        // self.usernameTextField.addGestureRecognizer(tapGesture)
        // self.usernameTextField.isUserInteractionEnabled = true
        //  } //// tạo Acction cho các UI không có action
        
        if self.retrieveItems().count == 0 {
            self.insertItems()
        } else {
            self.arrayLogin = self.retrieveItems()
        }
    }
    //
    func insertItems() {
        let defaults = UserDefaults.standard
        
        let data = NSKeyedArchiver.archivedData(withRootObject: arrayLogin)
        defaults.set(data, forKey: "listUsers")
    }
    //
    func retrieveItems() -> [ModelUers] {
        if let data = UserDefaults.standard.object(forKey: "listUsers") as? NSData {
            let _mySavedList = NSKeyedUnarchiver.unarchiveObject(with: data as Data) as? [ModelUers] ?? []
            return _mySavedList
        }
        
        return []
    }

    //@objc func tapSignUp(_ gesture : UIGestureRecognizer) {
    //  usernameTextField.text = "123"
    // }  // tạo Acction cho các UI không có action

      
    @IBAction func btnLogin(_ sender: Any) {
   
        //usernameTextField.text = " tên đăng nhập"
        //passTextField.text = "Mật Khẩu"
//         let username = "imic2018"
//        let password = "123456"

        var coDuLieuTrongDatabase = false
        for model in arrayLogin {
            if self.usernameTextField.text == model.userName && self.passTextField.text == model.passWord {
                coDuLieuTrongDatabase = true
                break
            }
        } // 7.2 Điều kiện cho phép
        
        if coDuLieuTrongDatabase // nếu coDuLieuTrongDatabase thì
        {
             //    tạo các thông báo khi làm việc
            let alertController = UIAlertController(title: "LOGIN", message: "Đăng Nhập Thành Công", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Tiếp tục ", style: .default) { (alert) in
                let storyBoard = UIStoryboard(name: "Main", bundle: nil) // gọi từ storyBoard này sang storyBoard khác
                if let controller = storyBoard.instantiateViewController(withIdentifier: "TuongViewController") as? TuongViewController
                {
                    self.present(controller,animated: true, completion: nil)
                }
            } // đăng nhập từ storyboard này sang storyboar khác
            
            let cancelAction = UIAlertAction(title: "Quay lại", style: .cancel)
            {
                (_)in
                print("Cancel")
            }
            alertController.addAction(okAction)
            alertController.addAction(cancelAction)
            self.present(alertController, animated: true, completion: nil)
        }
        else if self.usernameTextField.text?.count == 0 && self.passTextField.text?.count == 0
        {
            let alertController = UIAlertController(title: "LOGIN", message: "Nhập Thông Tin", preferredStyle: .alert)
            let cancelAcction = UIAlertAction(title: "Quay lại", style: .cancel)
            {
                (_)in
                print("Cancel")
                
            }
            alertController.addAction(cancelAcction)
            self.present(alertController, animated: true, completion: nil)
        }
        else
        {
            let alertController = UIAlertController(title: "LOGIN", message: "Tài Khoản hoặc Mật Khẩu sai", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Quay Lại", style: .cancel)
            {
                (_)in
                print("Cancel")
            }
            alertController.addAction(cancelAction)
            self.present(alertController, animated: true, completion: nil)
            
        }
        let storyBoard = UIStoryboard(name: "Main", bundle: nil) // gọi từ storyBoard này sang storyBoard khác
        if let controller = storyBoard.instantiateViewController(withIdentifier: "TuongViewController") as? TuongViewController
        {
            self.present(controller,animated: true, completion: nil)
        }
        
    }
    
    @IBAction func btnLoginFB(_ sender: Any) {
        
    }
    
    @IBAction func signUpButtonAction(_ sender: UIButton) {
        
       if let controller = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController
        {
            controller.delegate = self
            self.present(controller,animated: true, completion: nil)
        } //8.2
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: SignUpDelegate {
    func guiDuLieuVeChoThangLogin(model: ModelUers) {
        
        usernameTextField.text = model.userName
        passTextField.text = model.passWord
        self.arrayLogin.append(model)
        self.insertItems()

    } // 9.2 nhận dữ liệu và thực hiện
}

