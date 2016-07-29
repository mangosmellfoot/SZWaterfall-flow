//
//  SZCollectionViewWaterFlowLayout.m
//  Waterfall flow
//
//  Created by zhaotai on 16/7/29.
//  Copyright © 2016年 zhaotai. All rights reserved.
//

#import "SZCollectionViewWaterFlowLayout.h"

#define collectionWidth self.collectionView.frame.size.width

static const CGFloat SZDefaultRowMargain = 10;      //行间距
static const CGFloat SZDefaultColumnMargain = 10;   //列间距
static const UIEdgeInsets SZDefaultInsets = {10, 10, 10, 10};   //组间距
static const uint SZDefaultColumnCount = 2;         //默认列数

@interface SZCollectionViewWaterFlowLayout ()

@property (nonatomic,assign) CGFloat itemWidth;                 //cell的宽
@property (nonatomic,strong) NSMutableArray * arrayMaxYs;       //每列最大Y值
@property (nonatomic,strong) NSMutableArray * arrayCellAttrs;   //cell的布局属性

@end

@implementation SZCollectionViewWaterFlowLayout

#pragma mark - getter and setter
//
- (NSMutableArray *)arrayMaxYs{
    if (!_arrayMaxYs) {
        _arrayMaxYs = [[NSMutableArray alloc] init];
    }
    return _arrayMaxYs;
}
//
- (NSMutableArray *)arrayCellAttrs{
    if (!_arrayCellAttrs) {
        _arrayCellAttrs = [[NSMutableArray alloc] init];
    }
    return _arrayCellAttrs;
}
//
- (CGFloat)itemWidth{
    if (!_itemWidth) {
        _itemWidth = (collectionWidth - SZDefaultInsets.left - SZDefaultInsets.right + SZDefaultColumnMargain) / SZDefaultColumnCount - SZDefaultColumnMargain;
    }
    return _itemWidth;
}
//
- (void)setArrayItemHeight:(NSArray *)arrayItemHeight{
    _arrayItemHeight = arrayItemHeight;
    [self.collectionView reloadData];
}

#pragma mark - SuperCode
//collectionView的滚动高度
- (CGSize)collectionViewContentSize{
    CGFloat MaxY = [self.arrayMaxYs[0] doubleValue];
    for (NSNumber * columnY in self.arrayMaxYs) {
        CGFloat floatY = [columnY doubleValue];
        MaxY = floatY > MaxY ? floatY : MaxY;
    }
    return CGSizeMake(collectionWidth, MaxY + SZDefaultInsets.bottom);
}
//每次reloadData刷新而调用的
- (void)prepareLayout{
    [super prepareLayout];
    
    _itemWidth = (collectionWidth - SZDefaultInsets.left - SZDefaultInsets.right + SZDefaultColumnMargain) / SZDefaultColumnCount - SZDefaultColumnMargain;
    
    //重置每一列Y的值
    [self.arrayMaxYs removeAllObjects];
    for (char i = 0; i < SZDefaultColumnCount; i++) {
        [self.arrayMaxYs addObject:@(SZDefaultInsets.top)];
    }
    
    //计算所有的cell属性
    [self.arrayCellAttrs removeAllObjects];
    NSUInteger count = [self.collectionView numberOfItemsInSection:0];
    for (NSUInteger i = 0; i < count; i++) {
        NSIndexPath * indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes * attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
        [self.arrayCellAttrs addObject:attrs];
    }
}
//所有collection上的布局属性
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
    return self.arrayCellAttrs;
}
//返回每个item的frame
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    //找出最短的一列
    NSUInteger minColunm = 0;
    for(NSUInteger i = 0; i < SZDefaultColumnCount; i++){
        CGFloat floatY = [self.arrayMaxYs[i] doubleValue];
        CGFloat minY = [self.arrayMaxYs[minColunm] doubleValue];
        minColunm = floatY < minY ? i : minColunm;
    }
    
    //计算出当前应有的frame
    CGFloat itemX = SZDefaultInsets.left + (SZDefaultColumnMargain + self.itemWidth) * minColunm;
    CGFloat itemY = [self.arrayMaxYs[minColunm] doubleValue] + SZDefaultRowMargain;
    CGFloat itemHeight = [self.arrayItemHeight[indexPath.item] doubleValue];
    
    //
    UICollectionViewLayoutAttributes * attris = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attris.frame = CGRectMake(itemX, itemY, self.itemWidth, itemHeight);
    
    //更新
    //self.arrayMaxYs[minColunm] = [NSNumber numberWithDouble:itemY + itemHeight];
    self.arrayMaxYs[minColunm] = @(CGRectGetMaxY(attris.frame));
    
    return attris;
}

#pragma mark - privateCode
//传入每个Item高度的初始化
- (instancetype)initWithArrayItemHeights:(NSArray *)arrayHeights{
    self = [super init];
    if (self) {
        _arrayItemHeight = arrayHeights;
    }
    return self;
}

@end
