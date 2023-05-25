//
//  ESTFloatingTextField.swift
//  ESTFloatingTextField
//
//  Created by Rahul Kumawat on 07/12/21.
//

import Foundation
import UIKit

// movemment/distance of placeholder label
enum floatingLabelMovement: CGFloat {
    case minDistance = 25
    case maxDistance = 30
}

// floating placeholder label size
enum floatingLabelSize: CGFloat {
    case normal = 14
    case small = 10
}

enum actionType {
    case onTextFocusStart
    case onTextFocusEnd
    case onTextChange
}

@IBDesignable public class ESTFloatingTextField: UITextField {
    
    private var placeholderView = UIView()
    private var placeholderLabel = UILabel()
    private var isFocusTextField: Bool = false
    private var placeHolderValue: String = ""
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.placeHolderValue = super.placeholder ?? ""
        Initializer()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.placeHolderValue = super.placeholder ?? ""
        Initializer()
    }
    
    
    // MARK: CUSTOM FLOATING TEXTFIELD DESIGN - START
    
    // load custom text-field
    private func Initializer() {
        self.clipsToBounds = false
        if self.materialPlaceholderEnable {
            self.MaterialPlaceHolderEnable(materialPlaceholderEnable: true)
            self.addTarget(self, action: #selector(ESTFloatingTextField.onFocusBegin), for: .editingDidBegin)
            self.addTarget(self, action: #selector(ESTFloatingTextField.onFocusEnd), for: .editingDidEnd)
            self.addTarget(self, action: #selector(ESTFloatingTextField.textFieldDidChange), for: .editingChanged)
        }
    }
    
    
    
    // custom placeholder label
    private func MaterialPlaceHolderEnable(materialPlaceholderEnable: Bool) {
        self.materialPlaceholderEnable = materialPlaceholderEnable
        self.placeholderLabel = UILabel()
        self.placeholderLabel.frame = CGRect(x: self.paddingValue, y : 0, width : 0, height : self.frame.size.height)
        self.placeholderLabel.font = UIFont.systemFont(ofSize: self.font!.pointSize)
        self.placeholderLabel.alpha = 1
        self.placeholderLabel.clipsToBounds = true
        self.placeholderLabel.text = self.placeHolderValue
        self.placeholderLabel.font = self.placeholderLabel.font.regular()
        self.layer.borderColor = self.borderColor?.cgColor
        self.addSubview(self.placeholderLabel)
    }
    
    // MARK: CUSTOM FLOATING TEXTFIELD DESIGN - START
    
    
    // MARK: CALLING CUSTOM FLOATING TEXTFIELD - START
    
    // on foucs textfield
    @objc private func onFocusBegin() {
        self.floatingAnimation(action: .onTextFocusStart)
//        if self.materialPlaceholderEnable {
//            if self.floatingOnFocus {
//                self.placeholderLabel.alpha = 1
//                self.placeholderLabel.text = super.placeholder
//                self.placeholder = nil
//                self.isFocusTextField = true
//                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
//                    self.placeholderLabel.frame = CGRect(x : 0, y : -self.movement, width : self.frame.size.width, height : self.frame.size.height)
//                    // animation property
//                    self.placeholderLabel.font = self.placeholderLabel.font.withSize(self.labelSize)
//                    self.placeholderLabel.font = self.placeholderLabel.font.bold()
//                    self.placeholderLabel.textColor = self.primaryColor!
//                    self.layer.borderColor = self.primaryColor!.cgColor
//                } completion: { _ in
//                    //
//                }
//            }
//        }
    }
    
    // on loss foucs textfield
    @objc private func onFocusEnd() {
        self.floatingAnimation(action: .onTextFocusEnd)
//        if self.materialPlaceholderEnable {
//            if self.floatingOnFocus {
//                self.isFocusTextField = false
//                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
//                    self.placeholderLabel.frame = CGRect(x: 10, y : 0, width : self.frame.size.width, height : self.frame.size.height)
//                    // animation property
//                    self.placeholderLabel.font = self.placeholderLabel.font.withSize(self.labelSize)
//                    self.placeholderLabel.font = self.placeholderLabel.font.regular()
//                    self.placeholderLabel.textColor = self.primaryColor!
//                    self.layer.borderColor = self.borderColor!.cgColor
//                } completion: { _ in
//                    self.placeholderLabel.alpha = 0
//                    super.placeholder = self.placeholderLabel.text
//                }
//            }
//        }
        self.layer.borderColor = self.borderColor?.cgColor
        self.placeholderLabel.textColor = self.primaryColor
    }
    
    // on did tap keyboard
    @objc private func textFieldDidChange() {
        self.floatingAnimation(action: .onTextChange)
        if (self.text == nil) || (self.text?.count)! <= 0 {
            self.placeholderLabel.textColor = self.primaryColor!
            self.layer.borderColor = self.primaryColor!.cgColor
        }
        else {
            self.placeholderLabel.textColor = self.secondaryColor!
            self.layer.borderColor = self.secondaryColor!.cgColor
        }
//        if self.materialPlaceholderEnable {
//            if self.floatingOnFocus {
////                self.placeholderVisible()
//                self.floatingLabelUI()
//            }
//            else{
//                if (self.text == nil) || (self.text?.count)! > 0 {
//                    self.placeholderVisible()
//                }
//                self.floatingLabelUI()
//            }
//        }
    }
    
    // MARK: CALLING CUSTOM FLOATING TEXTFIELD - END
    
    
    // MARK: CUSTOM FLOATING TEXTFIELD ANIMATION - START
    
    // placeholder label visibility
    private func placeholderVisible() {
        self.placeholderLabel.textColor = primaryColor!
        self.placeholderLabel.alpha = 1
        self.attributedPlaceholder = nil
        self.placeholderLabel.frame.origin.x = 0
    }
    
    // placeholder label floating UI-Animation
    private func floatingLabelUI() {
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {() -> Void in
            // while animation
            self.propertyAttribute()
        }, completion: { _ in
            // after animation
            if(self.text == nil || (self.text?.count)! <= 0) {
                
            }
            else {
                
            }
        })
    }
    
    // floating textfield animation property
    private func propertyAttribute() {
        if self.floatingOnFocus {
            if self.isFocusTextField {
                self.animationStart()
            }
            else{
                if (self.text == nil) || (self.text?.count)! <= 0 {
                    self.animationEnd()
                }
            }
        }
        else {
            // empty text field
            if (self.text == nil) || (self.text?.count)! <= 0 {
                self.animationEnd()
            }
            // non-empty text field
            else {
                self.animationStart()
            }
        }
    }
    
    // pop-up animation
    func animationStart() {
        self.placeholderLabel.frame = CGRect(x : self.placeholderLabel.frame.origin.x, y : -self.movement, width : self.frame.size.width, height : self.frame.size.height)
        // animation property
        self.placeholderLabel.font = self.placeholderLabel.font.withSize(self.labelSize)
        self.placeholderLabel.font = self.placeholderLabel.font.bold()
        self.placeholderLabel.textColor = self.primaryColor!
        self.layer.borderColor = self.primaryColor!.cgColor
    }
    
    // pop-down animation
    func animationEnd() {
        self.placeholderLabel.frame = CGRect(x: self.placeholderLabel.frame.origin.x+10, y : 0, width :self.frame.size.width, height : self.frame.size.height)
        // animation property
        self.placeholderLabel.font = self.placeholderLabel.font.withSize(self.font!.pointSize)
        self.placeholderLabel.font = self.placeholderLabel.font.regular()
        self.placeholderLabel.textColor = self.secondaryColor!
        self.layer.borderColor = self.secondaryColor!.cgColor
    }

    func floatingAnimation(action: actionType) {
        switch(action) {
        case .onTextFocusStart:
            if self.materialPlaceholderEnable {
                if self.floatingOnFocus {
                    if (self.text == nil) || (self.text?.count)! <= 0 {
                        self.placeholderLabel.frame = CGRect(x: self.advanceAnimation == true ? self.paddingValue : 0, y : self.advanceAnimation == true ? 0 : -20, width : self.frame.size.width, height : self.frame.size.height)
                        self.placeholderLabel.text = self.placeHolderValue
                        self.placeholder = nil
                        self.placeholderLabel.alpha = 1
                        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
                            self.placeholderLabel.frame = CGRect(x : 0, y : -self.movement, width : self.frame.size.width, height : self.frame.size.height)
                            // animation property
                            self.placeholderLabel.font = self.placeholderLabel.font.withSize(self.labelSize)
                            self.placeholderLabel.font = self.placeholderLabel.font.bold()
                            self.placeholderLabel.textColor = self.primaryColor!
                            self.layer.borderColor = self.primaryColor!.cgColor
                        } completion: { _ in
                            //
                        }
                    }
                }
            }
            if (self.text == nil) || (self.text?.count)! <= 0 {
                self.placeholderLabel.textColor = self.primaryColor!
                self.layer.borderColor = self.primaryColor!.cgColor
            }
            break
        case .onTextFocusEnd:
            if self.materialPlaceholderEnable {
                if self.floatingOnFocus {
                    if (self.text == nil) || (self.text?.count)! <= 0 {
                        if !self.advanceAnimation {
                            self.placeholderLabel.alpha = 0
                            super.placeholder = self.placeHolderValue
                        }
                        else {
                            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
                                self.placeholderLabel.frame = CGRect(x: self.advanceAnimation == true ? self.paddingValue : 0, y : self.advanceAnimation == true ? 0 : -20, width : self.frame.size.width, height : self.frame.size.height)
                                // animation property
                                self.placeholderLabel.font = self.placeholderLabel.font.withSize(self.labelSize)
                                self.placeholderLabel.font = self.placeholderLabel.font.regular()
                                self.placeholderLabel.textColor = self.primaryColor!
                                self.layer.borderColor = self.borderColor!.cgColor
                            } completion: { _ in
                                self.placeholderLabel.alpha = 0
                                super.placeholder = self.placeHolderValue
                            }
                        }
                    }
                }
            }
            break
        case .onTextChange:
            if self.materialPlaceholderEnable {
                if !self.floatingOnFocus {
                    if (self.text == nil) || (self.text?.count)! <= 0 {
                        // end animation
                        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
                            self.placeholderLabel.frame = CGRect(x: self.advanceAnimation == true ? self.paddingValue : 0, y : self.advanceAnimation == true ? 0 : -20, width : self.frame.size.width, height : self.frame.size.height)
                            // animation property
                            self.placeholderLabel.font = self.placeholderLabel.font.withSize(self.labelSize)
                            self.placeholderLabel.font = self.placeholderLabel.font.regular()
                            self.placeholderLabel.textColor = self.primaryColor!
                            self.layer.borderColor = self.borderColor!.cgColor
                        } completion: { _ in
                            self.placeholderLabel.alpha = 0
                            super.placeholder = self.placeHolderValue
                            self.isFocusTextField = false
                        }
                    }
                    else {
                        // start animation
                        if !self.isFocusTextField {
                            self.isFocusTextField = true
                            self.placeholderLabel.frame = CGRect(x: self.advanceAnimation == true ? self.paddingValue : 0, y : self.advanceAnimation == true ? 0 : -20, width : self.frame.size.width, height : self.frame.size.height)
                            self.placeholderLabel.text = self.placeHolderValue
                            self.placeholder = nil
                            self.placeholderLabel.alpha = 1
                            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
                                self.placeholderLabel.frame = CGRect(x : 0, y : -self.movement, width : self.frame.size.width, height : self.frame.size.height)
                                // animation property
                                self.placeholderLabel.font = self.placeholderLabel.font.withSize(self.labelSize)
                                self.placeholderLabel.font = self.placeholderLabel.font.bold()
                                self.placeholderLabel.textColor = self.primaryColor!
                                self.layer.borderColor = self.primaryColor!.cgColor
                                
                            } completion: { _ in
                                //
                            }
                        }
                    }
                }
            }
            break
        }
    }
    
    func a(test: actionType){
        print("actionType: ",test)
    }
    // MARK: CUSTOM FLOATING TEXTFIELD ANIMATION - END
    
    
    // MARK: CUSTOM FLOATING TEXTFIELD ACCESSIBLE PROPERTY - START

    @IBInspectable var materialPlaceholderEnable : Bool = true
    
    @IBInspectable var floatingOnFocus: Bool = false
//    {
//        didSet {
//            if self.materialPlaceholderEnable {
//                self.floatingOnFocus = true
//            }
//            else {
//                self.floatingOnFocus = false
//            }
//        }
//    }
    
    @IBInspectable var advanceAnimation: Bool = true
//    {
//        didSet {
//            if self.materialPlaceholderEnable {
//                self.advanceAnimation = true
//            }
//            else {
//                self.advanceAnimation = false
//            }
//        }
//    }
    
    // theme primary color
    @IBInspectable var primaryColor: UIColor? = UIColor.lightGray {
        didSet {
            Initializer()
        }
    }

    // theme secondary color
    @IBInspectable var secondaryColor: UIColor? = UIColor.lightGray {
        didSet {
            Initializer()
        }
    }

    // padding value for text/placeholder from left-intent
    @IBInspectable var paddingValue: CGFloat = 10
    
    // textfield border color
    @IBInspectable var borderColor: UIColor? = UIColor.clear {
        didSet {
            layer.borderColor = self.borderColor?.cgColor
        }
    }
    
    // textfield border width
    @IBInspectable var borderWidth: CGFloat = 0.25 {
        didSet {
            layer.borderWidth = self.borderWidth
        }
    }
    
    // textfield corner radius
    @IBInspectable var cornerRadius: CGFloat = 5 {
        didSet {
            layer.cornerRadius = self.cornerRadius
        }
    }
    
    // padding
    var padding: UIEdgeInsets {
        get {
            return UIEdgeInsets(top: 0, left: paddingValue, bottom: 0, right: paddingValue)
        }
    }
    
    // floating placeholder label movement
    var movement: floatingLabelMovement.RawValue = floatingLabelMovement.minDistance.rawValue
    
    // floating placeholder label size
    var labelSize: floatingLabelSize.RawValue = floatingLabelSize.small.rawValue
    
    // MARK: CUSTOM FLOATING TEXTFIELD ACCESSIBLE PROPERTY - END
    
    
    // MARK: OVERIDE METHODS - START

    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    public override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    public override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = self.cornerRadius
        self.layer.borderWidth = self.borderWidth
        self.layer.borderColor = self.borderColor?.cgColor
        self.layer.masksToBounds = false
    }
    
    // MARK: OVERIDE METHODS - START
    
}


// MARK: EXTENSION - START

// UIFont
extension UIFont {

    func withTraits(traits:UIFontDescriptor.SymbolicTraits...) -> UIFont {
        let descriptor = self.fontDescriptor
            .withSymbolicTraits(UIFontDescriptor.SymbolicTraits(traits))
        return UIFont(descriptor: descriptor!, size: 0)
    }

    func bold() -> UIFont {
        return withTraits(traits: .traitBold)
    }

    func regular() -> UIFont {
        return withTraits(traits: .traitUIOptimized)
    }

}

// MARK: EXTENSIONS - END
