//
//  LoginViewController.swift
//  MyGames
//
//  Created by aluno on 20/01/20.
//  Copyright © 2020 School. All rights reserved.
//

import UIKit

struct AppUtility {

    static func lockOrientation(_ orientation: UIInterfaceOrientationMask) {

        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            delegate.orientationLock = orientation
        }
    }

    /// OPTIONAL Added method to adjust lock and rotate to the desired orientation
    static func lockOrientation(_ orientation: UIInterfaceOrientationMask, andRotateTo rotateOrientation:UIInterfaceOrientation) {

        self.lockOrientation(orientation)

        UIDevice.current.setValue(rotateOrientation.rawValue, forKey: "orientation")
        UINavigationController.attemptRotationToDeviceOrientation()
    }

}

class LoginViewController: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    
    var onboardingViewController: UIViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadOnboarding(withModels: [
            OnboardingCollectionViewCellModel(imageName: "spiderman_back"),
            OnboardingCollectionViewCellModel(imageName: "spiderman_back"),
            OnboardingCollectionViewCellModel(imageName: "spiderman_back"),
            OnboardingCollectionViewCellModel(imageName: "spiderman_back")
        ])
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransition(to: newCollection, with: coordinator)

        if newCollection.verticalSizeClass == .compact {
            dismiss(animated: true, completion: nil)

            let viewController = LoginViewControllerLand(nibName: "LoginViewControllerLand", bundle: nil)
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

}
