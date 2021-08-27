//
//  EmployeeListVCExtension.swift
//  CoreDataWithRAVI
//
//  Created by puneet pal on 26/08/21.
//

import Foundation
import UIKit

extension EmployeeListVC : UITableViewDelegate, UITableViewDataSource
{

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.employees!.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "employeeCell") as! EmployeeListCell
        let employee = self.employees![indexPath.row]
       
        cell.lblEmployeeName.text = employee.name
        cell.imgProfilePicture.image = UIImage(data: employee.profilePicture!)

        return cell
    }
}
