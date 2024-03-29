//
//  DataModel.m
//  Reader
//
//  Created by zz on 12-12-4.
//  Copyright (c) 2012年 zz. All rights reserved.
//

#import "DataModel.h"

static DataModel *model = nil;
@implementation DataModel

@synthesize books,bookList;
@synthesize bookmarks,lpstr;
@synthesize pageCaches;
@synthesize pageNum;

@synthesize delegate;

+(id)shareModel
{
    if (model == nil) {
        model = [[DataModel alloc] init];
    }
    
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    
//    NSArray *paths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory,                                                                          NSUserDomainMask, YES);
//    
//    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    return model;
}

-(id)init
{
    if (self = [super init]) {
        self.lpstr = [[NSString alloc] init];
        self.bookList = [[NSMutableArray alloc] initWithCapacity:50];
        self.books = [[NSMutableArray alloc] initWithCapacity:50];
        self.bookmarks = [[NSMutableArray alloc] initWithCapacity:100];
        self.pageCaches = [[NSMutableArray alloc] initWithCapacity:50];
        self.pageNum = 0;
        
        self.delegate = nil;
    }
    
    return model;
}
@end
