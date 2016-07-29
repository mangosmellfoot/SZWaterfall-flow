//
//  UICollectionViewCell+Register.m
//  练习
//
//  Created by MS on 15-11-18.
//  Copyright (c) 2015年 QianFeng-9-Good－张盛. All rights reserved.
//

#import "UICollectionViewCell+Register.h"

@implementation UICollectionViewCell (Register)

+ (instancetype)cellWithRegisterClassColletionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)indexPath
{
    NSString * className = NSStringFromClass([self class]);
    [collectionView registerClass:[self class] forCellWithReuseIdentifier:className];
    return [collectionView dequeueReusableCellWithReuseIdentifier:className forIndexPath:indexPath];
}

+ (instancetype)cellWithRegisterNibColletionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)indexPath
{
    NSString * className = NSStringFromClass([self class]);
    UINib * nib = [UINib nibWithNibName:className bundle:nil];
    [collectionView registerNib:nib forCellWithReuseIdentifier:className];
    return [collectionView dequeueReusableCellWithReuseIdentifier:className forIndexPath:indexPath];
    
}

@end
