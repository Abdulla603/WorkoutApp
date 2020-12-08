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
    var workoutsView: UICollectionView!
    let padding: CGFloat = 8
    let workoutReuseIdentifier = "workoutCellReuseIdentifier"

    
    let squats = Workout(imageName: "", name: "Squats", muscleTarget: "Hamstrings", exerciseOworkout: true)
    let jumpropes = Workout(imageName: "", name: "Jump Ropes", muscleTarget: "Calves", exerciseOworkout: true)
    let bench = Workout(imageName: "", name: "Bench Press", muscleTarget: "Chest", exerciseOworkout: true)
    let deadlift = Workout(imageName: "", name: "Deadlift", muscleTarget: "Back", exerciseOworkout: true)
    let dips = Workout(imageName: "", name: "Dips", muscleTarget: "Triceps", exerciseOworkout: true)
    let situp = Workout(imageName: "", name: "Sit-ups", muscleTarget: "Abs", exerciseOworkout: true)
    let overheadpress = Workout(imageName: "", name: "Overhead press", muscleTarget: "Shoulders", exerciseOworkout: true)
    let curls = Workout(imageName: "", name: "Dumbell curls", muscleTarget: "Biceps", exerciseOworkout: true)
    
    var workouts: [Workout] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Workout App"
        workouts = [squats, jumpropes, bench, deadlift, dips, situp, overheadpress, curls]
        
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
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = padding
        layout.minimumLineSpacing = padding
        layout.scrollDirection = .vertical
        
        workoutsView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        workoutsView.backgroundColor = .white
        workoutsView.translatesAutoresizingMaskIntoConstraints = false
        workoutsView.dataSource = self
        workoutsView.delegate = self
        workoutsView.register(OptionsCollectionViewCell.self, forCellWithReuseIdentifier: optionsCellReuseIdentifier)
        view.addSubview(workoutsView)
        
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

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return workouts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: workoutReuseIdentifier, for: indexPath) as! WorkoutCollectionViewCell
        cell.configure(for: workouts[indexPath.row])
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.width - padding)/2.0
        return CGSize(width: size, height: size)
    }
}


extension ViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let workout = workouts[indexPath.row]
        let indexx = indexPath.row
        let vc = WorkoutPopUpViewController()
        //(pic: song.songcover, title:song.songtitle, artist:song.songartist, album: song.songalbum, index: indexx)
        vc.delegate = self
        present(vc, animated: true, completion: nil)
    }
}
