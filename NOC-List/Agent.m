//
//  DetailViewController file named Agent.m
//  NOC-List
//
//  Created by Marco Almeida on 11/11/16.
//  Copyright © 2016 THE IRON YARD. All rights reserved.
//

#import "Agent.h"

@interface Agent ()

@end

@implementation Agent

// above implimentation name and the import name should be the same.

+ (Agent *)agentItemWithDictionary:(NSDictionary *)agentItemDictionary
// name of the method is agentItemWithDictionary
// it must also be declared in the DetailViewController file Agent.h file
// we are declaring this method here in the "Agent.h" file to make it Public
// if entered in the "AgentItem.m" file, it will be private Method.

{
    Agent *anItem = nil;
    // nil means nothing which is not the same as zero
    if (agentItemDictionary)
        // if agentItemDictionary exists do the following
    {
        anItem = [[Agent alloc] init];
        // allocate memory in the computer and initiolize for the anItem object
        anItem.coverName = agentItemDictionary[@"coverName"];
        // name of the dictionary key (red) was giving the same name as de attribute name.
        anItem.realName = agentItemDictionary[@"realName"];
        anItem.accessLevel = [agentItemDictionary[@"accessLevel"] integerValue];
    }
    return anItem;
}


@end


