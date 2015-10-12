//
//  FirstViewController.swift
//  instaTeacher
//
//  Created by Letícia Gonçalves on 10/12/15.
//  Copyright © 2015 LazyFox. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var drawView: DrawingView!   //lousa verde
    
    @IBAction func undoButton(sender: AnyObject) {
        lines.removeLast()  //remove ultimo traço
        drawView.uptade()   //atualiza lousa
    }
    @IBAction func clearButton(sender: AnyObject) {
        lines.removeAll()   //remove todos as linhas
        drawView.uptade()   //atualiza lousa
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let board = PFObject(className: "Board")
        board.setObject("oi", forKey: "Content")
        board.saveInBackgroundWithBlock { (succeeded, error) -> Void in
            if succeeded {
                print("Object Uploaded")
            } else {
                print("Error: \(error) \(error!.userInfo)")
            }
        }
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func willAnimateRotationToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        drawView.uptade()   //atualiza lousa quando tela rotacionar
    }

}

