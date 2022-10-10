//
//  DetailViewController.swift
//  iOS-Bootcamp-Week3
//
//  Created by Asım can Yağız on 9.10.2022.
//

import UIKit

final class DetailViewController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    private var models = [FavoritesItems]()
    
    var podcast: Podcast? {
        didSet {
            title = podcast?.trackName
            detailView.imageView.downloadImage(from: podcast?.artworkLarge)
            detailView.releaseDate = podcast?.releaseDate
            detailView.artistName = podcast?.artistName
            detailView.country = podcast?.country
            detailView.genres = podcast?.genres?.reduce("") { $1 + ", " + $0 }
        }
    }
    
    private let detailView = DetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = detailView
        
        //MARK: - Button Favorite
        //Button for add datas to core data
        let button = UIButton(frame: CGRect(x: 100,y: 680,width: 200,height: 60))
        button.setTitle("Add to Favorites", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self,action: #selector(buttonAction), for: .touchUpInside)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = button.frame.height/2
        self.view.addSubview(button)
        print(detailView.imageView.downloadImage(from: podcast?.artworkLarge))
    }
    
    @objc
    func buttonAction() {
        print("Button pressed")
    }
    
    //MARK: - Core Data
//    func getAllItems () {
//
//        do {
//            models = try context.fetch(FavoritesItems.fetchRequest())
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//                print(self.models[0].name ?? "empty")
//                print(self.models[1].name ?? "empty")
//                print(self.models[2].name ?? "empty")
//
//            }
//        }
//        catch {
//            // error
//        }
//
//    }
    
    func createItem(name: String){
        let newItem = FavoritesItems(context: context)
        newItem.artist = detailView.artistName
        //newItem.artwork = detailView.imageView
        newItem.country = detailView.country
        
        
        do {
            try context.save()
            //getAllItems()
        }
        catch {
            
        }
    }
    
    func deleteItem(item: FavoritesItems) {
        context.delete(item)
        
        do {
            try context.save()
            //getAllItems()
        }
        catch {
            
        }
    }
    
    func updateItem(item: FavoritesItems, newName: String) {
        item.artist = newName
        
        do {
            try context.save()
            //getAllItems()
        }
        catch {
            
        }
    }
}
