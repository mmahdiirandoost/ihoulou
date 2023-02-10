//
//  ViewController.swift
//  ihoulou
//
//  Created by Lion User on 03/08/2016.
//  Copyright © 2016 mahdi. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {
    private var firstAppear = true
    
    
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
     var list2 = 	["aboutphone","airplanemode","appstore","background","battery","calculator","camera","carplay","clock","controlcenter","devicmanagment","display","disturb","findiphone","gamecenter","health","hotspot","ibooks","icloud","iclouddrive","lock & unlock notification","mail","multitasking","music","news","note","notification","notificationcenter","passcode","photos","privacy","reminder","safari","simdata","siri","sounds","storage","update","videos","voice","weather","wifi"]
    var list = 	["aboutphone","airplanemode","appstore","background","calculator","camera","controlcenter","devicmanagment","display","disturb","findiphone","gamecenter","health","hotspot","ibooks","icloud","iclouddrive","mail","multitasking","music","news","note","notification","notificationcenter","passcode","photos","privacy","reminder","safari","simdata","siri","sounds","storage","update","videos","voice","weather","wifi"]
    
    
    var sec = ["ارتباطات","تنظیمات عمومی","هشدار ها","نرم افزار های اصلی"]
   var listt = [["wifi","bluetooth","simdata","airplanemode","hotspot"],["itunes","keyboard","display","background","passcode","spotlight","privacy","battery","aboutphone","controlcenter","siri","storage","update","multitasking","devicmanagment","carplay"],["sounds","notificationcenter","notification","lock & unlock notification","disturb"],["appstore","calculator","camera","clock","findiphone","gamecenter","health","ibooks","icloud","iclouddrive","mail","music","news","note","photos","reminder","safari","videos","voice","weather"]]
    
    var listtt = [["Wifi","Bluetooth","اینترنت سیم کارت","حال پرواز","Hotspot"],["اتصال به کامپیوتر","کیبرد","نمایشگر","پس زمینه","رمز ورود","جستجو","حریم خصوصی","باتری","درباره آیفون","مرکز کنترل","Siri","حافظه","به روز رسانی ios","چند وظیفگی","Device Management","اتصال به خودرو"],["Sounds","Notification Center","Notification","صفحه قفل","مزاحم نشو"],["app Store","ماشین حساب","دوربین","ساعت","پیدا کردن آیفون","مرکز بازی‏ها","Health","iBooks","iCloud","iCloud Drive","Mail","Music","News","Notes","Photos","Reminders","Safari","Videos","Voice Memos","Weather"]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier=="play"){
            let navVC = segue.destinationViewController as! UINavigationController
            
            //  let svc = navVC.viewControllers.first as? ViewController;
            let cell = sender as! UITableViewCell
            let selectedRow = tableView.indexPathForCell(cell)!.row
            //svc!.id = 1
            // svc!.id =
            //  svc!.nameP = 2
        }
        
    }
    
    
    
    
    
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sec[section]
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return sec.count
        
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        
        
        
        var nam = listt[indexPath.section][indexPath.row]
        //  let esme = list
        do {
            try playVideo(nam)
            firstAppear = false
        } catch AppError.InvalidResource(let name, let type) {
            debugPrint("Could not find resource \(name).\(type)")
        } catch {
            debugPrint("Generic error")
        }
        
        
        
        
    }
    
   
   
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listt[section].count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! TVC
        cell.lbl!.text = listtt[indexPath.section][indexPath.row]
        
        if let picName: String? = listt[indexPath.section][indexPath.row] {
            print(picName!)
        let path = NSBundle.mainBundle().pathForResource(picName!, ofType: "png")
        var image: UIImage? = UIImage(contentsOfFile: path!)
        if image != nil {
            cell.img?.image = image
            
            
        }
        
        }
        return cell
    }
    
    
    
    
    private func playVideo(nam:String) throws {
        guard let path = NSBundle.mainBundle().pathForResource(nam, ofType:"mp4") else {
            throw AppError.InvalidResource(nam, "mp4")
        }
        let player = AVPlayer(URL: NSURL(fileURLWithPath: path))
        let playerController = AVPlayerViewController()
        playerController.player = player
        self.presentViewController(playerController, animated: true) {
            player.play()
        }
    }
    
    
    
    
    
    
}


enum AppError : ErrorType {
    case InvalidResource(String, String)
}
