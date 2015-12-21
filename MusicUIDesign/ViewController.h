//
//  ViewController.h
//  MusicUIDesign
//
//  Created by 许汝邈 on 15/12/20.
//  Copyright © 2015年 miao. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *myTableView;



@property (nonatomic, strong) IBOutlet UITableViewCell *customCell;
@property (strong, nonatomic) IBOutlet UITableViewCell *closeCell;
@property (strong, nonatomic) IBOutlet UITableViewCell *headerCell;

@property (weak, nonatomic) IBOutlet UINavigationBar *headerBar;
@property (weak, nonatomic) IBOutlet UIToolbar *footerBar;

@property (weak, nonatomic) IBOutlet UIButton *showListBtn;

- (IBAction)musicListShow:(id)sender;

- (IBAction)deleteAction:(id)sender;

- (IBAction)sureAction:(id)sender;

-(IBAction)closeTableView:(id)sender;

@end

