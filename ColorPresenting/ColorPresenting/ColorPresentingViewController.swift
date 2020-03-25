//
//  ColorPresentingViewController.swift
//  ColorPresenting
//
//  Created by Tzu-Yen Huang on 2020/3/22.
//  Copyright © 2020 Tzu-Yen Huang. All rights reserved.
//

import UIKit

class ColorPresentingViewController: UIViewController {

    @IBOutlet var imageView: UIImageView?
    @IBOutlet var idLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    var cell: ColorCell?
    
    override func viewDidLoad() {
        change()
    }
    func change(){
        if let cellTem = cell{
            imageView?.image = cellTem.imageView.image
            idLabel.text = cellTem.id.text
            titleLabel.text = cellTem.title.text
        }
    }
}
