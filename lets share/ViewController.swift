//
//  ViewController.swift
//  lets share
//
//  Created by Fahad Abunayyan on 4/14/18.
//  Copyright © 2018 Fahad Abunayyan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    func textToImage(drawText: NSString, inImage: UIImage, atPoint:CGPoint)->UIImage{
        
        // Setup the font specific variables
        let textColor: UIColor = UIColor.white
        let textFont: UIFont = UIFont(name: "Helvetica Bold", size: 42)!
        
        //Setup the image context using the passed image.
        UIGraphicsBeginImageContext(inImage.size)
        
        //Setups up the font attributes that will be later used to dictate how the text should be drawn
        let textFontAttributes = [
            kCTFontAttributeName: textFont,
            kCTForegroundColorAttributeName: textColor,
            ]
        
        //Put the image into a rectangle as large as the original image.
        inImage.draw(in: CGRect(x: 0, y: 0, width: inImage.size.width, height: inImage.size.height))
        
        
        // Creating a point within the space that is as bit as the image.
        let rect: CGRect = CGRect(x: atPoint.x, y: atPoint.y, width: inImage.size.width, height: inImage.size.height)
        
        //Now Draw the text into an image.
        drawText.draw(in: rect, withAttributes: textFontAttributes as [NSAttributedStringKey : Any])
        
        // Create a new image out of the images we have created
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        // End the context now that we have the image we need
        UIGraphicsEndImageContext()
        
        //And pass it back up to the caller.
        return newImage
        
    }
    
    @IBAction func onShareTapped() {
        let activityController = UIActivityViewController(activityItems: ["test", #imageLiteral(resourceName: "instagram-image-size-vertical-new.png")], applicationActivities: nil)
        present(activityController, animated: true, completion: nil )
    }
    
    @IBAction func onImageTapped() {
        let str2 = String(32)
        let testImage = textToImage(drawText: (("Highest Speed: " + str2 as NSString) as String) + "\nTest: " + str2 as NSString , inImage: UIImage(named:"lets_share.png")!, atPoint: CGPoint(x: 360, y: 550))
        let activityController = UIActivityViewController(activityItems: ["test", testImage], applicationActivities: nil)
        present(activityController, animated: true, completion: nil )
    }
    
    @IBAction func onClearTapped() {
        textField.text = ""
    }
    

}

