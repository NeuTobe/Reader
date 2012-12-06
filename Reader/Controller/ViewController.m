//
//  ViewController.m
//  Reader
//
//  Created by zz on 12-12-4.
//  Copyright (c) 2012年 zz. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController

@synthesize dataModel;
@synthesize bookshelfView,readPageView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.dataModel = [DataModel shareModel];
        
        [self readData];
        
        self.bookshelfView = [[BookshelfView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        self.readPageView = [[ReadPageView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        readPageView.delegate = self;
        
        bookshelfView.tableViewDataSource = self;
        bookshelfView.tableViewDelegate = self;
        
        
        if (dataModel.lpstr == nil) {
            
            self.view = bookshelfView;
            
        }else
            self.view = readPageView;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark WriteOrReadOnDoc Delegate
//write data to doc when App end
-(void)writeData
{
    
}

//read data from doc when App begin
-(void)readData
{
    
}

#pragma mark UItableView Delegate And DataSource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPat
{
    static NSString *BookListCellIdentifier = @"BookListCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:BookListCellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:BookListCellIdentifier];
    }
    
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [UIView beginAnimations:@"Animation" context:nil];
    [UIView setAnimationDuration:10.5f];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationRepeatAutoreverses:NO];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.view cache:YES];
    
    [self.view addSubview:readPageView];
    
    [UIView commitAnimations];
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark ReadPageView Delegate
//when back to bookshelf involking this method to store *lpstr
-(void)storeData
{
    
}

//when back button is pressed,..
-(void)backToBookshelf:(id)sender
{
    [self.readPageView removeFromSuperview];
}

//involk this method when accept swip action
-(void)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer
{
    if (recognizer.direction==UISwipeGestureRecognizerDirectionRight)
    {
        
    }
    else if (recognizer.direction==UISwipeGestureRecognizerDirectionLeft)
    {
        
    }
}

//involk this method when accept tap action
-(void)handleTapFrom:(UISwipeGestureRecognizer *)recognizer
{
    
}

#pragma mark BookshelfView Delegate
//when add button is pressed,..
-(void)addBook:(id)sender
{
    
}

//when edit button is pressed,..
-(void)editBookList:(id)sender
{
    
}
@end
