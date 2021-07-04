//
//  MemoCollectionViewController.swift
//  NetworkingPractice
//
//  Created by 손대홍 on 2021/07/04.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage


class MemoCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var memos: [JSON] = []
    var selectedMemo: JSON!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        AF.request("http://spartacodingclub.shop/post").responseJSON { (response) in
            if let value = response.value {
                let json = JSON(value)
                let memos = json["articles"].arrayValue
                self.memos = memos
                print(self.memos)
                self.collectionView.reloadData()
            }
        }
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoDetailVC" {
            if let vc = segue.destination as? MemoDetailViewController {
                vc.memo = self.selectedMemo
            }
        }
    }
    

    // MARK: UICollectionViewDataSource



    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemoCell", for: indexPath)
    
        let memo = memos[indexPath.row]
        // Configure the cell
        if let memoCell = cell as? MemoCell{
            memoCell.imageView.sd_setImage(with: URL(string: memo["image"].stringValue), completed: nil)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 3
        let height = width
        return CGSize(width: width, height: height)
    }

    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let memo = self.memos[indexPath.item]
        self.selectedMemo = memo
        self.performSegue(withIdentifier: "gotoDetailVC", sender: self)
    }

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
