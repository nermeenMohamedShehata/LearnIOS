//
//  DropImageViewController.swift
//  LearnIOS
//
//  Created by Nermeen Mohamed on 3/28/19.
//  Copyright © 2019 Nermeen Mohamed. All rights reserved.
//

import UIKit

@available(iOS 11.0, *)
class DropImageViewController: UIViewController, UIDropInteractionDelegate, UIDragInteractionDelegate {
    
    func dragInteraction(_ interaction: UIDragInteraction, itemsForBeginning session: UIDragSession) -> [UIDragItem] {
        let touchedPoint = session.location(in: self.view)
        if let touchedImageView = self.view.hitTest(touchedPoint, with: nil) as? UIImageView {
            
            let touchedImage = touchedImageView.image
            
            let itemProvider = NSItemProvider(object: touchedImage!)
            let dragItem = UIDragItem(itemProvider: itemProvider)
            dragItem.localObject = touchedImageView
            return [dragItem]
        }
        
        return []
    }
    
    func dragInteraction(_ interaction: UIDragInteraction, willAnimateLiftWith animator: UIDragAnimating, session: UIDragSession) {
        animator.addCompletion { (position) in
            if position == .end {
                session.items.forEach { (dragItem) in
                    if let touchedImageView = dragItem.localObject as? UIView {
                        touchedImageView.removeFromSuperview()
                    }
                }
            }
        }
    }
    
    func dragInteraction(_ interaction: UIDragInteraction, previewForLifting item: UIDragItem, session: UIDragSession) -> UITargetedDragPreview? {
        return UITargetedDragPreview(view: item.localObject as! UIView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Drop & Drag View Controller"
        let rbtn = UIBarButtonItem(title: "Share", style: .plain, target: self, action: #selector(handleShare))
        navigationItem.rightBarButtonItem = rbtn
        
        let lbtn = UIBarButtonItem(title: "Clear", style: .plain, target: self, action: #selector(handleClear))
        navigationItem.leftBarButtonItem = lbtn
        view.addInteraction(UIDropInteraction(delegate: self))
        view.addInteraction(UIDragInteraction(delegate: self))
    }
    @objc func handleShare(){
        
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else {return}
        let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        activityController.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(activityController, animated: true, completion: nil)
    }
    @objc func handleClear(){
        
    }
    func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
        for dragItem in session.items {
            dragItem.itemProvider.loadObject(ofClass: UIImage.self, completionHandler: { (obj, err) in
                
                if let err = err {
                    print("Failed to load our dragged item:", err)
                    return
                }
                
                guard let draggedImage = obj as? UIImage else { return }
                
                DispatchQueue.main.async {
                    let imageView = UIImageView(image: draggedImage)
                    imageView.isUserInteractionEnabled = true
                    self.view.addSubview(imageView)
                    imageView.frame = CGRect(x: 0, y: 0, width: draggedImage.size.width, height: draggedImage.size.height)
                    imageView.layer.backgroundColor = UIColor.black.cgColor
                    imageView.layer.borderWidth = 4
                    imageView.layer.shadowOpacity = 0.3
                    imageView.layer.shadowRadius = 5
                    
                    let centerPoint = session.location(in: self.view)
                    imageView.center = centerPoint
                }
                
            })
        }
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropSession) -> UIDropProposal {
        return UIDropProposal(operation: .copy)
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, canHandle session: UIDropSession) -> Bool {
        return session.canLoadObjects(ofClass: UIImage.self)
    }
    
}

