//
//  MusicDetailViewController.swift
//  iOS-Bootcamp-Week3
//
//  Created by Asım can Yağız on 9.10.2022.
//

import UIKit

final class MusicDetailViewController: UIViewController {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    private var models = [FavoritesItems]()
    var personal = PersonalViewController()

    var music: Music? {
        didSet {
            title = music?.trackName
            detailView.imageView.downloadImage(from: music?.artworkLarge)
            detailView.releaseDate = music?.releaseDate
            detailView.artistName = music?.artistName
            detailView.country = music?.country
            detailView.primaryGenreName = music?.primaryGenreName
        }
    }
    
    private let detailView = MusicDetailView()
    
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
        
        getAllItems()
    }
    
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
        
        let addFavoritesPressed = UIAlertController(title: "Success", message: "Your favorite Music added to the Favorites", preferredStyle: UIAlertController.Style.alert)

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
            // error
        }
        
    }
    
    func deleteItem(item: FavoritesItems) {
        context.delete(item)
        
        do {
            try context.save()
            getAllItems()
        }
        catch {
            
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

