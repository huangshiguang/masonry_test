//
//  NextTableViewCell.h
//  
//
//  Created by 黄世光 on 2017/3/14.
//
//

#import <UIKit/UIKit.h>
#import "NextModel.h"
@interface NextTableViewCell : UITableViewCell
//数据模型
@property (nonatomic,strong) NextModel *homeModel;

//我们最后得到cell的高度的方法
-(CGFloat)rowHeightWithCellModel;
@end
