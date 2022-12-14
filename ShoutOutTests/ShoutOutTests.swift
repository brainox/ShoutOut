//
//  ShoutOutTests.swift
//  ShoutOutTests

import XCTest
import UIKit
import CoreData

@testable import ShoutOut

class ShoutOutTests: XCTestCase {
	
	var systemUnderTest: ShoutOutDraftsViewController!
	
	override func setUp() {
		super.setUp()
		// Put setup code here. This method is called before the invocation of each test method in the class.
		
		let storyboard = UIStoryboard(name: "Main",
		                              bundle: Bundle.main)
		let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        systemUnderTest = (navigationController.viewControllers[0] as! ShoutOutDraftsViewController)
		
		UIApplication.shared.keyWindow!.rootViewController = systemUnderTest
		
		// Using the preloadView() extension method
		navigationController.preloadView()
		systemUnderTest.preloadView()
	}
	
	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
		super.tearDown()
	}
	
    func testManagedObjectContext() {
        let managedObjectContext = createMainContextInMemory()
        self.systemUnderTest.managedObjectContext = managedObjectContext
        XCTAssertNotNil(self.systemUnderTest.managedObjectContext)
    }
}

func createMainContextInMemory() -> NSManagedObjectContext {
    // Initialize NSManagedObjectModel
    let modelUrl = Bundle.main.url(forResource: "ShoutOut", withExtension: "momd")
    guard let model = NSManagedObjectModel(contentsOf: modelUrl!) else { fatalError("Model Not Found")}
    
    // Configure NSPersistentStoreCoordinator with an NSPersistentStore
    let persistentStore = NSPersistentStoreCoordinator(managedObjectModel: model)
    
    
    
    try! persistentStore.addPersistentStore(ofType: NSInMemoryStoreType, configurationName: nil, at: nil)
    
    
    
    // Create and return NSManagedObjectContext
    let context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    context.persistentStoreCoordinator = persistentStore
    
    return context
}

extension UIViewController {
	func preloadView() {
		_ = view
	}
}
