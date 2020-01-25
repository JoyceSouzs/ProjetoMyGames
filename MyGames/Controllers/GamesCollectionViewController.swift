//
//  GamesCollectionViewController.swift
//  MyGames
//
//  Created by aluno on 22/01/20.
//  Copyright © 2020 School. All rights reserved.
//

import UIKit
import CoreData

class GamesCollectionViewController: UIViewController {

    @IBOutlet weak var gameCollection: UICollectionView!
    
    var fetchedResultController:NSFetchedResultsController<Game>!
       var label = UILabel()
       let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameCollection.delegate = self
        gameCollection.dataSource = self
        
        gameCollection.register(UINib(nibName: "GamesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GamesCollectionViewCell")
        gameCollection.isPagingEnabled = true
        
         let gesture = UISwipeGestureRecognizer(target: self, action: #selector(gestureApplied))
               gesture.direction = .down
               view.addGestureRecognizer(gesture)
        
        label.text = "Você não tem jogos cadastrados"
        label.textAlignment = .center
        
        loadGames()
    }

    @objc func gestureApplied() {
        dismiss(animated: true, completion: nil)
    }
    
    func loadGames(filtering: String = "") {
        let fetchRequest: NSFetchRequest<Game> = Game.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "title", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
       
        if !filtering.isEmpty {
            // usando predicate: conjunto de regras para pesquisas
            // contains [c] = search insensitive (nao considera letras identicas)
            let predicate = NSPredicate(format: "title contains [c] %@", filtering)
            fetchRequest.predicate = predicate
        }
       
        // possui
        fetchedResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultController.delegate = self as? NSFetchedResultsControllerDelegate
       
        do {
            try fetchedResultController.performFetch()
        } catch  {
            print(error.localizedDescription)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
        AppUtility.lockOrientation(.portrait)
            //collectionView.reloadData()
       }
    
    override func viewWillDisappear(_ animated: Bool) {
        AppUtility.lockOrientation(.all)
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

extension GamesCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GamesCollectionViewCell", for: indexPath) as! GamesCollectionViewCell
           
        let game = fetchedResultController.fetchedObjects?[indexPath.row]
        
        //gamesModelObject?.title = game?.title
        var text: String = ""
        if let releaseDate = game?.releaseDate {
                  let formatter = DateFormatter()
                  formatter.dateStyle = .long
                  formatter.locale = Locale(identifier: "pt-BR")
                text = "Lançamento: " + formatter.string(from: releaseDate)
            //gamesModelObject?.description = text
        }
        var ivCover: UIImage
        if let image = game?.cover as? UIImage {
                    ivCover = image
               } else {
            ivCover = UIImage(named: "noCoverFull")!
            
               }
            //gamesModelObject?.imageName = ivCover
        let gamesModelObject = GamesCollectionViewCellModel( game!.title!, text, ivCover)
        
        //else {return cell}
        //let row = indexPath.row
        cell.populate(model: gamesModelObject)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = fetchedResultController?.fetchedObjects?.count ?? 0
        collectionView.backgroundView = count == 0 ? label : nil
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: (collectionView.frame.height )/5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
