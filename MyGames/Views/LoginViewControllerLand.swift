//
//  LoginViewControllerLand.swift
//  MyGames
//
//  Created by aluno on 20/01/20.
//  Copyright © 2020 School. All rights reserved.
//

import UIKit

class LoginViewControllerLand: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    var onboardingViewController: UIViewController?
    
    var tableGamesViewController: UIViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        loadOnboarding(withModels: [
            OnboardingCollectionViewCellModel(imageName: "back"),
            OnboardingCollectionViewCellModel(imageName: "back"),
            OnboardingCollectionViewCellModel(imageName: "back"),
            OnboardingCollectionViewCellModel(imageName: "back")
        ])

        // Do any additional setup after loading the view.
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransition(to: newCollection, with: coordinator)

        if newCollection.verticalSizeClass == .regular {
            dismiss(animated: true, completion: nil)

            let viewController = LoginViewController(nibName: "LoginViewController", bundle: nil)
            present(viewController, animated: true, completion: nil)
        }
    }
    
    private func loadOnboarding(withModels models: [OnboardingCollectionViewCellModel]) {
        if let viewController = UIStoryboard(name: "Onboarding", bundle: nil).instantiateInitialViewController() as? OnboardingViewController {
            onboardingViewController = viewController
            viewController.datasource = models
            present(viewController, animated: true, completion: nil)
        }

    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func logar(_ sender: UIButton) {
//        var viewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as? GamesTableViewController {
//            tableGamesViewController = viewController
//            present(viewController, animated: true, completion: nil)
//        }
        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil);
//        let vc = storyboard.instantiateViewController(withIdentifier: "tabBarController") ; // MySecondSecreen the storyboard ID
//        self.present(vc, animated: true, completion: nil);
        
        
    }
    
}
