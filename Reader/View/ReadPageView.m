//
//  ReadPageView.m
//  Reader
//
//  Created by zz on 12-12-4.
//  Copyright (c) 2012年 zz. All rights reserved.
//

#import "ReadPageView.h"

@implementation ReadPageView

@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(5, 5, 40, 25)];
        backButton.titleLabel.text = @"书库";
        [backButton addTarget:self action:@selector(backToBookshelf:) forControlEvents:UIControlEventTouchUpInside];
        
        self.delegate = nil;
        
        
        UISwipeGestureRecognizer *recognizerRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self.delegate action:@selector(handleSwipeFrom:)];
        [recognizerRight setDirection:(UISwipeGestureRecognizerDirectionRight)];
        [self addGestureRecognizer:recognizerRight];
        
        UISwipeGestureRecognizer *recognizerLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self.delegate action:@selector(handleSwipeFrom:)];
        [recognizerLeft setDirection:(UISwipeGestureRecognizerDirectionLeft)];
        [self addGestureRecognizer:recognizerLeft];
        
        UITapGestureRecognizer *recognizer=[[UITapGestureRecognizer alloc] initWithTarget:self.delegate action:@selector(handleTapFrom:)];
        [self addGestureRecognizer:recognizer];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


@end
