// ImageRecipesDataManager.swift
// Copyright © RoadMap. All rights reserved.

import CoreData
import UIKit

final class ImageRecipesDataManager: NSObject {
    static let shared = ImageRecipesDataManager()
    override private init() {}

    private var appDelegate: AppDelegate {
        UIApplication.shared.delegate as? AppDelegate ?? AppDelegate()
    }

    private var context: NSManagedObjectContext {
        appDelegate.persistentContainer.viewContext
    }

    func creatImage(_ image: String) {
        guard let imageEntityDescription = NSEntityDescription.entity(forEntityName: "Photos", in: context)
        else { return }
        let newImage = Photos(entity: imageEntityDescription, insertInto: context)
        newImage.image = image

        appDelegate.saveContext()
    }

    func fetchPhotos() -> [Photos]? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Photos")
        do {
            return (try? context.fetch(fetchRequest) as [Photos]) ?? []
        }
    }

    func fetchPhoto(_ image: String) -> Photos? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Photos")
        do {
            guard let photos = try? context.fetch(fetchRequest) as? [Photos] else { return nil }
            return photos.first(where: { $0.image == image })
        }
    }
}
