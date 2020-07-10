//
//  RadioGroupView.swift
//  MobileForSale
//
//  Created by Pham Hoang Ha on 12/25/19.
//  Copyright © 2019 Mcredit. All rights reserved.
//

import UIKit


struct Radio {
    var id: IDRadio = .ONE_DAY
    var name = ""
    var selected = false
    
    init(id: IDRadio, name: String, selected: Bool) {
        self.id = id
        self.name = name
        self.selected = selected
    }
}

enum IDRadio: Int {
    case ONE_DAY = 1 // Chọn 1 ngày
    case SEVEN_DAY = 7 // Chọn 7 ngày
    
    case MALE = 100 // Chọn giới tính Nam
    case FEMALE = 101 // Chọn giới tính Nữ
    
    case TC = 200 // Chọn tất cả
    case PS = 201 // Chọn phát sinh
    case HT = 202 // Chọn hoàn thành
    case HSH = 203 // Chọn hồ sơ huỷ
    
}


class RadioGroupView: BaseView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    static let nibName = "RadioGroupView"
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    var listenerSelected: ((IDRadio) -> ())?
    var data = [Radio]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    var widthCell: CGFloat = 100.0
    
    override func commonInit() {
        Bundle.main.loadNibNamed(RadioGroupView.nibName, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        initView()
    }
    
    func initView (){
        collectionView.delegate = self
        collectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        self.collectionView.collectionViewLayout = layout
        collectionView.register(UINib(nibName: RadioCell.nibName, bundle: nil), forCellWithReuseIdentifier: RadioCell.nibName)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RadioCell.nibName, for: indexPath) as? RadioCell  else {return UICollectionViewCell()}
        cell.fillData(radio: data[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let index = data.firstIndex(where: { (item) -> Bool in item.selected == true}) else {return}
        data[index].selected = false
        data[indexPath.row].selected  = true
        listenerSelected?(data[indexPath.row].id)
    }
    
    func setData(data: [Radio], widthCell: CGFloat = 100.0) {
        self.widthCell = widthCell
        self.data = data
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: widthCell, height: 50)
    }
    
    func selectIndex(id: IDRadio){
        guard let indexSelected = data.firstIndex(where: { (item) -> Bool in item.selected == true}) else {return}
        guard let index = data.firstIndex(where: { (item) -> Bool in item.id == id}) else {return}
        data[indexSelected].selected = false
        data[index].selected = true
        listenerSelected?(data[index].id)
    }
}

