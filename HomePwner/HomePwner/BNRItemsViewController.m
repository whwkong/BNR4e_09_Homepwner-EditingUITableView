//
//  BNRItemsViewController.m
//  HomePwner
//
//  Created by William Kong on 2014-05-17.
//  Copyright (c) 2014 William Kong. All rights reserved.
//

#import "BNRItemsViewController.h"
#import "BNRItemStore.h"
#import "BNRItem.h"


@interface BNRItemsViewController ()

@property (nonatomic, strong) IBOutlet UIView *headerView;

@end


@implementation BNRItemsViewController

- (instancetype)init
{
    // call the superclass' designated initializer
    self = [super initWithStyle:UITableViewStylePlain];
    
    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];
    
    UIView *header = self.headerView;
    [self.tableView setTableHeaderView:header];
}


- (IBAction)addNewItem:(id)sender
{
    
}

- (IBAction)toggleEditingMode:(id)sender
{
    
}

- (UIView*)headerView
{
    // if headerView is not loaded yet
    if (!_headerView) {
        
        // load HeaderView.xib
        [[NSBundle mainBundle] loadNibNamed:@"HeaderView"
                                      owner:self
                                    options:nil];
    }
    
    return _headerView;
}


// implementation required UITableViewDataSource method
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[BNRItemStore sharedStore] allItems] count];
}

// implement required UITableViewDataSource method
-(UITableViewCell*) tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"tableView:cellForRowAtIndexPath:%d,%d", indexPath.section, indexPath.row);
        
    // get a cell from data pool
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                                            forIndexPath:indexPath];
    
    // set text
    NSArray *items = [[BNRItemStore sharedStore] allItems];
    BNRItem *item = items[indexPath.row];
    
    cell.textLabel.text = [item description];
    
    return cell;
}



@end
