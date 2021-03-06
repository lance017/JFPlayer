//  JFBrightnessView.swift
//  JFPlayerDemo
//
//  Created by jumpingfrog0 on 14/12/2016.
//
//
//  Copyright (c) 2016 Jumpingfrog0 LLC
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit

extension UIApplication {
    
    func jf_usesViewControllerBasedStatusBarAppearance() -> Bool {
        let key = "UIViewControllerBasedStatusBarAppearance"
        guard  let object = Bundle.main.object(forInfoDictionaryKey: key) else {
            return true
        }
        
        return (object as! Bool)
    }
    
    func jf_updateStatusBarAppearanceHidden(_ hidden: Bool, animation: UIStatusBarAnimation, fromViewController sender: UIViewController) {
        
        if jf_usesViewControllerBasedStatusBarAppearance() {
            sender.setNeedsStatusBarAppearanceUpdate()
        } else {
            if #available(iOS 9, *) {
                
                debugPrint("setStatusBarHidden:withAnimation: is deprecated. Please use view-controller-based status bar appearance.")
                
            } else {
                UIApplication.shared.setStatusBarHidden(hidden, with: animation)
            }

        }
    }
}
