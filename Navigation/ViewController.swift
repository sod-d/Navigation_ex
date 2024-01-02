//
//  ViewController.swift
//  Navigation
//
//  Created by soyoung kim on 2024/01/02.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        if segue.identifier == "editButton" {
            //버튼을 클릭한 경우
        }else if segue.identifier == "editBarButton"{
            //바 버튼을 클릭한 경우
        }
    }

}

