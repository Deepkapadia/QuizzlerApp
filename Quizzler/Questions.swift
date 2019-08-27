//
//  Questions.swift
//  Quizzler
//
//  Created by DeEp KapaDia on 03/07/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation


class Questions{
    
    //Properties
    let queationsText: String
    let answers : Bool
    
    //Initiolization Method
    init(text : String, correctAnswer : Bool) {
        
        queationsText = text
        answers = correctAnswer
        
    }
    
}

//***** This is how we can use other class for answers *****//

//class OtherClass {
//
//    let question = Questions(text: "what is my name life", correctAnswer:  true)
//    let question2 = Questions(text: "this this this???", correctAnswer: false)
//
//}
