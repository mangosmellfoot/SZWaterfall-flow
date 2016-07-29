//
//  SZCollectionViewWaterFlowLayout.h
//  Waterfall flow
//
//  Created by zhaotai on 16/7/29.
//  Copyright © 2016年 zhaotai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SZCollectionViewWaterFlowLayout : UICollectionViewFlowLayout
/**
 *  每个item的高的集合
 */
@property (nonatomic,strong) NSArray * arrayItemHeight;

/**
 *  传入每个Item高度的初始化
 *
 *  @param arrayHeights 每个item高度的数组
 *
 *  @return 初始化对象
 */
- (instancetype)initWithArrayItemHeights:(NSArray *)arrayHeights;

@end
