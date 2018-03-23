
//
//  PartCellView.swift
//  MapPing
//
//  Created by Hugo Lefrancois on 2018-03-22.
//  Copyright © 2018 Mirego. All rights reserved.
//

import UIKit

class PartCellView: UIView {

    private let partImage = UIImageView()
    private let title = UILabel()
    private let subTitle = UILabel()
    private let coordinates = UILabel()
    private let distance = UILabel()

    init() {
        super.init(frame: .zero)

        partImage.backgroundColor = .white
        partImage.contentMode = .center
        partImage.size = CGSize(width: 66, height: 66)
        partImage.layer.cornerRadius = partImage.height / 2
        partImage.layer.borderColor = UIColor.copper.cgColor
        partImage.layer.borderWidth = 4
        addSubview(partImage)

        title.setProperties(font: .leagueSpartanBold(14), textColor: .purpleBrown)
        addSubview(title)

        subTitle.setProperties(font: .systemFont(ofSize: 12), textColor: .purpleBrown)
        addSubview(subTitle)

        coordinates.setProperties(font: .systemFont(ofSize: 12), textColor: .brownishGrey)
        addSubview(coordinates)

        distance.setProperties(font: .italicSystemFont(ofSize: 12), textColor: .brownishGrey)
        addSubview(distance)

        height = 100
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        partImage.pin.left(15).vCenter()
        title.pin.right(of: partImage, aligned: .top).marginLeft(15).marginTop(8)
        subTitle.pin.below(of: title, aligned: .left).marginTop(1)
        coordinates.pin.below(of: subTitle, aligned: .left).marginTop(3)
        distance.pin.right(of: coordinates, aligned: .center).marginLeft(6)
    }

    func configure(partImageName: String, title: String, subTitle: String, coordinates: String, distance: String) {
        partImage.image = UIImage(named: partImageName)
        self.title.setProperties(text: title, fit: true)
        self.subTitle.setProperties(text: subTitle, fit: true)
        self.coordinates.setProperties(text: coordinates, fit: true)
        self.distance.setProperties(text: distance, fit: true)
        setNeedsLayout()
    }
}

