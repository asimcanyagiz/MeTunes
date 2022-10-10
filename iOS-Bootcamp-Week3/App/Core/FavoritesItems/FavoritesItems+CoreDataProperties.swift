//
//  FavoritesItems+CoreDataProperties.swift
//  iOS-Bootcamp-Week3
//
//  Created by Asım can Yağız on 10.10.2022.
//
//

import Foundation
import CoreData


extension FavoritesItems {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoritesItems> {
        return NSFetchRequest<FavoritesItems>(entityName: "FavoritesItems")
    }

    @NSManaged public var artist: String?
    @NSManaged public var track: String?
    @NSManaged public var country: String?
    @NSManaged public var date: String?

}

extension FavoritesItems : Identifiable {

}
