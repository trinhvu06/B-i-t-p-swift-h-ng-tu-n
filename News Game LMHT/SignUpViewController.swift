//
//  SignUpViewController.swift
//  Bài tập tuần 2-ngày 1
//
//  Created by trinh truong vu on 6/4/18.
//  Copyright © 2018 TRUONGVU. All rights reserved.
//

import UIKit

protocol SignUpDelegate : class {
    func guiDuLieuVeChoThangLogin(model: ModelUers)
} // 2.3 tạo delagate (Truyền dữ liệu)

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var usernameView: UIView!
    
    @IBOutlet weak var passwordView: UIView!
    
    @IBOutlet weak var nhaplaipassView: UIView!
    
    @IBOutlet weak var usernameImg: UIImageView!
    
    @IBOutlet weak var passImg: UIImageView!
    
    @IBOutlet weak var nhappassImg: UIImageView!
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passTextField: UITextField!
    
    @IBOutlet weak var nhappassTextField: UITextField!
    
    @IBOutlet weak var gioiTinhSegmentedControl: UISegmentedControl!
    
    
    @IBOutlet weak var tuoiSlider: UISlider!
    
    var userTapBack: String?
    
    weak var delegate : SignUpDelegate? //2.4 tạo biến delegate // tại sao phải để weak phía trước: vì nếu không dùng weak thì bộ nhớ sẽ không giải phóng
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.usernameView.layer.borderWidth = 0.5 //tạo viền
        self.usernameView.layer.borderColor = UIColor.gray.cgColor
        
        self.passwordView.layer.borderWidth = 0.5 //tạo viền
        self.passwordView.layer.borderColor = UIColor.gray.cgColor
        
        self.nhaplaipassView.layer.borderWidth = 0.5 //tạo viền
        self.nhaplaipassView.layer.borderColor = UIColor.gray.cgColor

        self.passImg.layer.borderWidth = 0.5 //tạo viền
        self.passImg.layer.borderColor = UIColor.gray.cgColor
        
        self.nhappassImg.layer.borderWidth = 0.5 //tạo viền
        self.nhappassImg.layer.borderColor = UIColor.gray.cgColor
        
        self.usernameImg.layer.borderWidth = 0.5 //tạo viền
        self.usernameImg.layer.borderColor = UIColor.gray.cgColor
        
       
        // Do any additional setup after loading the view.
    }
    

 
    @IBAction func backButtonAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func DangKyButtonAction(_ sender: UIButton) {
        // Điều kiện
        // 1. Username hoặc password > 0
        if usernameTextField.text?.count == 0 || passTextField.text?.count == 0 {
            //
            self.showAlert(title: "Error", message: "Tài khoản hoặc mật khẩu không được rỗng")
            return
        }
        
        // 2 Username khong đc có ký tự đặc biệt (#)
        // if let
        // guard let
        if usernameTextField.text?.contains("#") ?? false {
            //
            self.showAlert(title: "Error", message: "Tài Khoản không được phép có ký tự đặc biệt")
            return
        }
        
        // 3 Password.count > 6
        if passTextField.text?.count ?? 0 < 6 {
            //
            self.showAlert(title: "Error", message: "Mật khẩu không được nhỏ hơn 6 ký tự")
            return
        }
        
        // 4 ConfirmPassword == password
        if passTextField.text != nhappassTextField.text {
            self.showAlert(title: "Error", message: "Mật khẩu phải giống nhau")
            return
        }
        var gioitinh = ""
        if gioiTinhSegmentedControl.selectedSegmentIndex == 0
        {
        gioitinh = "Nữ"
            
        }
        if gioiTinhSegmentedControl.selectedSegmentIndex == 1
        {
            gioitinh = "Nam"
        }
        else
        {
        gioitinh = "Không xác định"
        }
        
        let model = ModelUers(userName: self.usernameTextField.text ?? "", passWord: self.passTextField.text ?? "", gender: gioitinh, age: Int(tuoiSlider.value))
        self.delegate?.guiDuLieuVeChoThangLogin(model: model) //2.5 tạo và truyền dữ liệu qua class khác
        self.dismiss(animated: true, completion: nil) // 2.6.hạ màng hình signup
        
//       // 4.1tạo viewcontroller cần truyền dữ liệu
//        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController
//            else
//        {
//           return
//        }
//        //5.1 gán dữ liệu vào biến
//        viewController.userName = usernameTextField.text
//        viewController.pasWord = passTextField.text
//        viewController.signUpViewController = self
//        // 6.1 show dữ liệu
//         self.present(viewController, animated: true, completion: nil)
//        let userInfo = [ModelUers].self
//        userInfo.userName = usernameTextField.text ?? ""
//        userInfo.passWord = passTextField.text ?? ""
//        userInfo.gender = 10
//        userInfo.age = 20
        
    }
    func showAlert(title: String?, message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(alertAction)
        
        self.present(alertController, animated: true, completion: nil)
    }

    
    
    @IBAction func segmentGenderChangedAction(_ sender: UISegmentedControl) {
        print("segmentGenderChangedAction: \(sender.selectedSegmentIndex)")
        
        // Alert thông báo rằng bạn đã thay đổi giới tính
    }
    
    @IBAction func onSwitchPolicyAction(_ sender: UISwitch) {
        print("onSwitchPolicyAction: \(sender.isOn)")
        
        // Alert bạn đã bật hoặc tắt
    }
    
    @IBAction func slideAgeAction(_ sender: UISlider) {
        print("slideAgeAction: \(Int(sender.value))")
        // Typecast (ép kiêu) : Int(giá tri cần ép kiểu)
        // self.label.text = Int()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
   
}
