//
//  MangerDelegate.swift
//  PRear
//
//  Created by Stan on 2022/11/4.
//

import Foundation


class SCManger {

     let delegates = NSHashTable<AnyObject>.weakObjects()
    
    func add(delegate:AnyObject){
        if !delegates.contains(delegate){
            delegates.add(delegate)
        }
    }

    func remove(delegate:AnyObject){
        if delegates.contains(delegate){
            delegates.remove(delegate)
        }
    }
    
    func allDelegates()-> AnyObject {
        return delegates.allObjects as AnyObject
    }
}
