//
//  GLImageView.swift
//  EnjoeiTest
//
//  Created by Gerlandio Lucena on 19/05/16.
//  Copyright © 2016 gerlandiolucena.net. All rights reserved.
//

import UIKit

class GLImageView: UIImageView {

    var progress: UIActivityIndicatorView!
    let queue = NSOperationQueue()
    let mainQueue = NSOperationQueue.mainQueue()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createProgress()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createProgress()
    }
    
    func createProgress() {
        progress = UIActivityIndicatorView(activityIndicatorStyle: .White)
        addSubview(progress)
    }
    
    override func layoutSubviews() {
        progress.center = convertPoint(self.center, toView: self.superview)
    }
    
    func setURL(url: String) {
        setURL(url, cache: true)
    }
    
    func setURL(url: String, cache: Bool) {
        self.image = nil
        queue.cancelAllOperations()
        progress.startAnimating()
        queue.addOperationWithBlock({ 
            self.downloadImg(url, cache: true)
        })
    }
    
    func downloadImg(url: String, cache: Bool) {
        var data: NSData!
        
        if(!cache) {
            data = NSData(contentsOfURL: NSURL(string:url)!)
        } else {
            var path = url.stringByReplacingOccurrencesOfString("/", withString: "_")
            path = path.stringByReplacingOccurrencesOfString("\\", withString: "_")
            path = path.stringByReplacingOccurrencesOfString(":", withString: "_")
            path = "\(NSHomeDirectory())/Documents/\(path)"
            
            if( NSFileManager.defaultManager().fileExistsAtPath(path)){
                data = NSData(contentsOfFile: path)
            } else {
                data = NSData(contentsOfURL: NSURL(string: url)!)!
                data.writeToFile(path, atomically: true)
            }
        }
        
        mainQueue.addOperationWithBlock { 
            self.showImg(data)
        }
        
    }
    
    func showImg(data: NSData) {
        if(data.length > 0){
            self.image = UIImage(data:data)
        }
        
        progress.stopAnimating()
    }
    
}
