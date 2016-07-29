//
//  UICollectionViewCell+Register.h
//  练习
//
//  Created by MS on 15-11-18.
//  Copyright (c) 2015年 QianFeng-9-Good－张盛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionViewCell (Register)

+ (instancetype)cellWithRegisterClassColletionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)indexPath;

+ (instancetype)cellWithRegisterNibColletionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)indexPath;

@end
