//
//  ChooseBankViewController.m
//  Cache
//
//  Created by Manish Shukla on 4/27/15.
//  Copyright (c) 2015 Cache. All rights reserved.
//

#import "ChooseBankViewController.h"
#import "ConnectAccountViewController.h"

@interface ChooseBankViewController ()

@end

@implementation ChooseBankViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *ImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"choose bank"]];
    [ImageView setFrame:CGRectMake(0, 0, 380, 675)];
    [self.view addSubview:ImageView];
    // Do any additional setup after loading the view.
    UIButton* nextButton = [[UIButton alloc] init];
    [nextButton setFrame:CGRectMake(55, 500, 275, 40)];
    [nextButton setImage:[UIImage imageNamed:@"next button"] forState:UIControlStateNormal];
    [self.view addSubview:nextButton];
    [nextButton addTarget:self
                    action:@selector(nextScreen)
          forControlEvents:UIControlEventTouchUpInside];
}

-(void) nextScreen
{
    ConnectAccountViewController *CAVC = [[ConnectAccountViewController alloc] init];
    [self presentViewController:CAVC animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
