//
//  WorkoutCollectionViewCell.swift
//  iOSFinalProject
//
//  Created by Justin on 2020/12/8.
//

import UIKit

class WorkoutCollectionViewCell: UICollectionViewCell {
    var nameLabel: UILabel!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        setupConstraints()
    }
    func setupConstraints(){
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    func configure (workout: Workout){
        nameLabel.text = workout.name
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
