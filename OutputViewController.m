//
//  OutpputViewController.m
//  Simple3
//
//  Created by Tom on 03/07/2014.
//  Copyright (c) 2014 SugWare. All rights reserved.
//

#import "OutputViewController.h"

@interface OutputViewController ()
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *pictureBox;

@end

@implementation OutputViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.resultLabel.text = [NSString stringWithFormat:@"%@ %%",_bodyFatPercent];
    self.nameLabel.text = [NSString stringWithFormat:@"%@ your body fat percent is: ",_username];
    
    UIImage *bodyFatImg;
    if (_gender) {
        if ([_bodyFatPercent doubleValue] < 4) {
            bodyFatImg = [UIImage imageNamed:@"3-4m"];
        } else if ([_bodyFatPercent doubleValue] < 7){
            bodyFatImg = [UIImage imageNamed:@"6-7m"];
        } else if ([_bodyFatPercent doubleValue] < 12){
            bodyFatImg = [UIImage imageNamed:@"10-12m"];
        } else if ([_bodyFatPercent doubleValue] < 15){
            bodyFatImg = [UIImage imageNamed:@"15m"];
        } else if ([_bodyFatPercent doubleValue] < 20){
            bodyFatImg = [UIImage imageNamed:@"20m"];
        } else if ([_bodyFatPercent doubleValue] < 25){
            bodyFatImg = [UIImage imageNamed:@"25m"];
        } else if ([_bodyFatPercent doubleValue] < 30){
            bodyFatImg = [UIImage imageNamed:@"30m"];
        } else if ([_bodyFatPercent doubleValue] <= 35){
            bodyFatImg = [UIImage imageNamed:@"35m"];
        } else if ([_bodyFatPercent doubleValue] > 35){
            bodyFatImg = [UIImage imageNamed:@"40m"];
        }
    } else {
        if ([_bodyFatPercent doubleValue] < 13) {
            bodyFatImg = [UIImage imageNamed:@"12f"];
        } else if ([_bodyFatPercent doubleValue] < 18){
            bodyFatImg = [UIImage imageNamed:@"17f"];
        } else if ([_bodyFatPercent doubleValue] < 23){
            bodyFatImg = [UIImage imageNamed:@"22f"];
        } else if ([_bodyFatPercent doubleValue] < 26){
            bodyFatImg = [UIImage imageNamed:@"25f"];
        } else if ([_bodyFatPercent doubleValue] < 31){
            bodyFatImg = [UIImage imageNamed:@"30f"];
        } else if ([_bodyFatPercent doubleValue] < 36){
            bodyFatImg = [UIImage imageNamed:@"35f"];
        } else if ([_bodyFatPercent doubleValue] < 41){
            bodyFatImg = [UIImage imageNamed:@"40f"];
        } else if ([_bodyFatPercent doubleValue] <= 47){
            bodyFatImg = [UIImage imageNamed:@"45f"];
        } else if ([_bodyFatPercent doubleValue] > 47){
            bodyFatImg = [UIImage imageNamed:@"50f"];
        }
    }
    
    
    [_pictureBox setImage:bodyFatImg];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
