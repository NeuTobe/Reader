//
//  ReadPageView.h
//  Reader
//
//  Created by zz on 12-12-4.
//  Copyright (c) 2012年 zz. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ReadPageDelegate <NSObject>

-(void)storeData;


@end

@interface ReadPageView : UIView
{
    id <ReadPageDelegate> delegate;
}

@property (strong, nonatomic) id <ReadPageDelegate> delegate;
@end
