//
//  Presenter.swift
//  MVP
//
//  Created by 허예은 on 2021/01/05.
//

import Foundation

protocol PresenterView: class {
    func updateLabel()
}

class Presenter {
    weak var view: PresenterView?
    
    init(with view: PresenterView){
        self.view = view
    }
    
    var timesTapped = 0
    
    func buttonTapped(){
        timesTapped += 1
        
        if timesTapped >= 5 {
            self.view?.updateLabel()
        }
    }
}
