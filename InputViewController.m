//
//  InputViewController.m
//  Simple3
//
//  Created by Tom on 03/07/2014.
//  Copyright (c) 2014 SugWare. All rights reserved.
//

#import "InputViewController.h"
#import "OutputViewController.h"

@interface InputViewController ()
@property (weak, nonatomic) IBOutlet UILabel *measureOneLabel;
@property (weak, nonatomic) IBOutlet UILabel *measureTwoLabel;
@property (weak, nonatomic) IBOutlet UILabel *measureThreeLabel;
@property (weak, nonatomic) IBOutlet UISwitch *mFSwitch;
@property (weak, nonatomic) IBOutlet UILabel *genderLabel;
@property (weak, nonatomic) NSString *bodyFatPercent;
@property (weak, nonatomic) IBOutlet UITextField *age;
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *m1;
@property (weak, nonatomic) IBOutlet UITextField *m2;
@property (weak, nonatomic) IBOutlet UITextField *m3;

@end

@implementation InputViewController
- (IBAction)genderSwitch:(id)sender {
    if (self.mFSwitch.on) {
        self.genderLabel.text = @"Male";
        self.genderLabel.textColor = [UIColor blueColor];
        self.measureOneLabel.text = @"Chest";
        self.measureTwoLabel.text = @"Abdominal";
        self.measureThreeLabel.text = @"Thigh";
    } else {
        self.genderLabel.textColor = [UIColor purpleColor];
        self.genderLabel.text = @"Female";
        self.measureOneLabel.text = @"Tricep";
        self.measureTwoLabel.text = @"Suprailiac";
        self.measureThreeLabel.text = @"Thigh";
    }
    
}


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
    
    if (self.mFSwitch.on) {
        self.measureOneLabel.text = @"Chest";
        self.measureTwoLabel.text = @"Abdominal";
        self.measureThreeLabel.text = @"Thigh";
    }
}


- (NSString*)calcBFPercent:(BOOL)gender :(double)n1 :(double)n2 :(double)n3 :(double)age{
    
    double totalCalc = n1+n2+n3;
    
    if (gender) {
        
        _bodyFatPercent = [NSString stringWithFormat:@"%.2f", 495/(1.10938-(0.0008267*totalCalc)+(0.0000016*totalCalc*totalCalc)-(0.0002574*age))-450];
        return _bodyFatPercent;
    } else {
        
        _bodyFatPercent = [NSString stringWithFormat:@"%.2f", 495/(1.089733-(0.0009245*totalCalc)+(0.0000025*totalCalc*totalCalc)-(0.0000979*age))-450];
        return _bodyFatPercent;
    }
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"segToBodyFat"]) {
        OutputViewController *outputController = segue.destinationViewController;
        outputController.bodyFatPercent = [self calcBFPercent:self.mFSwitch.on :[self.m1.text doubleValue] :[self.m2.text doubleValue] :[self.m3.text doubleValue] :[self.age.text doubleValue]];
        
        outputController.username = [self.username text];
        outputController.gender = self.mFSwitch.on;
    }
    
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
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
