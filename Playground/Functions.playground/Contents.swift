//: Playground - noun: a place where people can play

import UIKit

func addTwoNumbers(argLabel1 paramName1:Int, argLabel2 paramName2:Int) ->Int{

    return (paramName1 + paramName2)
}

let result = addTwoNumbers(argLabel1: 5, argLabel2: 3)

print("Added: " + String(result))