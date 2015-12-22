//
//  ViewController.m
//  MusicUIDesign
//
//  Created by 许汝邈 on 15/12/20.
//  Copyright © 2015年 miao. All rights reserved.
//

#import "ViewController.h"

#define padding 355.0f

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

{
        NSMutableArray *_musicList;
}
@end

@implementation ViewController


-(void)viewDidAppear:(BOOL)animated{


    dispatch_async(dispatch_get_main_queue(), ^{
        [_myTableView setFrame:CGRectMake(_myTableView.frame.origin.x, _myTableView.frame.origin.y+ padding , _myTableView.frame.size.width, _myTableView.frame.size.height)];
        
        [_headerBar setFrame:CGRectMake(_headerBar.frame.origin.x, _headerBar.frame.origin.y+ padding , _headerBar.frame.size.width, _headerBar.frame.size.height)];
        
        [_footerBar setFrame:CGRectMake(_footerBar.frame.origin.x, _footerBar.frame.origin.y+ padding, _footerBar.frame.size.width, _footerBar.frame.size.height)];
        
    });
        
   
    

        
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    NSArray *array  = @[@"第一首",@"第二首",@"第三首",@"第四首",@"第四首",@"第四首",@"第四首",@"第四首",@"第四首"];
    _musicList = [NSMutableArray arrayWithArray:array];
    
    _myTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView协议

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_musicList count] ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell;
    
//    if (indexPath.row == [_musicList count] ) {
//        static NSString *simpleIdentify = @"CloseCellIdentify";
//        cell = [tableView dequeueReusableCellWithIdentifier:simpleIdentify];
//        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MyTable" owner:self options:nil];
//        if ([nib count] > 0) {
//            self.closeCell = [nib objectAtIndex:1];
//            cell = self.closeCell;
//        }
//        
//        UIButton *closeBtn = (UIButton *)[cell.contentView viewWithTag:1];
//        [closeBtn addTarget:self action:@selector(closeTableView:) forControlEvents:UIControlEventTouchUpInside];
//        
//    }
//    else{
    
        static NSString *simpleIdentify = @"SimpleIdentify";
        cell = [tableView dequeueReusableCellWithIdentifier:simpleIdentify];
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MyTable" owner:self options:nil];
        if ([nib count] > 0) {
            self.customCell = [nib objectAtIndex:0];
            cell = self.customCell;
        }
        
        UILabel *nameLabel = (UILabel *)[cell.contentView viewWithTag:1];
        nameLabel.text = _musicList[indexPath.row];
    
        UIButton *clearBtn = (UIButton *)[cell.contentView viewWithTag:2];
        clearBtn.tag = indexPath.row;
    [clearBtn addTarget:self action:@selector(deleteOneAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
        return cell;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%@",_musicList[indexPath.row]);

}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    
  
        return YES;
   
    
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (_myTableView.editing) {
        return UITableViewCellEditingStyleInsert|UITableViewCellEditingStyleDelete;
    }
    else{
        return UITableViewCellEditingStyleDelete;
    }
    
    
}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [_musicList removeObjectAtIndex:indexPath.row];
        //[_myTableView beginUpdates];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
       // [_myTableView endUpdates];
        
    }
    
    
}






/**
 *  @brief  <#Description#>
 *
 *  @return <#return value description#>
 */

#pragma mark - 事件监听
-(IBAction)closeTableView:(id)sender{
    


    
    
    [UIView animateWithDuration:0.5 // 动画时长
                     animations:^{
                         
                         [_myTableView setFrame:CGRectMake(_myTableView.frame.origin.x, _myTableView.frame.origin.y+ padding , _myTableView.frame.size.width, _myTableView.frame.size.height)];
                         
                         [_headerBar setFrame:CGRectMake(_headerBar.frame.origin.x, _headerBar.frame.origin.y+ padding , _headerBar.frame.size.width, _headerBar.frame.size.height)];
                         
                         [_footerBar setFrame:CGRectMake(_footerBar.frame.origin.x, _footerBar.frame.origin.y+ padding, _footerBar.frame.size.width, _footerBar.frame.size.height)];
                         
                         
                     }
                     completion:^(BOOL finished) {
                         
                         _showListBtn.hidden = NO;
                     }];
    
    
    
}




- (IBAction)musicListShow:(id)sender {
    
    
    _showListBtn.hidden = YES;
    
    [UIView animateWithDuration:0.5 // 动画时长
                     animations:^{
                         
                         [_myTableView setFrame:CGRectMake(_myTableView.frame.origin.x, _myTableView.frame.origin.y- padding , _myTableView.frame.size.width, _myTableView.frame.size.height)];
                         
                         [_headerBar setFrame:CGRectMake(_headerBar.frame.origin.x, _headerBar.frame.origin.y- padding  , _headerBar.frame.size.width, _headerBar.frame.size.height)];
                         
                         [_footerBar setFrame:CGRectMake(_footerBar.frame.origin.x, _footerBar.frame.origin.y- padding, _footerBar.frame.size.width, _footerBar.frame.size.height)];
                         
                         
                     }
                     completion:^(BOOL finished) {
                         
                     }];

}

- (IBAction)deleteAction:(id)sender {
    
    

    
    [_myTableView setEditing:!_myTableView.editing animated:YES];
    

    
    
    
//    [_myTableView setFrame:CGRectMake(_myTableView.frame.origin.x, _myTableView.frame.origin.y , _myTableView.frame.size.width, _myTableView.frame.size.height)];
//    
//    [_headerBar setFrame:CGRectMake(_headerBar.frame.origin.x, _headerBar.frame.origin.y  , _headerBar.frame.size.width, _headerBar.frame.size.height)];
//    
//    [_footerBar setFrame:CGRectMake(_footerBar.frame.origin.x, _footerBar.frame.origin.y, _footerBar.frame.size.width, _footerBar.frame.size.height)];
    

   
   
    
    [[_headerBar items] objectAtIndex:0].rightBarButtonItem.title = _myTableView.editing?@"取消":@"编辑";
}

- (IBAction)sureAction:(id)sender {
    
    NSArray *arr = _myTableView.indexPathsForSelectedRows;
    
    NSMutableIndexSet *set = [NSMutableIndexSet indexSet];
    
    for (NSIndexPath *indexP in  arr) {
        [set addIndex:indexP.row];
    }
    
    [_musicList removeObjectsAtIndexes:set];
    
    [_myTableView deleteRowsAtIndexPaths:arr withRowAnimation:UITableViewRowAnimationAutomatic];
    
}

-(void)deleteOneAction:(id)sender {
    
   
    NSInteger index = [sender tag];
   
    [_musicList removeObjectAtIndex:index];
    
    [_myTableView reloadData];
    
    NSLog(@"%ld",(long)[sender tag]);
    
   
}

@end
