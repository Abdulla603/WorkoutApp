//
//  ViewController.swift
//  IOSFinalProject
//
//  Created by Tucker Stanley on 12/7/20.
//

import UIKit

class ViewController: UIViewController {
    
    var titleLabel: UILabel!
    var workoutButton: UIButton!
    var exerciseButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Workout App"
        
        
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Welcome to the workout app! \nWould you like to view workouts or exercises?"
        titleLabel.font = .systemFont(ofSize: 16, weight: .bold)
        titleLabel.numberOfLines = 2
        titleLabel.textColor = .black
        view.addSubview(titleLabel)
        
        workoutButton = UIButton()
        workoutButton.translatesAutoresizingMaskIntoConstraints = false
        workoutButton.setTitle("Workouts", for: .normal)
        workoutButton.setTitleColor(.red, for: .normal)
        workoutButton.backgroundColor = .gray
        view.addSubview(workoutButton)
        
        exerciseButton = UIButton()
        exerciseButton.translatesAutoresizingMaskIntoConstraints = false
        exerciseButton.setTitle("Exercises", for: .normal)
        exerciseButton.setTitleColor(.blue, for: .normal)
        exerciseButton.backgroundColor = .gray
        view.addSubview(exerciseButton)
        
        setupConstraints()

        
        // Do any additional setup after loading the view.
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            workoutButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            workoutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            workoutButton.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        NSLayoutConstraint.activate([
            exerciseButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            exerciseButton.leadingAnchor.constraint(equalTo: workoutButton.trailingAnchor, constant: 10),
            exerciseButton.heightAnchor.constraint(equalToConstant: 24)
        ])
    }

}

