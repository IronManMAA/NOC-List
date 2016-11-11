//
//  DetailViewController of file Agent.h
//  NOC-List
//
//  Created by Marco Almeida on 11/11/16.
//  Copyright © 2016 THE IRON YARD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Agent : NSObject


@property (nonatomic) NSString *coverName;
@property (nonatomic) NSString *realName;
@property (assign) NSUInteger accessLevel;

+ (Agent *)agentItemWithDictionary:(NSDictionary *)agentItemDictionary;
// name of the method is agentItemWithDictionary
// we are declaring this method here in the "Agent.h" file. This makes it Public
// if entered in the "Agent.m" file it will be private Method.


@end

