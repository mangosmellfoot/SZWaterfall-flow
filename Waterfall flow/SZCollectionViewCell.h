//
//  SZCollectionViewCell.h
//  Waterfall flow
//
//  Created by zhaotai on 16/7/22.
//  Copyright © 2016年 zhaotai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SZCollectionViewCell : UICollectionViewCell

+ (instancetype)SZCollectionViewCellWithUICollectionView:(UICollectionView *)collectionView andIndexPath:(NSIndexPath *)indexPath;

- (void)selectCell;

- (void)deselectCell;

@end
