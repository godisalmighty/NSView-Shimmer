//
//  NSView-Shimmer.swift
//
//
//  Created by workingmind on 1/11/24.
//

import Foundation
import AppKit

extension NSView {
    
    public func startShimmering()
    {
        let light: Any = (NSColor.init(white: 0, alpha: 0.1).cgColor)
        let dark: Any = (NSColor.black.cgColor)
        
        var gradient : CAGradientLayer = CAGradientLayer()
        gradient.colors = [dark, light, dark]
        gradient.frame = CGRectMake(-self.bounds.size.width, 0, 3*self.bounds.size.width, self.bounds.size.height)
        gradient.startPoint = CGPointMake(0.0, 0.5)
        gradient.endPoint   = CGPointMake(1.0, 0.525) // slightly slanted forward
        gradient.locations  = [0.4, 0.5, 0.6]
        self.layer?.mask = gradient
        
        var animation : CABasicAnimation = CABasicAnimation.init(keyPath: "locations")
        animation.fromValue = [0.0, 0.1, 0.2]
        animation.toValue = [0.8, 0.9, 1.0]
        animation.duration = 1.0
        animation.repeatCount = .infinity

        gradient.add(animation, forKey: "shimmer")
        
        
    }
    
    func stopShimmering()
    {
        self.layer?.mask = nil;
    }
    
    //Objective-C version For MacOS
//    - (void)startShimmering
//    {
//        id light = (id)[NSColor colorWithWhite:0 alpha:0.1].CGColor;
//        id dark  = (id)[NSColor blackColor].CGColor;
//
//        CAGradientLayer *gradient = [CAGradientLayer layer];
//        gradient.colors = @[dark, light, dark];
//        gradient.frame = CGRectMake(-self.bounds.size.width, 0, 3*self.bounds.size.width, self.bounds.size.height);
//        gradient.startPoint = CGPointMake(0.0, 0.5);
//        gradient.endPoint   = CGPointMake(1.0, 0.525); // slightly slanted forward
//        gradient.locations  = @[@0.4, @0.5, @0.6];
//        self.layer.mask = gradient;
//
//        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"locations"];
//        animation.fromValue = @[@0.0, @0.1, @0.2];
//        animation.toValue   = @[@0.8, @0.9, @1.0];
//
//        animation.duration = 1.5;
//        animation.repeatCount = HUGE_VALF;
//        [gradient addAnimation:animation forKey:@"shimmer"];
//    }

    
    
    
}
