//
//  ImageGalleryTableViewController.swift
//  Image_Gallery
//
//  Created by freddy on 24/01/2018.
//  Copyright © 2018 jamfly. All rights reserved.
//

import UIKit

class ImageGalleryTableViewController: UITableViewController {

    // MARK: - Model

    private var galleryInsert = ["1", "2", "3"]
    private var galleryRemove = [String]()
    private var gallerys: [[String]] {
        return [galleryInsert, galleryRemove]
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return gallerys[section].count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
            return "Recently Deleted"
        }
        return ""
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GalleryTableCell", for: indexPath)
        cell.textLabel?.text = gallerys[indexPath.section][indexPath.row]
        
        return cell
    
    }
 
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if indexPath.section == 0 {
                let remove = galleryInsert.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                galleryRemove.append(remove)
            } else {
                galleryRemove.remove(at: indexPath.row)
            }
        }
        tableView.reloadData()
    }
    
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let reDelete = UISwipeActionsConfiguration() 
        
        
        return reDelete
    }
    
    // MARK: - action
    
    @IBAction func addMoreGallery(_ sender: UIBarButtonItem) {
        galleryInsert += ["Untitled".madeUnique(withRespectTo: galleryInsert)]
        tableView.reloadData()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
