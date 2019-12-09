//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 又吉日菜子 on 2019/12/06.
//  Copyright © 2019 hinako.tamanaha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //表示している画像の番号
    var dispImageNo = 0
    //ボタン文字確認用
    var btntitle:String = ""
    // タイマー
    var timer: Timer!
    // タイマー用の時間のための変数
    //var timer_sec: Float = 0
    //画像配列
    let imageNameArray = ["stamp_g01","stamp_g02","stamp_g03","stamp_g04","stamp_g05"]
    
    @IBOutlet weak var ImageView: UIImageView!
    
    @IBOutlet weak var Onoutbtn: UIButton!
    @IBOutlet weak var Nextbtn: UIButton!
    @IBOutlet weak var Backbtn: UIButton!
    

    @IBAction func TapAction(_ sender: Any) {
        
    }
    @IBAction func Onouto(_ sender: Any) {
        //ボタンのtitle取得
        btntitle = Onoutbtn.currentTitle!
        if btntitle == "再生"{
            //ボタンのtitle変更
            Onoutbtn.setTitle("停止", for: .normal)
            //進む、戻るボタン使用不可
            Nextbtn.isEnabled = false
            Backbtn.isEnabled = false
            
            if self.timer == nil {
                self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            }
            
        }else{
            //ボタン変更
            Onoutbtn.setTitle("再生", for: .normal)
            //進む、戻るボタン使用可
            Nextbtn.isEnabled = true
            Backbtn.isEnabled = true
            //タイマー停止
            if self.timer != nil {
                self.timer.invalidate()   // タイマーを停止する
                self.timer = nil          // startTimer() の self.timer == nil で判断するために、 self.timer = nil としておく
            }
        }
        
        
    }
    @IBAction func OnBack(_ sender: Any) {
        // 表示している画像の番号を1減らす
        dispImageNo -= 1
        // 画像番号が0になった場合リセット
        if dispImageNo == -1{
            dispImageNo = 4
        }
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }


    @IBAction func OnNext(_ sender: Any) {
        // 表示している画像の番号を1増やす
        dispImageNo += 1
        // 画像番号が5になった場合リセット
        if dispImageNo == 5{
            dispImageNo = 0
        }
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }

    //　画像の変更用
  func displayImage(){
        
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]

        // 画像を読み込み
        let image = UIImage(named: name)

        // Image Viewに読み込んだ画像をセット
        ImageView.image = image
    }
    
    @objc func updateTimer(_ timer: Timer) {
        // 表示している画像の番号を1増やす
        dispImageNo += 1
        // 画像番号が5になった場合リセット
        if dispImageNo == 5{
            dispImageNo = 0
        }
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        displayImage()
 
    }
    //画面にデータを渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        // segueから遷移先のResultViewControllerを取得
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
            // 遷移先に値を代入して渡す
        let No:Int = dispImageNo
            resultViewController.No = No
            
    }
    //戻る処理
    @IBAction func unwind(_ segue:UIStoryboardSegue){
        
    }
}


