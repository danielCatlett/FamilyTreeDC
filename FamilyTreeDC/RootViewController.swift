//  RootViewController.swift
//  FamilyTreeDC
//
//  Created by Daniel Catlett on 3/1/17.
//  Copyright © 2017 Daniel Catlett. All rights reserved.

import UIKit

class RootViewController: UIViewController
{
    private var motherViewController: MotherViewController!
    private var fatherViewController: FatherViewController!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        motherViewController = storyboard?.instantiateViewController(withIdentifier: "Mother") as! MotherViewController
        motherViewController.view.frame = view.frame
        switchViewController(from: nil, to: motherViewController)
    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
        if(motherViewController != nil && motherViewController!.view.superview == nil)
        {
            motherViewController = nil
        }
        if(fatherViewController != nil && fatherViewController!.view.superview == nil)
        {
            fatherViewController = nil
        }
    }
    
    @IBAction func switchViews(sender: UIBarButtonItem)
    {
        //Loads views if unloaded
        if(fatherViewController?.view.superview == nil)
        {
            if(fatherViewController == nil)
            {
                fatherViewController = storyboard?.instantiateViewController(withIdentifier: "Father") as! FatherViewController
            }
        }
        else if(motherViewController?.view.superview == nil)
        {
            if(motherViewController == nil)
            {
                motherViewController = storyboard?.instantiateViewController(withIdentifier: "Mother") as! MotherViewController
            }
        }
            
        //Switches views
        if(motherViewController != nil && motherViewController!.view.superview != nil)
        {
            fatherViewController.view.frame = view.frame
            switchViewController(from: motherViewController, to: fatherViewController)
        }
        else
        {
            motherViewController.view.frame = view.frame
            switchViewController(from: fatherViewController, to: motherViewController)
        }
    }
    
    private func switchViewController(from fromVC:UIViewController?, to toVC:UIViewController?)
    {
        if(fromVC != nil)
        {
            fromVC!.willMove(toParentViewController: nil)
            fromVC!.view.removeFromSuperview()
            fromVC!.removeFromParentViewController()
        }
        
        if(toVC != nil)
        {
            self.addChildViewController(toVC!)
            self.view.insertSubview(toVC!.view, at: 0)
            toVC!.didMove(toParentViewController: self)
        }
    }
}


















