//
//  LinesViewController.m
//  Nesting
//
//  Created by liuyan on 15/3/21.
//  Copyright (c) 2015年 liuyan. All rights reserved.
//

#import "LinesViewController.h"
#import "ScanedData.h"

@implementation LinesViewController

- (void)viewDidLoad
{
    _tableView.dataSource = self;
    [super viewDidLoad];
}

- (void)refresh
{
    [_tableView reloadData];
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    ScanedData *scanedData = [ScanedData getScanedData];
    return scanedData.lineCountDescOrderedFunctionItems.count;
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    ScanedData *scanedData = [ScanedData getScanedData];
    FunctionItem *functionItem = scanedData.lineCountDescOrderedFunctionItems[row];
    NSString *cellId = [tableColumn identifier];
    NSString *str = @"Unknown";
    if ([cellId isEqualToString:@"lines"])
    {
        str = [NSString stringWithFormat:@"%d", functionItem.funContentLineCount];
    }
    else if ([cellId isEqualToString:@"name"])
    {
        str = functionItem.funName;
    }
    else if ([cellId isEqualToString:@"path"])
    {
        str = functionItem.filename;
    }
    
    return str;
}
@end
