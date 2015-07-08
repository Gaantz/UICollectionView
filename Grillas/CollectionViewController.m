//
//  CollectionViewController.m
//  Grillas
//
//  Created by Cristian on 8/07/15.
//  Copyright (c) 2015 Cristian. All rights reserved.
//

#import "CollectionViewController.h"

@interface CollectionViewController ()
<UICollectionViewDataSource,UICollectionViewDelegate>
{
    NSMutableArray *items;
}
@end

@implementation CollectionViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    items = [[NSMutableArray alloc] init];
    for (int i = 0; i < 14; i++) {
        [items addObject:[NSString stringWithFormat:@"%i",i]];
    }
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    flow.scrollDirection = UICollectionViewScrollDirectionVertical;
    flow.minimumInteritemSpacing = 1;
    flow.minimumLineSpacing = 0;
    [self.collectionView setCollectionViewLayout:flow];
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
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


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return items.count;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"iCell" forIndexPath:indexPath];
    
    UIImageView *imagen = (UIImageView*)[cell viewWithTag:100];
    UILabel *title = (UILabel*)[cell viewWithTag:101];
    UILabel *subtitle = (UILabel*)[cell viewWithTag:102];
    
    [imagen setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%i",(int)indexPath.row]]];
    title.text = [items objectAtIndex:indexPath.row];
    subtitle.text = [items objectAtIndex:indexPath.row];
    
    return cell;
}

@end
