//
//  ViewController.swift
//  Navigation
//
//  Created by soyoung kim on 2024/01/02.
//

import UIKit

class ViewController: UIViewController, EditDelegate {
    
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    
    var isOn = true
    var isZoom = false
    var orgZoom = false
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var txtMessage: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = imgOn
    }

    //segue를 이용해 화면 전환
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        if segue.identifier == "editButton" {
            //버튼을 클릭한 경우
            editViewController.textWayValue = "segue : use Button"
        }else if segue.identifier == "editBarButton"{
            //바 버튼을 클릭한 경우
            editViewController.textWayValue = "segue : use Bar Button"
        }
        
        //데이터를 editViewDontroller 으로 전달
        editViewController.textMessage = txtMessage.text!
        editViewController.isOn = isOn
        editViewController.isZoom = orgZoom
        editViewController.delegate = self
    }
    
    //EditViewController에서 함수를 호출하며 message를 전달
    func didMessageEditDone(_ contoroller: EditViewController, message: String) {
        txtMessage.text = message
    }
    
    //전구 이미지 세팅
    func didImageOnOff(_ controller: EditViewController, isOn: Bool) {
        if isOn {
            imgView.image = imgOn
            self.isOn = true
        } else {
            imgView.image = imgOff
            self.isOn = false
        }
    }
    
    func didImageZomDone(_ controller: EditViewController, isZoom: Bool) {
        let scale:CGFloat = 2.0
        var newWidth:CGFloat, newHeight:CGFloat

        if isZoom {
            if !orgZoom {
                self.isZoom = false
                self.orgZoom = true
                newWidth = imgView.frame.width*scale
                newHeight = imgView.frame.height*scale
                imgView.frame.size = CGSize(width: newWidth, height: newHeight)
            }

            print("Zoom: true")
        } else {
            if orgZoom  {
                self.isZoom = true
                self.orgZoom = false
                newWidth = imgView.frame.width/scale
                newHeight = imgView.frame.height/scale
                imgView.frame.size = CGSize(width: newWidth, height: newHeight)
            }
            print("Zoom: false")
        }
        
    }

}

