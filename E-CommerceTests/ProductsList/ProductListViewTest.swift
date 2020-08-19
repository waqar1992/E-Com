//
//  ProductListViewTest.swift
//  E-CommerceTests
//
//  Created by Muhammad Waqar Ahmed on 19/08/2020.
//  Copyright © 2020 MWA. All rights reserved.
//

import XCTest
@testable import E_Commerce

class ProductListViewTest: XCTestCase {

    let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
    
    
    func prepareController() -> ProductsListView? {
        let controller = storyboard.instantiateViewController(withIdentifier: "ProductsListView") as? ProductsListView
        _ = controller?.view
        return controller
    }
    
    func testProduct() {
        guard let plv = prepareController() else {
            return
        }
        
        let fakeProducts = [Product.init(id: 1, brand: "Apple", phone: "iPhone 6", picture: nil, sim: "No Sim", resolution: "123", audioJack: "No", gps: "NO", battery: "1234", priceEur: 15.0),
        Product.init(id: 1, brand: "Apple", phone: "iPhone 6", picture: nil, sim: "No Sim", resolution: "123", audioJack: "No", gps: "NO", battery: "1234", priceEur: 15.0)]
        
        plv.productsList = fakeProducts
        
        XCTAssertEqual(plv.productsList.count, 2)
    }
    
    func testCollectioView() {
        
        
        guard let plv = prepareController() else {
            return
        }
        
        let fakeProducts = [Product.init(id: 1, brand: "Apple", phone: "iPhone 6", picture: nil, sim: "No Sim", resolution: "123", audioJack: "No", gps: "NO", battery: "1234", priceEur: 15.0),
        Product.init(id: 1, brand: "Apple", phone: "iPhone 6", picture: nil, sim: "No Sim", resolution: "123", audioJack: "No", gps: "NO", battery: "1234", priceEur: 15.0),Product.init(id: 1, brand: "Apple", phone: "iPhone 6", picture: nil, sim: "No Sim", resolution: "123", audioJack: "No", gps: "NO", battery: "1234", priceEur: 15.0)]
        
        plv.productsList = fakeProducts
        plv.productsListCollectionView.reloadData()
        
        XCTAssertEqual(plv.productsListCollectionView.numberOfItems(inSection: 0), 3)
    }
    
    func testCollectioViewBrandCell() {
        
        
        guard let plv = prepareController() else {
            return
        }
        
        let fakeProducts = [Product.init(id: 1, brand: "Apple", phone: "iPhone 6", picture: nil, sim: "No Sim", resolution: "123", audioJack: "No", gps: "NO", battery: "1234", priceEur: 15.0),
        Product.init(id: 1, brand: "Apple", phone: "iPhone 6", picture: nil, sim: "No Sim", resolution: "123", audioJack: "No", gps: "NO", battery: "1234", priceEur: 15.0),Product.init(id: 1, brand: "Apple", phone: "iPhone 6", picture: nil, sim: "No Sim", resolution: "123", audioJack: "No", gps: "NO", battery: "1234", priceEur: 15.0)]
        
        plv.productsList = fakeProducts
        plv.productsListCollectionView.reloadData()
        
        plv.productsBrandNameList = ["All", "Apple"]
        plv.brandsListCollectionView.reloadData()
        
        let index = IndexPath(item: 1, section: 0)
        
        guard let cell = plv.collectionView(plv.brandsListCollectionView, cellForItemAt: index) as? BrandsCollectionViewCell else {
            fatalError("The deque cell is not an instance of BrandsCollectionViewCell.")
        }
        
        cell.setBrandInfo(brandName: "Apple", selectedPosition: 0, currentPosition: 0)
        
        XCTAssertEqual(cell.brandNameLabel.text, "Apple")
    }
    
    func testCollectioViewProductCell() {
        
        
        guard let plv = prepareController() else {
            return
        }
        
        let fakeProducts = [Product.init(id: 1, brand: "Apple", phone: "iPhone 6", picture: nil, sim: "No Sim", resolution: "123", audioJack: "No", gps: "NO", battery: "1234", priceEur: 15.0),
        Product.init(id: 1, brand: "Apple", phone: "iPhone 6", picture: nil, sim: "No Sim", resolution: "123", audioJack: "No", gps: "NO", battery: "1234", priceEur: 15.0),Product.init(id: 1, brand: "Apple", phone: "iPhone 6", picture: nil, sim: "No Sim", resolution: "123", audioJack: "No", gps: "NO", battery: "1234", priceEur: 15.0)]
        
        plv.productsList = fakeProducts
        plv.productsListCollectionView.reloadData()
        
        let index = IndexPath(item: 1, section: 0)
        
        guard let cell = plv.collectionView(plv.productsListCollectionView, cellForItemAt: index) as? ProductsCollectionViewCell else {
            fatalError("The deque cell is not an instance of LocationCollectionViewCell.")
        }
        
        cell.product = fakeProducts[0]
        
        XCTAssertEqual(cell.product?.brand, "Apple")
        XCTAssertEqual(cell.productNameLabel.text, "iPhone 6")
        
        let priceStrig = String.init(format: "%0.2f", 15.0).asLocaleCurrency
        
        XCTAssertEqual(cell.productPriceLabel.text, priceStrig)
        
    }
   
    
}
