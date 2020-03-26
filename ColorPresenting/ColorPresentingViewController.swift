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
        setItems()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.navigationController?.view.backgroundColor = UIColor.white
    }
    
    func setItems(){
        if let cellItem = cell{
            imageView?.image = cellItem.imageView.image
            idLabel.text = cellItem.id.text
            titleLabel.text = cellItem.title.text
        }
    }
}
