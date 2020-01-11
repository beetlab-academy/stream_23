//
//  StorageCoordinator.swift
//  StorageSystems
//
//  Created by Danya on 09/01/2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import UIKit

class ServicesAssembly {
    var storageSevice: StorageService {
        return StorageServiceImpl()
    }
    
    var identityService: IdentityService {
        return IdentityServiceImpl()
    }
}

public class CoordinatorAssembly {
    private let sevicesAssembly = ServicesAssembly()
    public init() {}
    public var coordinator: StorageCoordinator {
        let coordinator = StorageCoordinator()
        coordinator.storageService = sevicesAssembly.storageSevice
        coordinator.identityService = sevicesAssembly.identityService
        return coordinator
    }
}


public class StorageCoordinator {
    public var window: UIWindow?
    
    var identityService: IdentityService!
    var storageService: StorageService?
    
    private var info = ProductInformation()      // ????? Если все свойства заполняем на разных vc
    
    //-----state-----//
    
    private var scanStartVC: ScanStartController?
    private var prodInfoStartVC: ProductTitleController?
    private var idVC: ProductIDController?
    private var priceVC: ProductPriceController?
    
    
    private var scannedCode = ""
    
    //---------------//
    
    public var flowCompleted: (() -> Void)?
    
    public func startVC() -> UIViewController {
        switch identityService.chooseService() {
        case .enterProductInformation:
            let prodInfoStartVC = vc("ProductTitleController") as! ProductTitleController       // ?????????????
            prodInfoStartVC.output = self                                                       // ?????????????
            self.prodInfoStartVC = prodInfoStartVC
            return prodInfoStartVC
        case .scanProduct:
            let scanStartVC = vc("ScanStartController") as! ScanStartController
            scanStartVC.output = self
            self.scanStartVC = scanStartVC
            return scanStartVC
        }
    }
    
    public func start() {
        if identityService?.chooseService() == .enterProductInformation {                       // ?????????????
            let prodInfoStartVC = vc("ProductTitleController") as! ProductTitleController       // ?????????????
            prodInfoStartVC.output = self                                                       // ?????????????
            window?.rootViewController = prodInfoStartVC
            self.prodInfoStartVC = prodInfoStartVC
        } else if identityService?.chooseService() == .scanProduct {
            let scanStartVC = vc("ScanStartController") as! ScanStartController
            scanStartVC.output = self
            window?.rootViewController = scanStartVC
            self.scanStartVC = scanStartVC
        }
        
        window?.makeKeyAndVisible()
    }
}


// Product Information Flow

extension StorageCoordinator: ProductTitleControllerOutput {
    func getTitle(_ title: String) {
        info.title = title
        let idVC = vc("ProductIDController") as! ProductIDController
        idVC.output = self
        prodInfoStartVC?.present(idVC, animated: true, completion: nil)
        self.idVC = idVC
    }
}

extension StorageCoordinator: ProductIDControllerOutput {
    func getID(_ id: String) {
        info.id = id
        let priceVC = vc("ProductPriceController") as! ProductPriceController
        priceVC.output = self
        idVC?.present(priceVC, animated: true, completion: nil)
        self.priceVC = priceVC
    }
}

extension StorageCoordinator: ProductPriceControllerOutput {
    func getPrice(_ price: String) {
        if let price = Float(price) {
            info.price = price
            let finishVC = vc("ProductInfoFinishController") as! ProductInfoFinishController
            finishVC.storageService = storageService
            finishVC.info = info
            finishVC.output = self
            
            priceVC?.present(finishVC, animated: true, completion: nil)
        } else {
            print("некорректный ввод")
        }
    }
}

extension StorageCoordinator: ProductInfoFinishControllerOutput {
    func completeFlow() {
        flowCompleted?() // ???
    }
}


// Scan Flow

extension StorageCoordinator: ScanStartControllerOutput {
    func getProductQRCode(_ qr: String) {
        scannedCode = qr
        let finishVC = vc("ScanFinishController") as! ScanFinishController
        finishVC.output = self
        scanStartVC?.present(finishVC, animated: true, completion: nil)
    }
}

extension StorageCoordinator: ScanFinishControllerOutput {
    var qrCode: String? {
        get {
            return ""
        }
        set {
            
        }
    }
    
   
    
 
}


private class LocalBundle {
    static var bundle: Bundle {
        return Bundle(for: LocalBundle.self)
    }
}

private extension StorageCoordinator {
    func vc(_ id: String) -> UIViewController {
        let st = UIStoryboard(name: "Main", bundle: LocalBundle.bundle)
        return st.instantiateViewController(withIdentifier: id)
    }
}
