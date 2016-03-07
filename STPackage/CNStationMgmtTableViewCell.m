//
//  CNStationMgmtTableViewCell.m
//  CNStationMgMt
//
//  Created by yeah on 3/3/16.
//  Copyright © 2016 none. All rights reserved.
//

#import "CNStationMgmtTableViewCell.h"

@implementation CNStationMgmtTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)btnCellExpandHandle:(id)sender {
    if (arc4random()%2==1) {
        self.value=170;
    }
    self.value=291;
}
@end
