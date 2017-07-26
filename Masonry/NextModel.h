//
//  NextModel.h
//  Masonry
//
//  Created by 黄世光 on 2017/3/14.
//  Copyright © 2017年 黄世光. All rights reserved.
//

#import <UIKit/UIKit.h>  

@interface NextModel : NSObject
@property (nonatomic,copy) NSString *icon; //图片
@property (nonatomic,copy) NSString *content; //内容的label
//单元格的高度
@property (nonatomic,assign) CGFloat cellHeight;

@end
