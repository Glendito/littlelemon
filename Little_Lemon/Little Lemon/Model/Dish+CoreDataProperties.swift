//
//  Dish+CoreDataProperties.swift
//  Little Lemon
//
//  Created by Glendito Jeremiah Palendeng on 29/03/24.
//
//

import Foundation
import CoreData


extension Dish {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dish> {
        return NSFetchRequest<Dish>(entityName: "Dish")
    }

    @NSManaged public var category: String?
    @NSManaged public var image: String?
    @NSManaged public var price: String?
    @NSManaged public var title: String?
    @NSManaged public var descriptionDish: String?

}

extension Dish : Identifiable {

}
