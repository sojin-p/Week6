//
//  CustomTableViewCell.swift
//  Week6
//
//  Created by 박소진 on 2023/08/25.
//

import UIKit
import SnapKit

class CustomTableViewCell: UITableViewCell {
    
    let button = UIButton()
    let label = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier) //커스텀하게 쓸 거라 매개변수 그대로
        
        setConfigure()
        setConstraints() //addSubView이후에 constraints 설정
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConfigure() {
        
//        view.addSubview(label)
        contentView.addSubview(label)
        contentView.addSubview(button)
        label.backgroundColor = .cyan
        button.backgroundColor = .yellow
        
    }
    
    func setConstraints() {
        
        button.snp.makeConstraints { make in
            make.size.equalTo(40)
            make.centerY.trailingMargin.equalTo(contentView)
        }
        label.snp.makeConstraints { make in
            make.top.leadingMargin.bottom.equalTo(contentView)
            make.trailing.equalTo(button.snp.leading).inset(8)
        }
    }
    
    //Interface builder로 제작 시에만 동작(Nib)
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
