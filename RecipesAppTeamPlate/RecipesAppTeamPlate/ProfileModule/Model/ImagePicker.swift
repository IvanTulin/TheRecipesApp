// ImagePicker.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран выбора изображения
final class ImagePicker: NSObject {
    // MARK: - Constants

    enum Constants {
        static let savedImageKey = "savedImageKey"
    }

    let userImageCaretaker = UserImageCaretaker()

    // MARK: - Private Properties

    private var imagePickerController = UIImagePickerController()
    private var complition: ((UIImage) -> ())?

    // MARK: - Public Methods

    func showImagePicker(in viewController: UIViewController, complition: ((UIImage) -> ())?) {
        self.complition = complition
        imagePickerController.delegate = self
        viewController.present(imagePickerController, animated: true)
    }
}

// MARK: - ImagePicker + UINavigationControllerDelegate

extension ImagePicker: UINavigationControllerDelegate {
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]
    ) {
        if let image = info[.originalImage] as? UIImage {
            complition?(image)
            saveImageToUserDefaults(image: image)
            picker.dismiss(animated: true)
        }
    }

    /// Сохраняем выбранное фото из галереи в ProfileServiceMemento
    func saveImageToUserDefaults(image: UIImage) {
        if let imageData = image.jpegData(compressionQuality: 1.0) {
            DispatchQueue.global(qos: .userInitiated).async {
                self.userImageCaretaker.originator.image = imageData
                self.userImageCaretaker.saveState()
//                UserDefaults.standard.set(imageData, forKey: Constants.savedImageKey)
//                UserDefaults.standard.synchronize()
            }
        }
    }
}

// MARK: - ImagePicker + UIImagePickerControllerDelegate

extension ImagePicker: UIImagePickerControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}
