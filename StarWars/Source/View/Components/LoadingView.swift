//
//  LoadingView.swift
//  StarWars
//
//  Created by Diego Francisco Lechado on 16/04/2018.
//  Copyright © 2018 ciandt. All rights reserved.
//

import Foundation
import UIKit
import Lottie

class LoadingView: UIView {
    
    let kWidth = 150
    let kHeight = 150
    let kAnimationName = "lightsaber"
    let kDelayInSeconds = 3.0
    let kFadeTimeInSeconds = 0.2
    var canClose: Bool = false
    var finishedDelay: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func show(view: UIView){
        self.backgroundColor = UIColor.white
        self.alpha = 0
        view.addSubview(self)
        
        let animationView = LOTAnimationView(name: kAnimationName)
        animationView.frame = CGRect(x: 0, y: 0, width: kWidth, height: kHeight)
        animationView.loopAnimation = true
        animationView.center = view.center
        self.addSubview(animationView)
        
        UIView.animate(withDuration: kFadeTimeInSeconds) {
            self.alpha = 1
        }
        
        animationView.animationSpeed = 2
        animationView.play{ (finished) in
        }
        
        let delayTime = DispatchTime.now() + kDelayInSeconds
        DispatchQueue.main.asyncAfter(deadline: delayTime) {
            self.finishedDelay = true
            self.hide()
        }
    }
    
    func close(){
        self.canClose = true
        self.hide()
    }
    
    private func hide(){
        if(self.canClose && self.finishedDelay){
            self.canClose = false
            self.removeFromSuperview()
        }
    }
}
