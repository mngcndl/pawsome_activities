//
//  DetailViewController.swift
//
//  Created by Liubov
//

import UIKit

protocol DetailViewControllerDelegate: AnyObject {
//    func addToFavoritesButtonTapped(for cell: ActivityTableViewCell, activity: ActivityResponseModel)
    //    func deleteActivityData(with id: Int64)
//    func updateActivityData(_ character: Activity)
}


final class DetailViewController: UIViewController {
    
    private let activityManager: ActivityManagerProtocol

    init(activityManager: ActivityManagerProtocol) {
        self.activityManager = activityManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var data: ActivityResponseModel? {
        didSet {
            guard let data = data else { return }
            setUpData(data)
        }
    }
    
    var imageData: DogResponseModel? {
        didSet {
            guard let imageData = imageData else { return }
            setUpImageDetail(imageData)
        }
    }
    
    weak var delegate: DetailViewControllerDelegate?
    
    private lazy var activityLabel: UILabel = {
        let activityLabel = UILabel()
        activityLabel.translatesAutoresizingMaskIntoConstraints = false
        activityLabel.textAlignment = .center
        activityLabel.numberOfLines = 0
        return activityLabel
    }()   
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var typeHint: UILabel = {
        let typeHint = UILabel()
        typeHint.translatesAutoresizingMaskIntoConstraints = false
        typeHint.text = "Type of activity:"
        typeHint.textColor = .systemGray
        typeHint.textAlignment = .left
        typeHint.numberOfLines = 0
        return typeHint
    }()
    
    private lazy var participantsHint: UILabel = {
        let participantsHint = UILabel()
        participantsHint.numberOfLines = 0
        participantsHint.translatesAutoresizingMaskIntoConstraints = false
        participantsHint.text = "Participants:"
        participantsHint.textColor = .systemGray
        return participantsHint
    }()
    
    private lazy var priceHint: UILabel = {
        let priceHint = UILabel()
        priceHint.numberOfLines = 0
        priceHint.translatesAutoresizingMaskIntoConstraints = false
        priceHint.textColor = .systemGray
        priceHint.text = "Price:"
        return priceHint
    }()
    
    private lazy var participantsLabel: UILabel = {
        let participantsLabel = UILabel()
        participantsLabel.translatesAutoresizingMaskIntoConstraints = false
        participantsLabel.textAlignment = .left
//        participantsLabel.numberOfLines = 0
        return participantsLabel
    }()
    
    private lazy var priceLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.textAlignment = .left
        priceLabel.numberOfLines = 0
        return priceLabel
    }()
    
    private lazy var typeLabel: UILabel = {
        let typeLabel = UILabel()
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.textAlignment = .left
        typeLabel.numberOfLines = 0
        return typeLabel
    }()
    
    private func setUpViews(){
        view.backgroundColor = .systemBackground
        view.addSubview(activityLabel)
        view.addSubview(imageView)
        
        view.addSubview(typeHint)
        view.addSubview(participantsHint)
        view.addSubview(priceHint)
        
        view.addSubview(typeLabel)
        view.addSubview(participantsLabel)
        view.addSubview(priceLabel)
        
        NSLayoutConstraint.activate([
            activityLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8),
            activityLabel.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.15),
            activityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20), // Pin to the top of the view
         
            imageView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.45),
            imageView.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.45),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: activityLabel.bottomAnchor, constant: 8),
            
            typeHint.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.4),
            typeHint.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.1),
            typeHint.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            typeHint.centerYAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 32),

            participantsHint.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.4),
            participantsHint.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.1),
            participantsHint.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            participantsHint.topAnchor.constraint(equalTo: typeHint.bottomAnchor, constant: 16),
            
            priceHint.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.4),
            priceHint.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.1),
            priceHint.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            priceHint.topAnchor.constraint(equalTo: participantsHint.bottomAnchor, constant: 16),
            
            typeLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5),
            typeLabel.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.1),
            typeLabel.leadingAnchor.constraint(equalTo: typeHint.trailingAnchor, constant: 16),
            typeLabel.topAnchor.constraint(equalTo: typeHint.topAnchor),

            participantsLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5),
            participantsLabel.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.1),
            participantsLabel.leadingAnchor.constraint(equalTo: participantsHint.trailingAnchor, constant: 16),
            participantsLabel.topAnchor.constraint(equalTo: participantsHint.topAnchor),

            priceLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5),
            priceLabel.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.1),
            priceLabel.leadingAnchor.constraint(equalTo: priceHint.trailingAnchor, constant: 16),
            priceLabel.topAnchor.constraint(equalTo: priceHint.topAnchor),
        ])
    }
    
    private func setUpData(_ data: ActivityResponseModel) {
        activityLabel.text = data.activity
        typeLabel.text = data.type
        participantsLabel.text = String(data.participants)
        priceLabel.text = String(data.price)
    }
    
//    private func setUpImage(_ imageData: DogResponseModel) {
//        imageView.image = UIImage(imageData: data.message)
//    }
    func setUpImageDetail(_ data: DogResponseModel) {
        guard let imageURL = URL(string: data.message) else {
            print("URL error")
            fatalError()
        }
        imageView.download(from: imageURL, mode: .scaleAspectFit)
        print("IMAGE IS SET")
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
}
