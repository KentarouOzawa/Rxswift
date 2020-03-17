//
//  ViewController.swift
//  NumbersRxswift
//
//  Created by 小澤謙太郎 on 2020/03/16.
//  Copyright © 2020 小澤謙太郎. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {
    @IBOutlet weak var number1: UITextField!
    
    @IBOutlet weak var number2: UITextField!
    @IBOutlet weak var number3: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Observable.combineLatest(number1.rx.text.orEmpty,number2.rx.text.orEmpty,number3.rx.text.orEmpty){
            textValue1,textValue2,textValue3 -> Int in return (Int(textValue1) ?? 0) + (Int(textValue2) ?? 0) + (Int(textValue3) ?? 0)
        }
        .map { $0.description }
        .bind(to: resultLabel.rx.text)
        
        // Do any additional setup after loading the view.
    }


}

