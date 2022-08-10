//
//  VCExtension.swift
//  
//
//  Created by Atul Prakash on 08/08/22.
//

import Foundation
import UIKit

public enum AppStoryboard: String {
    case main = "ListViewPackage"

    var instance: UIStoryboard {
        return UIStoryboard(name: rawValue, bundle: Bundle.module)
    }
    
    func viewController<T: UIViewController>(viewControllerClass: T.Type) -> T? {
        let storyboardID = viewControllerClass.storyboardID
        return instance.instantiateViewController(withIdentifier: storyboardID) as? T
    }
}

extension UIViewController {
    public static func instantiate(fromStoryboard storyboard: AppStoryboard) -> Self? {
        return storyboard.viewController(viewControllerClass: self) ?? nil
    }
    
    class var storyboardID: String {
        return "\(self)"
    }
}

extension UIView {
    static var className: String {
        return String(describing: self)
    }
}
