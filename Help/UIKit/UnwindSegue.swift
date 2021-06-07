//
//  UnwindSegue.swift
//  Help
//
//  Created by Sergey Lukaschuk on 07.06.2021.
//

import Foundation

 
// MARK: - Unwind Segue

/// Article https://developer.apple.com/documentation/uikit/resource_management/dismissing_a_view_controller_with_an_unwind_segue

/// Dismissing a View Controller with an Unwind Segue
/// Configure an unwind segue in your storyboard file that dynamically chooses the most appropriate view controller to display next.
/// To handle the dismissal of a view controller, create an unwind segue.
/// Unlike the segues that you use to present view controllers, an unwind segue promises the dismissal of the current view controller without promising a specific target for the resulting transition. Instead, UIKit determines the target of an unwind segue programmatically at runtime.
/// UIKit determines the target of an unwind segue at runtime, so you aren’t restricted in how you set up your view controller hierarchies.
/// Consider a scenario where two view controllers present the same child view controller, as shown in the following figure. You could add complicated logic to determine which view controller to display next, but such a solution wouldn’t scale well. Instead, UIKit provides a simple programmatic solution that scales to any number of view controllers with minimal effort.

/*
@IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue) {
    // Connect a Triggering Object to the Exit Control
}
*/
