//
//  chiTietController.m
//  DatVeXemPhim
//
//  Created by Dung Duong on 11/24/16.
//  Copyright © 2016 Tai Duong. All rights reserved.
//

#import "chiTietController.h"
#import "HelperFile.h"
#import "DatVeViewController.h"

@interface chiTietController ()
@property (nonatomic) UIImageView *imgVPro;
@property (nonatomic) UIButton *butDatVe;
@property (nonatomic) UIView *vDetail;
@property (nonatomic) UILabel *lblNoiDungTomTat;
@property (nonatomic) UITextView *txtVNoiDungTomTat;

@end

@implementation chiTietController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = self.mainPhim.tenPhim;
    [self setUpViews];
}
-(void)setUpViews
{
    [self letImgVPro];
    [self letButDatVe];
    [self letVDetail];
    [self letLblNoiDungTomTat];
    [self letTxtVNoiDungTomTat];
    [self.view addConstraintsWithFormat:@"V:|-5-[v0(300)]-5-[v1(30)]-5-[v2(20)]-5-[v3]-5-|" andViews:[NSArray arrayWithObjects:self.imgVPro, self.butDatVe, self.lblNoiDungTomTat, self.txtVNoiDungTomTat, nil]];
    [self.view addConstraintsWithFormat:@"H:|-5-[v0(175)]-5-[v1]-5-|" andViews:[NSArray arrayWithObjects:self.imgVPro, self.vDetail, nil]];
    [self.view addConstraintsWithFormat:@"H:|-5-[v0]-5-|" andViews:[NSArray arrayWithObject:self.txtVNoiDungTomTat]];
    [self.view addConstraintsWithFormat:@"H:|-5-[v0]-5-|" andViews:[NSArray arrayWithObject:self.lblNoiDungTomTat]];
    [self.butDatVe.leftAnchor constraintEqualToAnchor:self.imgVPro.leftAnchor].active = YES;
    [self.butDatVe.widthAnchor constraintEqualToAnchor:self.imgVPro.widthAnchor].active = YES;
    [self.vDetail.topAnchor constraintEqualToAnchor:self.imgVPro.topAnchor].active = YES;
    [self.vDetail.bottomAnchor constraintEqualToAnchor:self.butDatVe.bottomAnchor].active = YES;
    
}
-(void)letImgVPro
{
    self.imgVPro = [[UIImageView alloc] init];
    self.imgVPro.contentMode = UIViewContentModeScaleAspectFill;
    self.imgVPro.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.imgVPro];
}
-(void)letButDatVe
{
    self.butDatVe = [UIButton buttonWithType:UIButtonTypeSystem];
    self.butDatVe.backgroundColor = [UIColor colorWithRed:116.f/255 green:192.f/255 blue:241.f/255 alpha:1];
    self.butDatVe.layer.cornerRadius = 10;
    self.butDatVe.clipsToBounds = YES;
    [self.butDatVe setTitle:@"Book now!" forState:UIControlStateNormal];
    [self.butDatVe.titleLabel setTextAlignment:NSTextAlignmentCenter];
    [self.butDatVe setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.butDatVe.titleLabel setFont:[UIFont boldSystemFontOfSize:17]];
    [self.butDatVe addTarget:self action:@selector(moveToDatVeViewController) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.butDatVe];
}
-(void)letVDetail
{
    self.vDetail = [[UIView alloc] init];
    self.vDetail.backgroundColor = [UIColor lightGrayColor];
    UILabel *lblDaoDien = [self letLblDetailWithName:@"Dao dien" andDetail:@"I don't known"];
    UILabel *lblTenPhim = [self letLblDetailWithName:@"Ten phim" andDetail:@"hellooo!"];
    UILabel *lblThoiLuong = [self letLblDetailWithName:@"Thoi luong" andDetail:@"150 phut"];
    UILabel *lblNgayChieu = [self letLblDetailWithName:@"Ngay khoi chieu" andDetail:@"30 - 2 - 2015"];
    
    
    
    [self.view addSubview:self.vDetail];
}

-(UILabel *)letLblDetailWithName:(NSString *)name andDetail:(NSString *)detail
{
    UILabel *temp = [[UILabel alloc] init];
    temp.numberOfLines = 2;
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:name attributes:@{NSFontAttributeName : [UIFont boldSystemFontOfSize:17], NSForegroundColorAttributeName : [UIColor blackColor]}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 5;
    [text addAttributes:@{NSParagraphStyleAttributeName : paragraphStyle} range:NSMakeRange(0, text.length)];
    [text appendAttributedString:[[NSMutableAttributedString alloc] initWithString:detail attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14], NSForegroundColorAttributeName : [UIColor blackColor]}]];
    temp.attributedText = text;
    return temp;
}

-(void)letLblNoiDungTomTat
{
    self.lblNoiDungTomTat = [[UILabel alloc] init];
    self.lblNoiDungTomTat.text = @"Tom tat noi dung:";
    self.lblNoiDungTomTat.textAlignment = NSTextAlignmentLeft;
    self.lblNoiDungTomTat.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:self.lblNoiDungTomTat];
}
-(void)letTxtVNoiDungTomTat
{
    self.txtVNoiDungTomTat = [[UITextView alloc] init];
    self.txtVNoiDungTomTat.backgroundColor = [UIColor darkGrayColor];
    self.txtVNoiDungTomTat.editable = NO;
    self.txtVNoiDungTomTat.text = self.mainPhim.noiDungTomTat;
    [self.view addSubview:self.txtVNoiDungTomTat];
}
-(void)moveToDatVeViewController
{
    DatVeViewController *datVe = [[DatVeViewController alloc] init];
    datVe.mainPhim = self.mainPhim;
    [self.navigationController showViewController:datVe sender:nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
