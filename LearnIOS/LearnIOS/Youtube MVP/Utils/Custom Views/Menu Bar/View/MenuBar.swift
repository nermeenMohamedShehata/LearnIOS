//
//  MenuBar.swift
//  LearnIOS
//
//  Created by Nermeen Mohamed on 3/16/19.
//  Copyright © 2019 Nermeen Mohamed. All rights reserved.
//

import UIKit
//protocol UsersView:class{
//    var presenter : UsersVCPresenter? {get set}
//    func showIndicator()
//    func hideIndicator()
//    func fetchingDataSuccess()
//    func showError(error:String)
//}
//protocol UserCellView {
//    func displayName(name: String)
//    func displayEmail(email: String)
//    func displayAddress(address: String)
//}

protocol MenuBarDelegate : class{
    func didTapHome (_ sender:UIButton) -> Void
    func didTapTrending (_ sender:UIButton) -> Void
    func didTapSubscriptions (_ sender:UITextField) -> Void
    func didTapProfile (_ sender:UIButton) -> Void
}
protocol MenuBarCellDelegate {
    
}
class MenuBar: UIView {

    var homeController : HomeController?
     lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.rgb(red: 230, green: 32, blue: 31)
        
        return cv
    }()
   private lazy var horizontalBarView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(white: 0.95, alpha: 1)
        return view
    }()

    var horizontalBarLeftAnchorConstraint : NSLayoutConstraint?
    
    let menuCellReuseIdentifier = "MenuCellId"
    
    let images = [ R.image.home.name,R.image.trending.name,R.image.subscriptions.name,R.image.switch_account.name]
    override init(frame: CGRect) {
        super.init(frame: frame)
        commitInit()
     }
    private func commitInit(){
        setupLayoutUI()
        setupMenuBarCollectionView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   private func setupViews(){
        addSubview(collectionView)
        addSubview(horizontalBarView)

    }
   private func setupLayoutUI(){
        setupViews()
        setupCollectionViewConstraints()
        setupHorizontalBarViewConstraints()
    }
   private func setupCollectionViewConstraints(){
                addConstraintsWithFormat("H:|[v0]|", views: collectionView)
                addConstraintsWithFormat("V:|[v0]|", views: collectionView)
    }
    private func setupHorizontalBarViewConstraints(){
        NSLayoutConstraint.activate([
            horizontalBarView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            horizontalBarView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/4),
            horizontalBarView.heightAnchor.constraint(equalToConstant: 8),
            ])
        horizontalBarLeftAnchorConstraint = horizontalBarView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0)
        horizontalBarLeftAnchorConstraint?.isActive = true
    }
}
