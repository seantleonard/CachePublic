//
//  ProductSearchViewController.m
//  Cache
//
//  Created by Sean Leonard on 4/24/15.
//  Copyright (c) 2015 Cache. All rights reserved.
//

#import "ProductSearchViewController.h"
#import <Parse/Parse.h>
#define OAUTH_KEY @"SEM3ACBC4E578B16EFAB32FDC51FA4AEBF1E"
#define OAUTH_SECRET @"Nzc5ZjYwNzg4YjUzODAwMWQ0Njc1ODdhZDIwZTJjZDI"

@interface ProductSearchViewController ()


@end

@implementation ProductSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.labelArray = [[NSMutableArray alloc] init];
    
   
    
    
    

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)closePage{
    [self dismissViewControllerAnimated:NO completion:nil];
}

-(IBAction)searchProducts{
    NSLog(@"searched here");
    NSLog(@"Contents of the text field: %@", self.searchField.text);
    
    //Here we are setting up the semantics3 query and connecting using my api keys. This only happens when user searches.
    semantics3_objc *sem = [[semantics3_objc alloc] initSemantic3Request:OAUTH_KEY withapiSecret:OAUTH_SECRET andEndpoints:@"products"];
    
    sem.delegate = self;
    [sem buildQuery:self.searchField.text andKeys:@"name"];
    
    [sem runQuery];
}

-(void)queryData:(NSString *)content{
    //  NSError *error;
    //NSData *jsonData = [NSData dataWithContentsOfURL:url];
    // NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:content options:NSJSONReadingMutableContainers error:&error];
    NSArray *jsonObject = [NSJSONSerialization JSONObjectWithData:[content dataUsingEncoding:NSUTF8StringEncoding]
                                                          options:0 error:NULL];
    if([NSJSONSerialization isValidJSONObject:jsonObject]){
        NSLog(@"is valid");
    }else{
        NSLog(@"not valid JSON");
    }
    
    NSDictionary *tableData = [jsonObject valueForKey:@"results"];
    NSArray *productData = [tableData valueForKey:@"name"];
    NSArray *priceData = [tableData valueForKey:@"price"];
    NSLog(@"tableData=%@", tableData);
    
    if(productData.count ==0){
        return;
    }
    
    self.prod1Name.text = productData[0];
    self.prod2Name.text = productData[1];
    self.prod3Name.text = productData[2];
    
    self.prod1Price.text = priceData[0];
    self.prod2Price.text = priceData[1];
    self.prod3Price.text = priceData[2];
    
    
    
    
    // NSLog(@"content output: %@",content);
}


- (IBAction)addProd1{
    PFObject *userWant = [PFObject objectWithClassName:@"User_Wants"];
    userWant[@"prod_name"] = self.prod1Name.text;
    
    NSNumberFormatter *num = [[NSNumberFormatter alloc] init];
    num.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *myNumber = [num numberFromString: self.prod1Price.text];
    
   // userWant[@"prod_price"] =  self.prod1Price.text;
    userWant[@"prod_price"] = myNumber;
    
    [userWant saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            // The object has been saved.
        } else {
            // There was a problem, check error.description
        }
    }];
}
- (IBAction)addProd2{
    PFObject *userWant = [PFObject objectWithClassName:@"User_Wants"];
    userWant[@"prod_name"] = self.prod2Name.text;
    
    NSNumberFormatter *num = [[NSNumberFormatter alloc] init];
    num.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *myNumber = [num numberFromString: self.prod2Price.text];
    
   // userWant[@"prod_price"] =  self.prod2Price.text;
    userWant[@"prod_price"] = myNumber;
    
    [userWant saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            // The object has been saved.
        } else {
            // There was a problem, check error.description
        }
    }];
    
}
- (IBAction)addProd3{
    PFObject *userWant = [PFObject objectWithClassName:@"User_Wants"];
    userWant[@"prod_name"] = self.prod3Name.text;
    
    NSNumberFormatter *num = [[NSNumberFormatter alloc] init];
    num.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *myNumber = [num numberFromString: self.prod2Price.text];

    //userWant[@"prod_price"] =  self.prod3Price.text;
    userWant[@"prod_price"] = myNumber;
    
    [userWant saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            // The object has been saved.
        } else {
            // There was a problem, check error.description
        }
    }];
    
}



@end
