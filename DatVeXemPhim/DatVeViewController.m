//
//  DatVeViewController.m
//  DatVeXemPhim
//
//  Created by Dung Duong on 11/25/16.
//  Copyright © 2016 Tai Duong. All rights reserved.
//

#import "DatVeViewController.h"
#import "HelperFile.h"




@interface DatVeViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic) UILabel *lblManChieu;
@property (nonatomic) UIBarButtonItem *butXong;
@property (nonatomic) UILabel *lblABC;
@property (nonatomic) UILabel *lbl123;
@property (nonatomic) UICollectionView *colGhe;
@property (nonatomic) UIView *vGhe;

@end

@implementation DatVeViewController
{
    NSString *cell_ID;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Chon ghe";
    cell_ID = @"CellID";
    [self.navigationController.navigationBar setTranslucent:NO];
    self.view.backgroundColor = [UIColor colorWithWhite:1 alpha:1];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [self setUpViews];
}
-(void)setUpViews
{
    [self letLblManChieu];
    [self letButXong];
    [self letLblABC];
    [self letLbl123];
    [self letColGhe];
    [self letVGhe];
    [self.view addConstraintsWithFormat:@"V:|-10-[v0(30)]-10-[v1(340)]-10-[v2(30)]-10-[v3]-10-|" andViews:[NSArray arrayWithObjects:self.lblManChieu, self.colGhe, self.lbl123, self.vGhe,nil]];
    [self.view addConstraintsWithFormat:@"H:|-40-[v0]-5-|" andViews:[NSArray arrayWithObject:self.lblManChieu]];
    [self.view addConstraintsWithFormat:@"H:|-5-[v0(30)]-5-[v1]-5-|" andViews:[NSArray arrayWithObjects:self.lblABC, self.colGhe, nil]];
    [self.lblABC.topAnchor constraintEqualToAnchor:self.colGhe.topAnchor].active = YES;
    [self.lblABC.heightAnchor constraintEqualToAnchor:self.colGhe.heightAnchor].active = YES;
    [self.lbl123.leftAnchor constraintEqualToAnchor:self.colGhe.leftAnchor].active = YES;
    [self.lbl123.widthAnchor constraintEqualToAnchor:self.colGhe.widthAnchor].active = YES;
    [self.vGhe.leftAnchor constraintEqualToAnchor:self.colGhe.leftAnchor].active = YES;
    [self.vGhe.widthAnchor constraintEqualToAnchor:self.colGhe.widthAnchor].active = YES;
    
}
-(void)letLblManChieu
{
    self.lblManChieu = [[UILabel alloc] init];
    self.lblManChieu.backgroundColor = [UIColor colorWithRed:116.f/255 green:192.f/255 blue:241.f/255 alpha:1];
    self.lblManChieu.text = @"Screen";
    self.lblManChieu.font = [UIFont boldSystemFontOfSize:17];
    self.lblManChieu.textColor = [UIColor whiteColor];
    self.lblManChieu.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.lblManChieu];
}
-(void)letButXong
{
    self.butXong = [[UIBarButtonItem alloc] initWithTitle:@"Xong" style:UIBarButtonItemStyleDone target:self action:nil];
    self.navigationItem.rightBarButtonItem = self.butXong;
}
-(void)letLblABC
{
    self.lblABC = [[UILabel alloc] init];
    self.lblABC.numberOfLines = 10;
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    //paragraphStyle.lineSpacing = 5.f;
    paragraphStyle.lineHeightMultiple = 1.55f;
    //paragraphStyle.alignment = NSTextAlignmentCenter;
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"A\nB\nC\nD\nE\nF\nG\nH\nI\nJ" attributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:17],NSParagraphStyleAttributeName: paragraphStyle}];
    [self.lblABC setAttributedText:text];
    [self.lblABC setContentMode:UIViewContentModeCenter];
    //[self.lblABC setText:@"A\nB\nC\nD\nE\nG\nF\nH\nI\nJ"];
    self.lblABC.backgroundColor = [UIColor lightGrayColor];
    self.lblABC.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.lblABC];
}
-(void)letLbl123
{
    self.lbl123 = [[UILabel alloc] init];
    self.lbl123.numberOfLines = 1;
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.paragraphSpacing = 2.f;
    //paragraphStyle.lineHeightMultiple = 3.f;
    float spacing = 25.f;
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"0123456789" attributes:@{NSFontAttributeName : [UIFont boldSystemFontOfSize:17], NSParagraphStyleAttributeName : paragraphStyle, NSForegroundColorAttributeName : [UIColor whiteColor], NSKernAttributeName : @(spacing)}];
    //[text addAttribute:NSKernAttributeName value:@(spacing) range:NSMakeRange(0,text.length)];
    //self.lbl123.text = @"1    2     3     4     5     6     7     8     9     10";
    //self.lbl123.font = [UIFont boldSystemFontOfSize:17];
    //self.lbl123.textColor = [UIColor whiteColor];
    [self.lbl123 setAttributedText:text];
    
    self.lbl123.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.lbl123];
}
-(void)letColGhe
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    self.colGhe = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    self.colGhe.delegate = self;
    self.colGhe.dataSource = self;
    [self.colGhe registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cell_ID];
    self.colGhe.allowsMultipleSelection = YES;
    [self.view addSubview:self.colGhe];
}
-(void)letVGhe
{
    self.vGhe = [[UIView alloc] init];
    self.vGhe.backgroundColor = [UIColor lightGrayColor];
    
    UIView *vGheDangChon = [self letVofButtonWithColorOfButton:[UIColor redColor] andNameOfButton:@"Ghe dang chon"];
    UIView *vGheDaDat = [self letVofButtonWithColorOfButton:[UIColor purpleColor] andNameOfButton:@"Ghe da dat"];
    UIView *vGheThuong = [self letVofButtonWithColorOfButton:[UIColor greenColor] andNameOfButton:@"Ghe thuong"];
    UIView *vGheVip = [self letVofButtonWithColorOfButton:[UIColor yellowColor] andNameOfButton:@"Ghe VIP"];
    
    [self.vGhe addSubview:vGheDangChon];
    [self.vGhe addSubview:vGheDaDat];
    [self.vGhe addSubview:vGheThuong];
    [self.vGhe addSubview:vGheVip];
    
    [self.vGhe addConstraintsWithFormat:@"V:|-5-[v0(v3)]-5-[v1(v3)]-5-[v2(v3)]-5-[v3]-5-|" andViews:[NSArray arrayWithObjects:vGheDangChon, vGheDaDat, vGheThuong, vGheVip, nil]];
    [self.vGhe addConstraintsWithFormat:@"H:|-20-[v0]-20-|" andViews:[NSArray arrayWithObject:vGheDangChon]];
    [self.vGhe addConstraintsWithFormat:@"H:|-20-[v0]-20-|" andViews:[NSArray arrayWithObject:vGheDaDat]];
    [self.vGhe addConstraintsWithFormat:@"H:|-20-[v0]-20-|" andViews:[NSArray arrayWithObject:vGheThuong]];
    [self.vGhe addConstraintsWithFormat:@"H:|-20-[v0]-20-|" andViews:[NSArray arrayWithObject:vGheVip]];
    
    [self.view addSubview:self.vGhe];
}
-(UIView *)letVofButtonWithColorOfButton:(UIColor *)color andNameOfButton:(NSString *)name
{
    UIView *temp = [[UIView alloc] init];
    UIButton *but = [[UIButton alloc] init];
    [but setTitle:name forState:UIControlStateNormal];
    [but setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [but setContentEdgeInsets:UIEdgeInsetsMake(4, 5, 4, 20)];
    [but.titleLabel setFont:[UIFont systemFontOfSize:17]];
    
    UIView *vColor = [[UIView alloc] init];
    vColor.backgroundColor = color;
    [temp addSubview: vColor];
    [temp addSubview: but];
    [temp addConstraintsWithFormat:@"V:|[v0]|" andViews:[NSArray arrayWithObject:vColor]];
    [temp addConstraintsWithFormat:@"V:|[v0]|" andViews:[NSArray arrayWithObject:but]];
    [temp addConstraintsWithFormat:@"H:|[v0(30)]-5-[v1]|" andViews:[NSArray arrayWithObjects:vColor, but, nil]];
    return temp;
}

#pragma mark CollectionView
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cell_ID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor yellowColor];
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor darkGrayColor];
    cell.selectedBackgroundView = view;
    return cell;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 10;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(30, 30);
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 2;
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(2, 2, 2, 2);
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"hello, %@",indexPath);
}
//-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
//{
//    return CGSizeMake(self.view.frame.size.width, 40);
//}
@end
