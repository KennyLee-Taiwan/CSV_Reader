//
//  ViewController.swift
//  ShopHelper
//
//  Created by Daphne Jiang on 01/11/2016.
//  Copyright © 2016 Kenny Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var item1: UILabel!
    
    @IBOutlet weak var item2: UILabel!
    
    @IBOutlet weak var quantity1: UILabel!
    
    @IBOutlet weak var quantity2: UILabel!
    
    
    @IBOutlet weak var CSVFileLoadingStatus: UILabel!
        
    func ReadandProccessImportedFile() {
        
        let importedFilePathURL = URL.init(string: "\(Manager.messageText)")
        
        // Start reading and parsing
        do {
            let importedFileStringToBeParsed = try String(contentsOf: importedFilePathURL!, encoding: String.Encoding.utf8)
            
            let parsedString_Array = importedFileStringToBeParsed.characters.split{$0 == "," || $0 == "\r\n"}.map(String.init)
            
            for i in 0..<parsedString_Array.count {
                
                if i % 2 == 0 {
                    
                    print("Item: \(parsedString_Array[i])", terminator: " | ")
                    
                } else if i % 2 != 0 {
                    
                    print("Quantity: \(parsedString_Array[i])")
                    
                }
                
            }
            
            
            item1.text = parsedString_Array[0]
            quantity1.text = parsedString_Array[1]
            item2.text = parsedString_Array[2]
            quantity2.text = parsedString_Array[3]
            
        }
        catch {/* error handling here */ print("Can't read file, file path is incorrect. It is currently: \(Manager.messageText)")}
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
