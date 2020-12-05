# TimerExample
![Sample](https://i.imgur.com/RTif6ywl.png)
![Sample](https://i.imgur.com/9XmtDQ1l.png)
```swift
   override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        createTimer()
    }
```

```swift
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
```
