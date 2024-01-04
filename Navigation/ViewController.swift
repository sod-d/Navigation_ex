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
    var isZoom = true
    
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
    
    func didImageZommDone(_ controller: EditViewController, isZoom: BooleanLiteralType) {
        let scale:CGFloat = 2.0
        var widthImg, heightImg:CGFloat
        
        if isZoom {
            widthImg = imgView.frame.width/scale
            heightImg = imgView.frame.height/scale
        }else{
            widthImg = imgView.frame.width*scale
            heightImg = imgView.frame.height*scale
        }
        imgView.frame.size = CGSize(width: widthImg, height: heightImg)
        isZOom = !isZoom
    }

}

