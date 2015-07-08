//
//  ViewController.m
//  Grillas
//
//  Created by Cristian on 8/07/15.
//  Copyright (c) 2015 Cristian. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSArray *items;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *mitems = [[NSMutableArray alloc] init];
    for (int i = 0; i < 15; i++) {
        [mitems addObject:[NSString stringWithFormat:@"%i",i]];
    }
    
    items = mitems;
    
    self.grilla.delegate = self;
    self.grilla.dataSource = self;
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    flow.scrollDirection = UICollectionViewScrollDirectionVertical;
    flow.minimumInteritemSpacing = 0;
    flow.minimumLineSpacing = 0;
    [self.grilla setCollectionViewLayout:flow];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    NSLog(@"SCREEN : %f * %f",screenWidth,screenHeight);
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return items.count;
}

- (CGSize) collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath*)indexPath
{
    CGRect screen_size = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screen_size.size.width;
    //CGFloat screenHeight = screen_size.size.height;
    
    CGSize row_size = [(UICollectionViewFlowLayout*)collectionViewLayout itemSize];
    
    if(indexPath.row == 0)
    {
        row_size.width = screenWidth;
        row_size.height = screenWidth/2.010;
    }
    else
    {
        row_size.width = screenWidth/2.010;
        row_size.height = screenWidth/2.010;
    }
    
    
    NSLog(@"ROW : %f * %f",row_size.width,row_size.height);

    return row_size;
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 1.5;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    //UILabel *title = (UILabel*)[cell viewWithTag:100];
    //title.text = [items objectAtIndex:indexPath.row];
    
    return cell;
}

@end
