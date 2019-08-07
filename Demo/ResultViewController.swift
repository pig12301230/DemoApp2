//
//  ResultViewController.swift
//  Demo
//
//  Created by 莊英祺 on 2019/8/7.
//  Copyright © 2019 Winston. All rights reserved.
//

import UIKit
import Alamofire

class ResultViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var results: [Result] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        //API: https:/ /jsonplaceholder.typicode.com, end point: /photos
        collectionView.register(UINib(nibName: "Cell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        fetch { [weak self] (result, error) in
            guard let self = `self`, result != nil else { return }
            self.results = result!
            self.collectionView.reloadData()
        }
        // Do any additional setup after loading the view.
    }
    
    func fetch(completion: @escaping(_ data: [Result]?, _ error: Error?) -> Void) {
        if let url = URL(string: "https://jsonplaceholder.typicode.com/photos") {
            Alamofire.request(url).responseJSON { (response) in
                switch response.result {
                case .success:
                    if let jsonData = response.data {
                        let jsonDecoder = JSONDecoder()
                        do {
                            let result = try jsonDecoder.decode([Result].self, from: jsonData)
                            completion(result, nil)
                        }catch let error{
                            completion(nil, error)
                        }
                    }
                case .failure(let error):
                    completion(nil, error)
                }
            }
        }
    }
}

extension ResultViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Cell
        cell.idLabel.text = String(results[indexPath.row].id)
        cell.titleLabel.text = results[indexPath.row].title
        cell.thumbnail.download(from: results[indexPath.row].thumbnailUrl, placeholder: nil)
        return cell
    }
}

extension ResultViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let cellWidth = width / 4 // compute your cell width
        return CGSize(width: cellWidth, height: cellWidth * 1.3)
    }
}
