//
//  BNRItemStore.m
//  HomePwner
//
//  Created by William Kong on 2014-05-17.
//  Copyright (c) 2014 William Kong. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"


@interface BNRItemStore()

@property(nonatomic, strong) NSMutableArray *privateItems;

@end


@implementation BNRItemStore

+ (instancetype)sharedStore
{
    static BNRItemStore *sharedStore = nil;
    
    // Do I need to create a sharedStore?
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    
    return sharedStore;
}

- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use +[BNRItemStore sharedStore]"
                                 userInfo:nil];
    
    return nil;
}

- (instancetype) initPrivate
{
    self = [super init];
    
    _privateItems = [[NSMutableArray alloc] init];
    
    
    if (self) {
        // initialize array with 5 items
        for (int i=0; i<5; ++i) {
            [self createItem];
        }
    }
    
    return self;
}

-(NSArray*) allItems
{
    return self.privateItems;
}

-(BNRItem*) createItem
{
    BNRItem *item = [BNRItem randomItem];
    
    [self.privateItems addObject:item];
    
    
    return item; 
}

@end
