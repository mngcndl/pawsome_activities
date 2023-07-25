//
//  CharacterTableViewCell.swift
//  Homework4
//
//  Created by Liubov on 05.07.2023.
//

import UIKit

protocol ActivityTableViewCellDelegate: AnyObject {
    func addToFavoritesButtonTapped(activity: ActivityResponseModel?, dog: DogResponseModel?)
}


final class ActivityTableViewCell: UITableViewCell {
        
//    weak var delegate: ActivityTableViewCellDelegate?
    
    
    
    private lazy var activityName: UILabel = {
        guard let customFont = UIFont(name: "REM-Regular", size: UIFont.labelFontSize) else {
            fatalError("""
                Failed to load the "REM-Regular" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        let activityName = UILabel()
        activityName.numberOfLines = 0
        activityName.textAlignment = .center
        activityName.font = UIFontMetrics.default.scaledFont(for: customFont)
        activityName.adjustsFontForContentSizeCategory = true
        return activityName
    }()
    
    private lazy var dogImageView: UIImageView = {
        let dogImageView = UIImageView()
        dogImageView.contentMode = .scaleAspectFill // Set the content mode to center
        dogImageView.clipsToBounds = true
        return dogImageView
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUpData(_ data: ActivityResponseModel) {
        activityName.text = data.activity
//        dogImageView.image = UIImage(data: data.image!)
    }
    
    
//    func setUpImage(_ data: DogResponseModel) {
////        activityName.text = data.activity
//        dogImageView.image = UIImage(data: data.message)
//    }

//    func setUpImage(_ data: DogResponseModel) {
//        dogImageView.download(from: data.message, mode: .scaleAspectFit)
//    }

    func setUpImage(_ data: DogResponseModel) {
        guard let imageURL = URL(string: data.message) else {
            print("URL error")
            fatalError()
        }
        
        dogImageView.download(from: imageURL, mode: .scaleAspectFit)
        print("Image")
        print(data.message)
    }


    
    func setUpViews() {
        contentView.addSubview(activityName)
        contentView.addSubview(dogImageView)
        
        activityName.translatesAutoresizingMaskIntoConstraints = false
        dogImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
//            activityName.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.4),
//            activityName.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.1),
//            activityName.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
//            activityName.centerYAnchor.constraint(equalTo: contentView.topAnchor),
//            activityName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            
//            activityName.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8),
//            activityName.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.2),
//            activityName.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
//            activityName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//            activityName.topAnchor.constraint(equalTo: contentView.topAnchor),
//
//            dogImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3),
//            dogImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3),
//            dogImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
//            dogImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//            dogImageView.topAnchor.constraint(equalTo: activityName.bottomAnchor, constant: 8),
            
            activityName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            activityName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            activityName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            dogImageView.topAnchor.constraint(equalTo: activityName.bottomAnchor, constant: 8),
            dogImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            dogImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3),
            dogImageView.heightAnchor.constraint(equalTo: dogImageView.widthAnchor),
            dogImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        activityName.text = nil
        dogImageView.image = nil
    }
}
