//
//  NextTableViewCell.m
//  
//
//  Created by 黄世光 on 2017/3/14.
//
//

#import "NextTableViewCell.h"
#import "Masonry.h"
//头像的高度
#define iconH  80
#define iconW 100
#define KScreenW [UIScreen mainScreen].bounds.size.width
//间距
#define  marginW 10
@interface NextTableViewCell()
@property (nonatomic,weak)UIImageView *icon;
@property (nonatomic,weak)UILabel *content;
@property (nonatomic,weak)UIImageView *line;

@end
@implementation NextTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpUI];
    }
    return self;
}
-(void)setUpUI{
    UIImageView *icon = [UIImageView new];
    icon.contentMode = UIViewContentModeScaleToFill;
    icon.clipsToBounds = YES;
    [self.contentView addSubview:icon];
    self.icon = icon;
    UILabel *content=[UILabel new];
    content.numberOfLines = 0; //多行显示
    content.font=[UIFont systemFontOfSize:16];
    [self.contentView addSubview:content];
    self.content = content;
    //3.底部添加一条线
    UIImageView *line=[UIImageView new];
    line.backgroundColor=[UIColor grayColor];
    [self.contentView addSubview:line];
    self.line = line;
    //约束
    __weak typeof(self)weakSelf = self;
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(iconH);
        make.width.mas_equalTo(iconW);
        make.top.equalTo(weakSelf.mas_top).offset(marginW);//距离顶部
        make.centerX.equalTo(weakSelf.mas_centerX);
    }];
    
    [self.content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.icon.mas_bottom).offset(marginW);//距离底部
        make.left.equalTo(weakSelf.mas_left).offset(marginW);
        make.right.equalTo(weakSelf.mas_right).offset(-marginW);
        //文本高度 我们在得到模型的时候再传递
    }];
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(0.5);
        make.left.equalTo(weakSelf.mas_left).offset(0);
        make.right.equalTo(weakSelf.mas_right).offset(0);
        make.bottom.equalTo(weakSelf.mas_bottom).offset(0);
    }];
}
-(void)setHomeModel:(NextModel *)homeModel{
    _homeModel = homeModel;
    self.icon.image = [UIImage imageNamed:homeModel.icon];
    self.content.text = homeModel.content;
}
//在表格cell中 计算出高度
-(CGFloat)rowHeightWithCellModel
{
    
//     2. 更新约束
   [self layoutIfNeeded];
//    CGFloat h = CGRectGetMaxY(self.content.frame);
    //用sizetofit可以指定宽度精确的获取高度
    //只用这个方法获取到的frame是不准确的
    CGFloat labelH = [self.content sizeThatFits:CGSizeMake(KScreenW-marginW*2, 0)].height;
    return  marginW + iconH + marginW +labelH + marginW ; //最大的高度+10
}
-(CGFloat)contentLabelH
{
    CGFloat h=[self.homeModel.content boundingRectWithSize:CGSizeMake(([UIScreen mainScreen].bounds.size.width)-2*marginW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil].size.height;
    
    return h;
}
@end
