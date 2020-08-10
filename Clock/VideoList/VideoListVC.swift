//
//  ViewController.swift
//  Clock
//
//  Created by Tommy Martin on 8/1/20.
//  Copyright © 2020 Unanonymous. All rights reserved.
//

import UIKit
import AVKit
import SnapKit

class VideoListVC: UIViewController {
    private let dataProvider: VideoListDataProvider
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        return UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    }()
 
    init(dataProvider: VideoListDataProvider) {
        self.dataProvider = dataProvider
        super.init(nibName: nil, bundle: nil)
        
        // Setup UI
        view.backgroundColor = .black
        setupCollectionView()
        
        dataProvider.delegate = self
        dataProvider.requestNextPage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCollectionView() {
        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: VideoCell.reuseIdentifier)
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.showsVerticalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.bottom.top.equalToSuperview()
        }
    }
}

extension VideoListVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataProvider.videos.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: VideoCell.reuseIdentifier,
            for: indexPath) as? VideoCell
            else {
                fatalError("Make sure VideoCell is registered!")
        }
        
        cell.configure(video: dataProvider.videos[indexPath.item])
        if !children.contains(cell.playerController) {
            addChild(cell.playerController)
            cell.playerController.didMove(toParent: self)
        }
        
        return cell
    }
}

extension VideoListVC: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return view.bounds.size
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // TODO: Only update if the index changes
        let index = Int(collectionView.contentOffset.y / view.bounds.height)
        guard let cell = collectionView.cellForItem(at: IndexPath(item: index, section: 0)) as? VideoCell else {
            fatalError("Cell does not exist at index: \(index). Make sure the index calculation is correct.")
        }
        
        children.compactMap { $0 as? LoopingAVPlayerViewController }.forEach {
            if $0 != cell.playerController {
                $0.stopPlaying()
            }
        }
        
        cell.playerController.queuePlayer.play()
    }
}

extension VideoListVC: VideoListDataProviderDelegate {
    func videoListDidUpdate() {
        collectionView.reloadData()
    }
    
    func videoListDidFailToUpdate(error: VideoListDataProviderError) {
        // TODO: Alert the user!
    }
}
