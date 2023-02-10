//
//  aboutUs.swift
//  ihoulou
//
//  Created by Lion User on 05/08/2016.
//  Copyright © 2016 mahdi. All rights reserved.
//

import UIKit

class aboutUs: UIViewController {

    @IBOutlet weak var txtView: UITextView!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
           
            
            
        }
        
        let string = "در این اپلیکیشن بنا داریم نکات و تکنیک های اولیه سیستم عامل ios را خدمت شما عزیزان بازگو و موجبات راحتی و آسایش شما را فراهم کنیم.\r\n\r\n \r\nپیشنهادات‌‌‌‌ نظرات و سوالات خود را با ما در میان بگذارید در اسرع وقت پاسخگو خواهیم بود. \r\n \r\n\r\n +989212741843  \r\n \r\n\r\n  برنامه نویس: محمد مهدی ایراندوست"
        
        
        
        
        
        self.txtView.text = string
        self.txtView.textAlignment = .Center
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
