//
//  ViewController.m
//  DatVeXemPhim
//
//  Created by Dung Duong on 11/24/16.
//  Copyright © 2016 Tai Duong. All rights reserved.
//

#import "ViewController.h"
#import "HelperFile.h"

@interface CustomCell : UITableViewCell
@property (nonatomic) UIImageView *imgPro;
@property (nonatomic) UILabel *lblName;
@property (nonatomic) UILabel *lblRating;
@end

@implementation CustomCell
-(void)setUpCell
{
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    self.backgroundColor = [UIColor colorWithRed:116.f/255 green:192.f/255 blue:241.f/255 alpha:1];
    [self letLblName];
    [self letLblRating];
    [self letImgPro];
    [self addConstraintsWithFormat:@"V:|-2-[v0]-2-|" andViews:[NSArray arrayWithObject:self.imgPro]];
    [self addConstraintsWithFormat:@"V:|-5-[v0(20)]" andViews:[NSArray arrayWithObjects:self.lblName, nil]];
    [self addConstraintsWithFormat:@"H:|-2-[v0(80)]-5-[v1]|" andViews:[NSArray arrayWithObjects:self.imgPro, self.lblName, nil]];
    self.lblRating.translatesAutoresizingMaskIntoConstraints = NO;
    [self.lblRating.heightAnchor constraintEqualToConstant:20].active = YES;
    [self.lblRating.leftAnchor constraintEqualToAnchor:self.lblName.leftAnchor].active = YES;
    [self.lblRating.widthAnchor constraintEqualToAnchor:self.lblName.widthAnchor].active = YES;
    [self.lblRating.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
}
-(void)letLblName
{
    self.lblName = [[UILabel alloc] init];
    self.lblName.text = @"Helllo!!!!!";
    self.lblName.textAlignment = NSTextAlignmentLeft;
    self.lblName.font = [UIFont boldSystemFontOfSize:17];
    self.lblName.textColor = [UIColor whiteColor];
    [self addSubview:self.lblName];
}
-(void)letLblRating
{
    self.lblRating = [[UILabel alloc] init];
    self.lblRating.text = @"Rating : 8.1 points";
    self.lblRating.textAlignment = NSTextAlignmentLeft;
    self.lblRating.font = [UIFont systemFontOfSize:14];
    self.lblRating.textColor = [UIColor whiteColor];
    [self addSubview:self.lblRating];
}
-(void)letImgPro
{
    self.imgPro = [[UIImageView alloc] init];
    self.imgPro.contentMode = UIViewContentModeScaleAspectFill;
    self.imgPro.backgroundColor = [UIColor blueColor];
    [self addSubview:self.imgPro];
}
@end




@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;
@end

@implementation ViewController
{
    NSString *cell_ID ;
    UISegmentedControl *segCtrl;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    cell_ID = @"cellID";
    self.title = @"Lich Chieu Phim";
    [self setUpTableView];
    [self setUpSegCtrl];
}
-(void)setUpTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self.tableView registerClass:[CustomCell class] forCellReuseIdentifier:cell_ID];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.frame = self.view.frame;
    [self.view addSubview:self.tableView];
}
-(void)setUpSegCtrl
{
    segCtrl = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"Phim dang chieu",@"Phim sap chieu", nil]];
    segCtrl.frame = CGRectMake(0, 0, 200, 30);
    [segCtrl setTintColor:[UIColor yellowColor]];
    self.tableView.tableHeaderView = segCtrl;
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}
//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 1;
//}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_ID forIndexPath:indexPath];
    [cell setUpCell];
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 84;
}
@end
