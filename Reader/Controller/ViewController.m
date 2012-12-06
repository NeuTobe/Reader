//
//  ViewController.m
//  Reader
//
//  Created by zz on 12-12-4.
//  Copyright (c) 2012年 zz. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

#define FILENAME @"stack.txt"

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
-(int)writeData
{
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    //指向doc目录
    NSString *documentsDirectory= [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *filePath = [documentsDirectory stringByAppendingString:FILENAME];
    
    if (![fileMgr fileExistsAtPath:filePath]) {
        [fileMgr createFileAtPath:filePath contents:nil attributes:nil];
    }
    
//    NSInputStream *inputStream = [[NSInputStream alloc] initWithFileAtPath: filePath];
//    [inputStream open];
    
    
    NSError *error;
    
    NSString *data = [[NSString alloc] initWithString:self.dataModel.lpstr];
    data = [data stringByAppendingString:@";"];
    
    for (NSString *string in self.dataModel.bookmarks) {
        data = [data stringByAppendingString:string];
        data = [data stringByAppendingString:@","];
    }
    data = [data stringByAppendingString:@";"];
    
    for (NSString *list in self.dataModel.bookList) {
        data = [data stringByAppendingString:list];
        data = [data stringByAppendingString:@","];
    }
    data = [data stringByAppendingString:@";"];
    
    //写入文件
    [data writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:&error];
    
    return 1;
}

//read data from doc when App begin
-(int)readData
{
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    //指向doc目录
    NSString *documentsDirectory= [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *filePath = [documentsDirectory stringByAppendingString:FILENAME];
    
    if (![fileMgr fileExistsAtPath:filePath]) {
        return 0;
    }
    
    NSError *error;
    NSString *data = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    
    NSArray *array = [data componentsSeparatedByString:@";"];
    self.dataModel.lpstr = [array objectAtIndex:0];
    self.dataModel.bookmarks = [[array objectAtIndex:1] componentsSeparatedByString:@","];
    self.dataModel.bookList = [[array objectAtIndex:2] componentsSeparatedByString:@","];
    
    return 1;
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
    return [self.dataModel.bookList count];
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

//when back button is pressed,..
-(void)backToBookshelf:(id)sender
{
    self.dataModel.lpstr;
    
    
    [self.readPageView removeFromSuperview];
}

//involk this method when accept swip action
-(void)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer
{
    if (recognizer.direction==UISwipeGestureRecognizerDirectionRight)
    {
        self.dataModel.pageNum++;
    }
    else if (recognizer.direction==UISwipeGestureRecognizerDirectionLeft)
    {
        self.dataModel.pageNum--;
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
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSLog(@"documentsDirectory%@",documentsDirectory);
    NSFileManager *fileManage = [NSFileManager defaultManager];
    NSArray *files = [fileManage subpathsAtPath: documentsDirectory];
    NSString *ss = [[NSString alloc] init];
    for (NSString *s in files) {
        NSLog(@"%@",s);
        ss=[ss stringByAppendingString:s];
        ss=[ss stringByAppendingString:@";"];
    }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"File" message:ss delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [self.view addSubview:alert];
}

//when edit button is pressed,..
-(void)editBookList:(id)sender
{
    
}
@end
