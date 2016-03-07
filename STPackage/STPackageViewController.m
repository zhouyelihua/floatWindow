//
//  STPackageViewController.m
//  STPackage
//
//  Created by yeah on 2/22/16.
//  Copyright © 2016 yeah. All rights reserved.
//

#import "STPackageViewController.h"
#import "packageInfo.h"
#import "STPackageTableViewCell.h"
@interface STPackageViewController ()
{
    NSArray *_packages;
}


@property (weak, nonatomic) IBOutlet UITableView *uitableview;
@property (nonatomic,strong)IBOutlet  NSLayoutConstraint *dynamicTVHeight;
- (IBAction)btncall:(id)sender;
@property (nonatomic,strong) IBOutlet NSLayoutConstraint *heightView;
//@property (nonatomic,strong)
@end

@implementation STPackageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.uitableview.dataSource=self;
    
    
    //
    packageInfo* pinfo1=[[packageInfo alloc] init];
    
    pinfo1.packagename=@"大棉袄 ";
    pinfo1.arriveDate=@"到达时间 12-03";
    pinfo1.code=@"取货码：758490";
    
    packageInfo* pinfo2=[[packageInfo alloc] init];
    pinfo2.packagename=@"大破碗小聚会";
    pinfo2.arriveDate=@"到达时间 02-33";
    pinfo2.code=@"取货码：750990";
    //*
    packageInfo* pinfo3=[[packageInfo alloc] init];
    
    pinfo3.packagename=@"水仙花";
    pinfo3.arriveDate=@"到达时间 09-30";
    pinfo3.code=@"取货码：123450";
    
    packageInfo* pinfo4=[[packageInfo alloc] init];
    pinfo4.packagename=@"大猫儿";
    pinfo4.arriveDate=@"到达时间 02-33";
    pinfo4.code=@"取货码：750990";
    
    _packages=[NSArray arrayWithObjects:pinfo1,pinfo2,pinfo3,pinfo4 ,nil];//*///
    
    //_packages=[NSArray arrayWithObjects:pinfo1,pinfo2 ,nil];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_packages count];
}
-(void)viewDidLayoutSubviews
{
    CGFloat height = MIN(self.view.bounds.size.height, self.uitableview.contentSize.height);
    CGFloat cellheight = [self.uitableview rectForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]].size.height;
    if (height>cellheight*3) {
        height=cellheight*3;
    }
    self.dynamicTVHeight.constant = height;
    self.heightView.constant=height+100;
    [self.view layoutIfNeeded];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIndentifier = @"STPackageTableViewCell";
    STPackageTableViewCell *cell = (STPackageTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if(nil == cell) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:cellIndentifier owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    // CGSize size = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    
    packageInfo *pck = [_packages objectAtIndex:indexPath.row];
    //通过tag值来获取UIImageView和UILabel
    // UIImageView *headImageView = (UIImageView *)[cell.contentView viewWithTag:0];
    
    UILabel *label1 = (UILabel *)[cell.contentView viewWithTag:1];
    UILabel *label2 = (UILabel *)[cell.contentView viewWithTag:2];
    UILabel *label3 = (UILabel *)[cell.contentView viewWithTag:3];
    // headImageView.image = [UIImage imageNamed:person.headStr];
    label1.text = pck.packagename;
    label2.text = pck.code;
    label3.text = pck.arriveDate;
   // UIImageView *cellimageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"longgui.jpg"]];
   // cell.selectedBackgroundView = cellimageView;
    // cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    //textLabel.text = person.speechText;
    // _tableView.rowHeight = cell.frame.size.height;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (0 == indexPath.section) {
        [self btncall:self];
        
    }
}
- (IBAction)btncall:(id)sender {
    NSIndexPath *indexPath = [self.uitableview indexPathForSelectedRow];
    UITableViewCell *cell = [self.uitableview cellForRowAtIndexPath:indexPath];
    UILabel *label1 = (UILabel *)[cell.contentView viewWithTag:1];
    UILabel *label2 = (UILabel *)[cell.contentView viewWithTag:2];
    UILabel *label3 = (UILabel *)[cell.contentView viewWithTag:3];
    // headImageView.image = [UIImage imageNamed:person.headStr];
    NSLog(@"%@",label1.text);
}
@end

