//
//  SZCollectionViewCell.m
//  Waterfall flow
//
//  Created by zhaotai on 16/7/22.
//  Copyright © 2016年 zhaotai. All rights reserved.
//

#import "SZCollectionViewCell.h"
#import "Masonry.h"
#import "UICollectionViewCell+Register.h"

@interface SZCollectionViewCell ()

@property (weak,nonatomic)UILabel * label;

@end

@implementation SZCollectionViewCell

+ (instancetype)SZCollectionViewCellWithUICollectionView:(UICollectionView *)collectionView andIndexPath:(NSIndexPath *)indexPath{
    SZCollectionViewCell * cell = [self cellWithRegisterClassColletionView:collectionView forIndexPath:indexPath];
    cell.label.text = [NSString stringWithFormat:@"~%d~",indexPath.row];
    return cell;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel * label = [[UILabel alloc] init];
        [self addSubview:label];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:20.f];
        self.backgroundColor = [UIColor blueColor];
        label.backgroundColor = [UIColor blackColor];
        label.textColor = [UIColor whiteColor];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.offset(10);
            make.bottom.right.offset(-10);
        }];
        self.label = label;
    }
    return self;
}

- (void)selectCell{
    self.label.backgroundColor = [UIColor whiteColor];
    self.label.textColor = [UIColor blackColor];
}

- (void)deselectCell{
    self.label.backgroundColor = [UIColor blackColor];
    self.label.textColor = [UIColor whiteColor];
}

@end
