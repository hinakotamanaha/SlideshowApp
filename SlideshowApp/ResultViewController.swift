//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 又吉日菜子 on 2019/12/09.
//  Copyright © 2019 hinako.tamanaha. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var ImageView: UIImageView!
    //画像配列
    let imageNameArray = ["stamp_g01","stamp_g02","stamp_g03","stamp_g04","stamp_g05"]
    
    var No:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        

               // 表示している画像の番号から名前を取り出し
               let name = imageNameArray[No]

               // 画像を読み込み
               let image = UIImage(named: name)

               // Image Viewに読み込んだ画像をセット
               ImageView.image = image

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
