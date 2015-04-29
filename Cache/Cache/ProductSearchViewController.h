//
//  ProductSearchViewController.h
//  Cache
//
//  Created by Sean Leonard on 4/24/15.
//  Copyright (c) 2015 Cache. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "semantics3-objc/semantics3_objc.h"

@interface ProductSearchViewController : UIViewController <Sem3ObjCDelegate>
    @property (nonatomic, weak) IBOutlet UILabel *prod1Name;
    @property (nonatomic, weak) IBOutlet UILabel *prod2Name;
    @property (nonatomic, weak) IBOutlet UILabel *prod3Name;
    @property (nonatomic, weak) IBOutlet UILabel *prod1Price;
    @property (nonatomic, weak) IBOutlet UILabel *prod2Price;
    @property (nonatomic, weak) IBOutlet UILabel *prod3Price;
    @property (nonatomic, weak) IBOutlet UITextField *searchField;
    @property(nonatomic, strong) NSMutableArray *labelArray;


    - (IBAction)addProd1;
    - (IBAction)addProd2;
    - (IBAction)addProd3;

    - (IBAction)searchProducts;
    - (IBAction)closePage;
   // - (IBAction)done;
@end
