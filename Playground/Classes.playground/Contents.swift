//: Playground - noun: a place where people can play

import UIKit

class BlogPost{
    var title = ""
    var body = ""
    var author = ""
    var numberOfComments = 0
    
    func addComment(){
        numberOfComments += 1
    }
}

let myPost = BlogPost()
myPost.title = "Hello Playground"
myPost.body = "The body post"
myPost.author = "Chris"
myPost.addComment()

print(myPost.author + " " + String(myPost.numberOfComments))

let secondPost = BlogPost()
secondPost.title = "Second Playground"
secondPost.body = "The body post"
secondPost.author = "Aldo"

print(secondPost.author + " " + String(secondPost.numberOfComments))
