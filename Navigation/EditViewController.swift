//
//  EditViewController.swift
//  Navigation
//
//  Created by soyoung kim on 2024/01/02.
//

import UIKit

protocol EditDelegate {
    func didMessageEditDone(_ contoroller: EditViewController, message: String)
}

class EditViewController: UIViewController {
    var textWayValue : String = ""
    var textMessage : String = ""
    var delegate : EditDelegate?
    
    @IBOutlet var txtMessage: UITextField!
    @IBOutlet var swisOn: UISwitch!
    @IBOutlet var lblWay: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblWay.text = textWayValue
        txtMessage.text = textMessage
    }
    
    @IBAction func btnDone(_ sender: UIButton) {
        //데이터를 메인화면으로 전달
        if delegate != nil {
            delegate?.didMessageEditDone(self, message: txtMessage.text!)
        }
        
        _ = navigationController?.popViewController(animated: true)
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
