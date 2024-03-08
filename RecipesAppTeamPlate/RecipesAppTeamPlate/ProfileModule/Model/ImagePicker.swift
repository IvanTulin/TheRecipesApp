// ImagePicker.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран выбора изображения
final class ImagePicker: NSObject {
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
            picker.dismiss(animated: true)
        }
    }
}

// MARK: - ImagePicker + UIImagePickerControllerDelegate

extension ImagePicker: UIImagePickerControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}
