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
    var personal = PersonalViewController()
    
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
        let button = UIButton(frame: CGRect(x: 100,y: 700,width: 200,height: 60))
        button.setTitle("Add to Favorites", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self,action: #selector(buttonAction), for: .touchUpInside)
        button.backgroundColor = .orange
        button.layer.cornerRadius = button.frame.height/2
        self.view.addSubview(button)
        
        
    }
    
    //Button Action when you clicked button its will be active
    @objc
    func buttonAction() {
        
        createItem()
        getAllItems()
        
        do{
            models = try context.fetch(FavoritesItems.fetchRequest())
            DispatchQueue.main.async {
                self.getAllItems()
            }
        }
        catch {
            let e = error
            print(e.localizedDescription)
        }
    }
    
    //MARK: - Core Data
    
    func createItem(){
        let newItem = FavoritesItems(context: context)
        newItem.artist = detailView.artistName
        newItem.track = title
        newItem.country = detailView.country
        newItem.date = detailView.releaseDate
        
        
        let addFavoritesPressed = UIAlertController(title: "Success", message: "Your favorite Podcast added to the Favorites", preferredStyle: UIAlertController.Style.alert)

        addFavoritesPressed.addAction(UIAlertAction(title: "OK", style: .default))
        
        present(addFavoritesPressed, animated: true, completion: nil)
        
        
        getAllItems()
        
        do {
            try context.save()
            getAllItems()
        }
        catch {
            
        }
    }
    func getAllItems () {
        
        do {
            models = try context.fetch(FavoritesItems.fetchRequest())
            DispatchQueue.main.async {
                self.personal.tableView.reloadData()
            }
        }
        catch {
            let e = error
            print(e.localizedDescription)
        }
        
    }
    
    func deleteItem(item: FavoritesItems) {
        context.delete(item)
        
        do {
            try context.save()
            getAllItems()
        }
        catch {
            let e = error
            print(e.localizedDescription)
        }
    }
    
    func updateItem(item: FavoritesItems, newName: String) {
        item.track = newName
        
        do {
            try context.save()
            getAllItems()
        }
        catch {
            
        }
    }
}
