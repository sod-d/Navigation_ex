//
//  EditViewController.swift
//  Navigation
//
//  Created by soyoung kim on 2024/01/02.
//

import UIKit

protocol EditDelegate {
    func didMessageEditDone(_ contoroller: EditViewController, message: String)
    func didImageOnOff(_ controller: EditViewController, isOn: Bool)
    func didImageZommDone(_ controller: EditViewController, isZoom: BooleanLiteralType)
}

class EditViewController: UIViewController {
    var textWayValue : String = ""
    var textMessage : String = ""
    var delegate : EditDelegate?
    var isOn = false
    var isZoom = false
    
    @IBOutlet var txtMessage: UITextField!
    @IBOutlet var BtnZoom: UIButton!
    @IBOutlet var swIsOn: UISwitch!
    @IBOutlet var lblWay: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblWay.text = textWayValue
        txtMessage.text = textMessage
        swIsOn.isOn = isOn
    }
    
    @IBAction func btnDone(_ sender: UIButton) {
        //데이터를 메인화면으로 전달
        if delegate != nil {
            delegate?.didMessageEditDone(self, message: txtMessage.text!)
            delegate?.didImageOnOff(self, isOn: isOn)
        }
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func ZoomInOut(_ sender: UIButton) {
        if sender.isZoom {
            
        }
        
    }
    
    @IBAction func swImageOnOff(_ sender: UISwitch) {
        if sender.isOn{
            isOn = true
        }else{
            isOn = false
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
