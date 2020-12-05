//
//  ViewController.swift
//  TimerExample
//
//  Created by Ngo Dang tan on 05/12/2020.
//

import UIKit

class ViewController: UIViewController {
    private let colors: [UIColor] = [
        .systemBlue,
        .systemGreen,
        .systemRed,
        .systemPink,
        .systemOrange,
        .systemYellow
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        createTimer()
    }
    
    func createTimer(){
        var isAnimated = false
        let myView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        view.addSubview(myView)
        myView.center = view.center
        myView.backgroundColor = .link
        let timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) {[weak self] timer in
            guard let self = self else {return}
         
            DispatchQueue.main.async {
                self.view.backgroundColor = self.colors.randomElement()
                if isAnimated {
                    UIView.animate(withDuration: 1) {
                        myView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
                        myView.center = self.view.center
                    }
                    isAnimated = false
                }else{
                    UIView.animate(withDuration: 1) {
                        myView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
                        myView.center = self.view.center
                    }
                    isAnimated = true
                }
             
            }
           
        }
        timer.fire()
        
        
    }
    
//    func createTimer(){ // with stop
//        var ran = 1
//        _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {[weak self] timer in
//            guard let self = self else {return}
//            if ran > 10 {
//                timer.invalidate()
//            }
//            DispatchQueue.main.async {
//                self.view.backgroundColor = self.colors.randomElement()
//                ran += 1
//            }
//
//        }
//
//
//    }



}

