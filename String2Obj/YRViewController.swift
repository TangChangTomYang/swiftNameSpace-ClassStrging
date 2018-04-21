//
//  YRViewController.swift
//  String2Obj
//
//  Created by yangrui on 2018/4/21.
//  Copyright © 2018年 yangrui. All rights reserved.
//

import UIKit

class YRViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func test()  {
        
        //1. 获取指定文件的路径
        guard let path = Bundle.main.path(forResource: "tabbarVC.json", ofType: nibName)
            else {
                print("没有找到对应的文件:\("tabbarVC.json")")
            return
        }
        
        //2. 从指定的文件路径 获取数据
        guard let data = NSData.init(contentsOfFile: path) else{
            print("获取文件数据失败")
            return
        }
        
        //3. data -> array
        guard  let dicArr = try! JSONSerialization.jsonObject(with: (data as Data), options: .mutableContainers) as? [[String :Any]] else{
            print("data -> array 失败")
            return;
        }
        
        for dic  in dicArr {
            
            guard  let vcClsStr = dic["vcClsName"] as? String else{
                print("获取类名字失败")
                return;
            }
            
            guard   let title = dic["title"] as? String else{
                print("获取标题失败")
                return
            }
            
            guard let img = dic["image"] as? String else {
                print("获取图片失败")
                return
            }
            
            print("类名\(vcClsStr),标题:\(title),图片:\(img)")
            
        }
     
    }
}





// MARK:- ios 中Swift异常的处理
func test2() {
    // ios 中异常的处理有三种方式,凡是方法返回带 throws 的,都需要处理异常
    //1. 程序员自己处理
    let data = Data()
    
    // 方式一,系统帮我们处理异常,如果有异常返回 nil,如果没有异常就返回对应类型的可选类型
    
    guard   let obj = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) else{
        return
    }
    
    // 方式二, 系统强制处理,不对异常处理,有异常直接崩溃,这种很危险,但返回的是具体类型
    let obj2 = try! JSONSerialization.jsonObject(with: data, options: .mutableContainers)
    
    
    // 方式三,程序员自己处理异常
    do {
     let obj3 =  try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
        
        // ... ... 没有异常就走这里
        
    } catch{
        // 有异常系统会自动抛出异常 error
        print(error)
        
    }
    
    
    
    
    
    
    
    
    
    
    
}


