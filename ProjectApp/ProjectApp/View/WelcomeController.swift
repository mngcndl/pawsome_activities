//
//  WelcomeController.swift
//  ProjectApp
//
//  Created by Liubov on 24.07.2023.
//

import Foundation
import UIKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        guard let customFont = UIFont(name: "REM-Regular", size: UIFont.labelFontSize) else {
            fatalError("""
                Failed to load the "REM-Regular" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        view.backgroundColor = .white

        let titleLabel = UILabel()
        titleLabel.text = "Welcome to Pawsome Activities !"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24.0)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFontMetrics.default.scaledFont(for: customFont)
        titleLabel.adjustsFontForContentSizeCategory = true
        view.addSubview(titleLabel)
        
        let imageView1 = UIImageView()
            imageView1.image = UIImage(named: "sitting_dog")
            imageView1.contentMode = .scaleAspectFit
            imageView1.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(imageView1)
        let smilly_dog = UIImageView()
        smilly_dog.image = UIImage(named: "smilly_dog")
        smilly_dog.contentMode = .scaleAspectFit
        smilly_dog.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(smilly_dog)
        let meme_dog = UIImageView()
        meme_dog.image = UIImage(named: "meme_dog")
        meme_dog.contentMode = .scaleAspectFit
        meme_dog.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(meme_dog)
        let dog_with_glasses = UIImageView()
        dog_with_glasses.image = UIImage(named: "dog_with_glasses")
        dog_with_glasses.contentMode = .scaleAspectFit
        dog_with_glasses.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(dog_with_glasses)

        let getStartedButton = UIButton(type: .system)
                getStartedButton.setTitle("Get Started", for: .normal)
                getStartedButton.titleLabel?.font = UIFontMetrics.default.scaledFont(for: customFont)
                getStartedButton.titleLabel?.adjustsFontForContentSizeCategory = true
                getStartedButton.titleLabel?.font.withSize(20.0)
                getStartedButton.addTarget(self, action: #selector(getStartedButtonTapped), for: .touchUpInside)
                getStartedButton.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview(getStartedButton)

        // Add constraints for the UI elements
        NSLayoutConstraint.activate([
//            activityLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor),
//            activityLabel.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.15),
//            activityLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            activityLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20), // Pin to the top of the
            
            imageView1.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            imageView1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView1.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            imageView1.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5), // Ensure a square aspect ratio for the image view
            
            titleLabel.topAnchor.constraint(equalTo: imageView1.bottomAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
//            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            getStartedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            getStartedButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            
            smilly_dog.topAnchor.constraint(equalTo: getStartedButton.bottomAnchor, constant: 16),
            smilly_dog.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -16),
            smilly_dog.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            smilly_dog.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            
            meme_dog.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            meme_dog.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            meme_dog.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            meme_dog.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            
            dog_with_glasses.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 16),
            dog_with_glasses.topAnchor.constraint(equalTo: getStartedButton.bottomAnchor, constant: 8),
            dog_with_glasses.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            dog_with_glasses.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
        ])
    }

    @objc private func getStartedButtonTapped() {
        let baseViewController = ViewController()
        navigationController?.pushViewController(baseViewController, animated: true)
    }
}
