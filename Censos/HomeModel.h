//
//  HomeModel.h
//  pruebamysql
//
//  Created by Juan Pestana on 9/11/15.
//  Copyright (c) 2015 DPSoftware. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HomeModelProtocol <NSObject>

- (void)itemsDownloaded:(NSArray *)items;

@end

@interface HomeModel : NSObject <NSURLConnectionDataDelegate>

@property (nonatomic, weak) id<HomeModelProtocol> delegate;

- (void)downloadItems;

@end