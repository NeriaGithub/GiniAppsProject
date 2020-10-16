//
//  ViewController.swift
//  GiniAppsProject
//
//  Created by Neria Jerafi on 15/10/2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewConfig()
        apiCall()
        
    }
    
    func collectionViewConfig() {
        let smallNib = UINib(nibName: "SmallCollectionViewCell", bundle: nil)
        collectionView.register(smallNib, forCellWithReuseIdentifier: "SmallCollectionViewCell")
        let bigNib = UINib(nibName: "BigCollectionViewCell", bundle: nil)
        collectionView.register(bigNib, forCellWithReuseIdentifier: "BigCollectionViewCell")
        collectionView.dataSource = self
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout{
            let width = (UIScreen.main.bounds.size.width * 0.333)  - 20
            flowLayout.estimatedItemSize = CGSize(width: width, height: 200)
        }
    }
    
    
    func apiCall() {
        ServerManager.shared.getRequest(stringUrl: Constants.urlString) { [weak self](result:Result<Numbers,ApiError>) in
            guard let strongSelf = self else { return  }
            switch result {
            case .success(let numbers):
                print(numbers.numbers[0])
                DataManager.shared.numbers = numbers
                DataManager.shared.findNumbers()
                strongSelf.collectionView.reloadData()
            case .failure(_):
                print("Error")
            }
        }
    }
}




extension ViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = DataManager.shared.numbers?.numbers.count {
            return count
        }
        else{
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SmallCollectionViewCell", for: indexPath) as! SmallCollectionViewCell
        if DataManager.shared.uniqueNumbers.contains((DataManager.shared.numbers!.numbers[indexPath.row].number))
 {
            cell.configCell(number: DataManager.shared.numbers!.numbers[indexPath.row], labelHeight: 100, backgroundColor: .systemRed)
        }
        else {
            cell.configCell(number: DataManager.shared.numbers!.numbers[indexPath.row])
        }
        
        return cell
        
    }
}


