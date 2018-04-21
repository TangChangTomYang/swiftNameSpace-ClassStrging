//
//  UIButton+extension.swift
//  String2Obj
//
//  Created by yangrui on 2018/4/21.
//  Copyright © 2018年 yangrui. All rights reserved.
//

import UIKit

// MARK:- swift 中的类扩展
extension UIButton{
    
    // 在Swift中类方法以class开头的方法,类似OC中的 + 开头的方法
    class func test(){
        
        print("swift 中的类方法 ,在定义是方法前面加关键字 class")
    }
    
    // swift 中的便利构造方法
    // convenience : 便利构造方法,使用convenience 修饰的构造函数叫做便利构造函数
    // 便利构造函数通常用在对系统的类进行 构造函数扩充时使用
    
    // 便利构造函数的特点
    //1. 便利构造函数通常是卸载 extension 里面的
    //2. 便利构造函数 init前面需要加关键字 convenience
    //3. 在便利构造函数中需要明确的使用self 调用init() 方法
    
    convenience init(img:String, highlightImg : String){
        
        self.init()
        setImage(UIImage.init(named: img), for: .normal)
        setImage(UIImage.init(named: highlightImg), for: .normal)
    }
    
    
    
}
