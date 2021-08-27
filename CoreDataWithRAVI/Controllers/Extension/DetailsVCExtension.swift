//
//  DetailsVCExtension.swift
//  CoreDataWithRAVI
//
//  Created by puneet pal on 26/08/21.
//

import Foundation
import UIKit

extension DetailVC : UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let img = info[.originalImage] as? UIImage
        self.imgProfilePicture.image = img

        dismiss(animated: true, completion: nil)
    }
}
