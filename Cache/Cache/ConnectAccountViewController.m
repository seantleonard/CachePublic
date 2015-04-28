//
//  ConnectAccountViewController.m
//  Cache
//
//  Created by Manish Shukla on 4/27/15.
//  Copyright (c) 2015 Cache. All rights reserved.
//

#import "ConnectAccountViewController.h"
#import "HomeViewController.h"

@interface ConnectAccountViewController ()

@end

@implementation ConnectAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [super viewDidLoad];
    UIImageView *ImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"connectAccount"]];
    [ImageView setFrame:CGRectMake(0, 0, 380, 675)];
    [self.view addSubview:ImageView];
    // Do any additional setup after loading the view.

    UITextField *IDTextField = [[UITextField alloc] initWithFrame:CGRectMake(55, 265, 275, 100)];
    IDTextField.textColor = [UIColor whiteColor];
    IDTextField.font = [UIFont fontWithName:@"Avenir" size:18];
    IDTextField.placeholder = @"Online ID";
    //IDTextField.rightViewMode = UITextFieldViewModeAlways;
    //IDTextField.rightView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"IDPIC"]];
    [self.view addSubview:IDTextField];
    UIImageView *idImageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"white line"]];
    [idImageView setFrame:CGRectMake(55, 325, 275, 2)];
    [self.view addSubview:idImageView];
    
    UITextField *PWTextField = [[UITextField alloc] initWithFrame:CGRectMake(55, 325, 275, 100)];
    PWTextField.textColor = [UIColor whiteColor];
    PWTextField.font = [UIFont fontWithName:@"Avenir" size:18];
    PWTextField.placeholder = @"Password";
    [PWTextField setSecureTextEntry:YES];
    //IDTextField.rightViewMode = UITextFieldViewModeAlways;
    //IDTextField.rightView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"IDPIC"]];
    [self.view addSubview:PWTextField];
    UIImageView *pwImageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"white line"]];
    [pwImageView setFrame:CGRectMake(55, 395, 275, 2)];
    [self.view addSubview:pwImageView];
    
    UIButton* nextButton = [[UIButton alloc] init];
    [nextButton setFrame:CGRectMake(55, 500, 275, 40)];
    [nextButton setImage:[UIImage imageNamed:@"signIn"] forState:UIControlStateNormal];
    [self.view addSubview:nextButton];
    [nextButton addTarget:self
                   action:@selector(nextScreen)
         forControlEvents:UIControlEventTouchUpInside];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void) nextScreen
{
        HomeViewController *HVC = [[HomeViewController alloc] init];
        [self presentViewController:HVC animated:YES completion:nil];
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
