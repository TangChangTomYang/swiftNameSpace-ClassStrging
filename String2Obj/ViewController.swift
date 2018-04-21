//
//  ViewController.swift
//  String2Obj
//
//  Created by yangrui on 2018/4/21.
//  Copyright © 2018年 yangrui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
//        jump2ChildVc(childClsStr: "YRViewController")
        jump2ChildVc(childClsStr: "UIViewController")
        
        
    }
    
    // MARK:- 更具类名字符创创建对应的对象
    /// 注意: 不是任何类型的类的字符串都可以转换成对应的Class,必须要类名和命名空间都正确才能成功
    func jump2ChildVc(childClsStr : String)  {
        
        //1. 获取当前的命名空间
        guard let nameSpace =  Bundle.main.infoDictionary!["CFBundleExecutable"] as? String
            else {
                print("没有获取到命名空间")
                return
        }
     
        // 2. 根据字符串获取对应的class
        guard  let childCls = NSClassFromString(nameSpace + "." + childClsStr) else {
            print("没有获取到对应的 class,命名空间:\(nameSpace),类名:\(childClsStr)")
            return
        }
        
        //3. 根据AnyClass 获取对应的控制器类型 相当于是校验是不是UIViewController类型
        guard let childVCType = childCls as? UIViewController.Type  else {
            print("没有获取到控制器类型")
            return
        }
        
        //4. 使用对应的类型创建控制器
        let childVC = childVCType.init()
        
        childVC.view.backgroundColor = UIColor.red
        navigationController?.pushViewController(childVC, animated: true)
        
        
        

        
    }


}

