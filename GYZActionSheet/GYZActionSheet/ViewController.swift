//
//  ViewController.swift
//  GYZActionSheet
//
//  Created by gouyz on 2016/12/23.
//  Copyright © 2016年 gouyz. All rights reserved.
//

import UIKit

fileprivate let cellId = "cell"

class ViewController: UIViewController {
    
    /// 数据源
    var dataSource = [String]()
    /// 选择的数据
    var selectSource = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        
        view.addSubview(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    lazy var tableView : UITableView = {
        let table = UITableView(frame: self.view.frame, style: .plain)
        table.dataSource = self
        table.delegate = self
        table.tableFooterView = UIView()
        
        return table
    }()

    /// 模拟数据
    fileprivate func loadData(){
        dataSource.append("普通模式")
        dataSource.append("变色变字模式")
        dataSource.append("行数超多模式")
        dataSource.append("WeiChat模式")
        dataSource.append("WeiChat多行模式")
        dataSource.append("TableView模式")
        dataSource.append("AlertViewController 封装alert")
        dataSource.append("AlertViewController 封装sheet")
        
        for _ in 0 ..< dataSource.count {
            selectSource.append("")
        }
    }
}

// MARK: - UITableViewDelegate,UITableViewDataSource
extension ViewController : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell.init(style: .value1, reuseIdentifier: cellId)
        cell.textLabel?.text = dataSource[indexPath.row]
        cell.detailTextLabel?.text = selectSource[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: false)
        
        switch indexPath.row {
        case 0:
            let actionSheet = GYZActionSheet.init(title: "", style: .Default, itemTitles: ["头等舱","商务舱","经济舱","不限"])
            weak var weakSelf = self
            actionSheet.didSelectIndex = { (index: Int,title: String) in
                weakSelf?.selectSource[indexPath.row] = "第\(index)行,\(title)"
                weakSelf?.tableView.reloadData()
            }
        case 1:
            let actionSheet = GYZActionSheet.init(title: "选择舱位", style: .Default, itemTitles: ["头等舱","商务舱","经济舱","不限"])
            actionSheet.cancleTextColor = UIColor.black
            actionSheet.titleTextFont = k15Font
            actionSheet.itemTextFont = k18Font
            actionSheet.titleTextColor = .red
            actionSheet.itemTextColor = .orange
            
            actionSheet.tag = indexPath.row
            actionSheet.delegate = self
            
        case 2:
            let actionSheet = GYZActionSheet.init(title: "席座选择", style: .Default, itemTitles: ["头等舱","商务舱","经济舱","特等座","一等座","二等座","软座","硬座","头等舱","商务舱","经济舱","特等座","一等座","二等座","软座","硬座","不限"])
            weak var weakSelf = self
            actionSheet.didSelectIndex = { (index: Int,title: String) in
                weakSelf?.selectSource[indexPath.row] = "第\(index)行,\(title)"
                weakSelf?.tableView.reloadData()
            }
        case 3:
            let actionSheet = GYZActionSheet.init(title: "", style: .WeiChat, itemTitles: ["头等舱","商务舱","经济舱","不限"])
            weak var weakSelf = self
            actionSheet.didSelectIndex = { (index: Int,title: String) in
                weakSelf?.selectSource[indexPath.row] = "第\(index)行,\(title)"
                weakSelf?.tableView.reloadData()
            }
        case 4:
            let actionSheet = GYZActionSheet.init(title: "席座选择", style: .WeiChat, itemTitles: ["头等舱","商务舱","经济舱","特等座","一等座","二等座","软座","硬座","头等舱","商务舱","经济舱","特等座","一等座","二等座","软座","硬座","不限"])
            weak var weakSelf = self
            actionSheet.didSelectIndex = { (index: Int,title: String) in
                weakSelf?.selectSource[indexPath.row] = "第\(index)行,\(title)"
                weakSelf?.tableView.reloadData()
            }
        case 5:
            let actionSheet = GYZActionSheet.init(title: "时间选择", style: .Table, itemTitles: ["10:00","11:00","12:00","13:00","14:00","15:00","16:00","17:00","18:00","19:00","20:00","21:00","22:00","23:00","23:59"])
            weak var weakSelf = self
            actionSheet.didSelectIndex = { (index: Int,title: String) in
                weakSelf?.selectSource[indexPath.row] = "第\(index)行,\(title)"
                weakSelf?.tableView.reloadData()
            }
        
        case 6:
            GYZAlertViewTools.alertViewTools.showAlert(title: "登录", message: "请登录", cancleTitle: "", viewController: self ,buttonTitles: "登录","忘记密码",alertActionBlock:{ (index) in
                
                print("\(index)")
            })
        case 7:
            GYZAlertViewTools.alertViewTools.showSheet(title: nil, message: nil, cancleTitle: "取消", viewController: self, buttonTitles: "10:00","11:00","12:00","13:00","14:00","15:00","16:00",alertActionBlock:{ (index) in
                
                print("\(index)")
            })
        default:
            return
        }
    }
}

extension ViewController : GYZActionSheetDelegate{
    func sheetViewDidSelect(index: Int, title: String, actionSheet: GYZActionSheet) {
        selectSource[actionSheet.tag] = "第\(index)行,\(title)"
        self.tableView.reloadData()
    }
}
