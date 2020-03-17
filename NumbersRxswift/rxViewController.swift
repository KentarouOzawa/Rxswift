//
//  rxViewController.swift
//  NumbersRxswift
//
//  Created by 小澤謙太郎 on 2020/03/16.
//  Copyright © 2020 小澤謙太郎. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class rxViewController: UIViewController {
    private let disposeBag = DisposeBag()
    //private var viewModel:HogeViewModel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
       //ラベル
             let label = UILabel()
             label.frame = CGRect(x: 50, y: 75, width: 200, height: 21)
             view.addSubview(label)

             //テキストフィールド
             let textField = UITextField()
             textField.frame = CGRect(x: 50, y: 150, width: 200, height: 21)
             textField.placeholder = "入力してください"
             view.addSubview(textField)

             //textFieldのテキスト文字数を数えてLabelのテキストへ反映
             textField.rx.text.map{text -> String? in
                 guard let text = text else { return nil}
                 return "\(text)(\(text.count)文字)"
             }
             .bind(to: label.rx.text)
             .disposed(by: disposeBag)

        // Do any additional setup after loading the view.
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
