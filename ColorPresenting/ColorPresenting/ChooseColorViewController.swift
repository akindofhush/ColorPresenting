//
//  ChooserColorViewController.swift
//  ColorPresenting
//
//  Created by Tzu-Yen Huang on 2020/3/22.
//  Copyright © 2020 Tzu-Yen Huang. All rights reserved.
//

import UIKit

class ChooseColorViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    var colorObjects: [ColorObject]? {
        didSet {
            colorCollectionView.reloadData()
        }
    }
    
    @IBOutlet var colorCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        colorCollectionView.delegate = self
        colorCollectionView.dataSource = self
        let screenWidth: CGFloat = UIScreen.main.bounds.size.width
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: screenWidth/4.0, height: screenWidth/4.0)
        layout.minimumLineSpacing = CGFloat(integerLiteral: 0)
        layout.minimumInteritemSpacing = CGFloat(integerLiteral: 0)
        colorCollectionView.setCollectionViewLayout(layout, animated: false)
        self.getJSONData()
    }
    
    func getJSONData() {
        let address = "https://jsonplaceholder.typicode.com/photos"
        if let url = URL(string: address) {
            // GET
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                } else if let response = response as? HTTPURLResponse,let data = data {
                    print("Status code: \(response.statusCode)")
                    let decoder = JSONDecoder()
                    
                    if let colorObjects = try? decoder.decode([ColorObject].self, from: data) {
                        DispatchQueue.main.async{
                            self.colorObjects = colorObjects
                        }
                    }
                }
                }.resume()
        } else {
            print("Invalid URL.")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colorObjects?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ColorCell
        cell.id.text = String(colorObjects?[indexPath.row].id ?? 1)
         cell.title.text = colorObjects?[indexPath.row].title
        
        let url = colorObjects?[indexPath.row].thumbnailUrl
        if let data = try? Data(contentsOf: url ?? URL(string: "https://via.placeholder.com/150/92c952")!) {
            cell.imageView.image = UIImage(data: data)
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue" {
            (segue.destination as! ColorPresentingViewController).cell = (sender as! ColorCell)
        }
    }
}

