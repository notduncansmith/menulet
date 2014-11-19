//
//  AppDelegate.swift
//  menulet
//
//  Created by Duncan Smith on 11/18/14.
//  Copyright (c) 2014 Duncan Smith. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

  @IBOutlet weak var mainMenu: NSMenu!

  var statusItem: NSStatusItem!
  var statusMenu: NSMenu!

  func applicationDidFinishLaunching(aNotification: NSNotification) {
    var button: NSStatusBarButton
    var icon = NSImage(named: "tie-darkTemplate")! // "Template" means it will invert when Mac goes to Dark Mode
    
    icon.size = CGSize(width: 18.0, height: 18.0) // Give it a bit of breathing room
    
    self.statusMenu = NSMenu(title: "Foo")
    
    self.statusMenu.addItemWithTitle("Bar", action: Selector("onClick"), keyEquivalent: "b")
    
    // Status bar is 22 tall, so for square images we should be 22 wide
    self.statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(CGFloat(22.0))
    self.statusItem.menu = self.statusMenu
    
    button = self.statusItem!.button!
    button.action = Selector("onClick")
    button.target = self
    button.image = icon
  }

  func applicationWillTerminate(aNotification: NSNotification) {
    // Insert code here to tear down your application
  }
  
  func onClick() {
    println("Action pressed")
  }

}

