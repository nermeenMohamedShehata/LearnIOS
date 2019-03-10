//
//  CaursolVC.swift
//  LearnIOS
//
//  Created by Nermeen Mohamed on 3/9/19.
//  Copyright © 2019 Nermeen Mohamed. All rights reserved.
//

import UIKit

class ProjectPageViewController : UIPageViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
class CaursolVC: UIViewController {

    let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .blue
        return imageView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupLayoutUI()
    }
    func setupViews(){
        self.view.addSubview(imageView)
    }
    func setupLayoutUI(){
      setupViews()
        setupImageViewConstraints()
    }
    func setupImageViewConstraints(){
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            imageView.heightAnchor.constraint(equalTo: self.view.heightAnchor),
            imageView.topAnchor.constraint(equalTo: self.view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
            ])
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
