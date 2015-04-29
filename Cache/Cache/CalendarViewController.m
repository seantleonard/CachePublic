//
//  CalendarViewController.m
//  Cache
//
//  Created by Manish Shukla on 4/28/15.
//  Copyright (c) 2015 Cache. All rights reserved.
//

#import "CalendarViewController.h"
#import "HomeViewController.h"

@interface CalendarViewController ()

@end

@implementation CalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"calendar"]];
    [backgroundImageView setFrame:CGRectMake(0, 0, 380, 675)];
    [self.view addSubview:backgroundImageView];
    UIButton* backButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 33, 15, 15)];
    [backButton setImage:[UIImage imageNamed:@"back icon"] forState:UIControlStateNormal];
    [backButton addTarget:self
                        action:@selector(exit)
              forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    UIButton* cacheButton = [[UIButton alloc] init];
    [cacheButton setFrame:CGRectMake(55, 575, 275, 40)];
    [cacheButton setImage:[UIImage imageNamed:@"cache"] forState:UIControlStateNormal];
    [cacheButton addTarget:self
                    action:@selector(exit) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cacheButton];
    
    

    // Do any additional setup after loading the view.
}

-(void) exit
{
    HomeViewController* HVC = [[HomeViewController alloc] init];
    [self presentViewController:HVC animated:YES completion:nil];
    
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
