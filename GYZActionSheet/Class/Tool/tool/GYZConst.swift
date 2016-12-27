//
//  GYZConst.swift
//  GYZActionSheet
//  常量及共用方法定义
//  Created by gouyz on 2016/12/24.
//  Copyright © 2016年 gouyz. All rights reserved.
//

import Foundation
import UIKit


// keyWindow
let KeyWindow : UIWindow = UIApplication.shared.keyWindow!

let kScreenWidth = UIScreen.main.bounds.size.width
let kScreenHeight = UIScreen.main.bounds.size.height
///分割线高度
let kLineHeight : CGFloat = 0.5
/// view 圆角
let kCornerRadius : CGFloat = 5
/// 间距
let kSheetMargin: CGFloat = 6.0
/// sheetView cell高度
let kCellH : CGFloat = 45
/// sheetView 最大高度
let kSheetViewMaxH : CGFloat = kScreenHeight * 0.7
/// sheetView 宽度
let kSheetViewWidth  = kScreenWidth - kSheetMargin * 2
/// 消失动画时间
let kDismissTime = 0.3
/// 显示动画时间
let kPushTime = 0.3



/// 字体常量
let k10Font = UIFont.systemFont(ofSize: 10.0)
let k12Font = UIFont.systemFont(ofSize: 12.0)
let k13Font = UIFont.systemFont(ofSize: 13.0)
let k14Font = UIFont.systemFont(ofSize: 14.0)
let k15Font = UIFont.systemFont(ofSize: 15.0)
let k18Font = UIFont.systemFont(ofSize: 18.0)
let k20Font = UIFont.systemFont(ofSize: 20.0)

///颜色常量
/// 灰色线的颜色
let kGrayLineColor : UIColor = UIColor.UIColorFromRGB(valueRGB: 0xdcdcdc)

