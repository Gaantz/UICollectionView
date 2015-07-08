//
//  ViewController.h
//  Grillas
//
//  Created by Cristian on 8/07/15.
//  Copyright (c) 2015 Cristian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) IBOutlet UICollectionView *grilla;

@end

