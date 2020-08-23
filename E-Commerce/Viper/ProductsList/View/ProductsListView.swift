//
//  ProductsListView.swift
//  E-Commerce
//
//  Created by Muhammad Waqar Ahmed on 17/08/2020.
//  Copyright © 2020 MWA. All rights reserved.
//

import UIKit

class ProductsListView: BaseViewController {
    //MARK: - Properties
    var presenter: ProductListPresenterProtocol?
    var productsList = [Product]()
    var productsBrandNameList: [String]? = [String]()
    var lastSelectedBrand :Int = 0
    var isFilterApply = false
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent  ///Set StatusBar mode to light
    }
    //MARK: - IBOutlets
    @IBOutlet var productsListCollectionView: UICollectionView!
    @IBOutlet var brandsListCollectionView: UICollectionView!
    @IBOutlet private weak var searchBar: UITextField!
    
    //MARK: - ViewController Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Functions
    
    ///Setup View
    
    private func setUpView(){
        
        ProductListRouter.createProductListModule(productListRef: self)
        searchBar.addTarget(self, action: #selector(self.textFieldDidChange(sender:)), for: .editingChanged)
        loadProductsList()
    }
    
    func loadProductsList() {
        showHud()
        
        presenter?.fetchProductList(with: Constants.LATEST_ROUTE, method: HTTPMethod.GET)
    }
    
    //MARK: - IBActions
    @IBAction func filterButtonPressed(_ sender : UIButton){
        presenter?.showFiltersView(with: productsList, from: self)
    }
}

// MARK: - ProductListViewProtocol
extension ProductsListView: ProductListViewProtocol {
    func reloadFilterView(with products: [Product]) {
        hideHud()
        setDataAndReloadView(products: products, brands: productsBrandNameList)
    }
    
    
    func reloadView(with products: [Product], tags: [String]) {
        hideHud()
        setDataAndReloadView(products: products, brands: tags)
        
    }
    
    func showError(with error: String) {
        hideHud()
        reloadProduct(msg: error)
    }
    
    private func setDataAndReloadView(products :[Product]?, brands : [String]?){
        productsList = products ?? [Product]()
        productsBrandNameList = brands ?? []
        reloadProduct(msg: nil)
        brandsListCollectionView.reloadData()
    }
    
    private func reloadProduct(msg: String?){
        
        if (productsList.count  <= 0 ){
            self.productsListCollectionView.showDescriptionViewWithImage(description: msg ?? "No data found")
            
        } else {
            self.productsListCollectionView.hideDescriptionView()
        }
        productsListCollectionView.reloadData()
    }
    
    
}


// MARK: - UICollectionViewDataSource

extension ProductsListView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == brandsListCollectionView{
            return productsBrandNameList?.count ?? 0
        }else if collectionView == productsListCollectionView{
            return productsList.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if  collectionView == brandsListCollectionView,
            let brandsCollectionViewCell : BrandsCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BrandsCollectionViewCell", for: indexPath) as? BrandsCollectionViewCell{
            brandsCollectionViewCell.setBrandInfo(brandName: productsBrandNameList?[indexPath.row], selectedPosition: lastSelectedBrand, currentPosition: indexPath.row)
            return brandsCollectionViewCell
        }
        else if  collectionView == productsListCollectionView, let productsCollectionViewCell : ProductsCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductsCollectionViewCell", for: indexPath) as? ProductsCollectionViewCell{
            productsCollectionViewCell.product = productsList[indexPath.row]
            return productsCollectionViewCell
        }
        return UICollectionViewCell()
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ProductsListView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == brandsListCollectionView{
            let paths = lastSelectedBrand == indexPath.row ? [indexPath] : [indexPath, IndexPath.init(row: lastSelectedBrand, section: indexPath.section)]
            lastSelectedBrand = indexPath.row
            
            brandsListCollectionView.reloadItems(at: paths)
            filterProducts(searchKeyWord: searchBar.text)
            moveProductsCollectionViewToTop() 
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == brandsListCollectionView{
            let cellWidth = (productsBrandNameList?[indexPath.row].size(withAttributes:[.font: UIFont.systemFont(ofSize:15)]).width ?? 0) + 20
            return CGSize(width: cellWidth, height: 34.0)
        }else if collectionView == productsListCollectionView{
            let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout
            let space: CGFloat = (flowLayout?.minimumInteritemSpacing ?? 0.0) + (flowLayout?.sectionInset.left ?? 0.0) + (flowLayout?.sectionInset.right ?? 0.0)
            let size:CGFloat = (self.view.frame.size.width - space) / 2.0
            return CGSize(width: size, height: (size + (size * 0.3)))
        }
        return CGSize.zero
    }
    private func moveProductsCollectionViewToTop() {
        productsListCollectionView.setContentOffset(.zero, animated: true)
    }
}


// MARK: - UITextFiledDelegate

extension ProductsListView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    @objc func textFieldDidChange(sender: UITextField){
        filterProducts(searchKeyWord: sender.text)
    }
    
}


// MARK: - Filter Methods

extension ProductsListView {
    func filterProducts(searchKeyWord: String?) {
        
        guard (productsBrandNameList?.count ?? 0 > 0), let brandName = productsBrandNameList?[lastSelectedBrand] else {
            return
        }
        
        if let searchKeyWord = searchKeyWord {
            let searchString = searchKeyWord.trimWhiteSpace()
            if searchString != "", searchString.count > 0 {
                presenter?.filter(brand: brandName, phone: searchString, isFilterApply: isFilterApply, audioJack: false, haveGPS: false, minPrice: nil, maxPrice: nil)
            } else {
                presenter?.filter(brand: brandName, phone: "", isFilterApply: isFilterApply, audioJack: false, haveGPS: false,  minPrice: nil, maxPrice: nil)
            }
        } else {
            presenter?.filter(brand: brandName, phone: "", isFilterApply: isFilterApply, audioJack: false, haveGPS: false, minPrice: nil, maxPrice: nil)
        }
    }
}


extension ProductsListView: FilterProtocolDelegate {
    func applyFilter(isFilterApply: Bool, audioJack: Bool, isGPS: Bool, minPrice: Double?, maxPrice: Double?) {
        guard (productsBrandNameList?.count ?? 0 > 0), let brandName = productsBrandNameList?[lastSelectedBrand] else {
            return
        }
        presenter?.filter(brand: brandName, phone: "", isFilterApply: isFilterApply, audioJack: audioJack,haveGPS: isGPS, minPrice: minPrice, maxPrice: maxPrice)
    }
    
    
}
