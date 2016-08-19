//
//  ExtensionTableView.swift
//  SampleProjectSwift
//
//  Created by _Genesis_ on 8/15/16.
//  Copyright © 2016 _Genesis_. All rights reserved.
//

import UIKit


protocol ReusableView {
    
}
extension ReusableView where Self:UIView{
    static var reuseIdentifier:String{
        return String(self)
    }
}

protocol NibLoadableView {
    
}
extension NibLoadableView where Self:UIView{
    static var NibName:String{
        return String(self)
    }
}

extension UITableView{
    
    func register<T:UITableViewCell where T:ReusableView, T:NibLoadableView> (_: T.Type){
        let nib = UINib(nibName: T.NibName, bundle: nil)
        registerNib(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell <T: UITableViewCell where T:ReusableView>(forIndexPath indexPath:NSIndexPath) -> T {
        
        guard let cell = dequeueReusableCellWithIdentifier(T.reuseIdentifier, forIndexPath: indexPath) as? T else{
            fatalError("Could not dequeue table cell with identifier: \(T.reuseIdentifier)")
        }
        
        return cell
        
    }
}

extension UITableViewCell:ReusableView,NibLoadableView{
    
}

extension UICollectionView{
    
    func register<T:UICollectionView where T:ReusableView, T:NibLoadableView> (_: T.Type){
        let nib = UINib(nibName: T.NibName, bundle: nil)
        registerNib(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
        
    }
    
    func dequeueReusableCell <T: UICollectionViewCell where T:ReusableView>(forIndexPath indexPath:NSIndexPath) -> T {
        
        guard let cell = dequeueReusableCellWithReuseIdentifier(T.reuseIdentifier, forIndexPath: indexPath) as? T else{
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        
        return cell
        
    }
}

extension UICollectionViewCell:ReusableView,NibLoadableView{
    
}