


//
//  AgentsTableViewController.m
//  NOC-List
//
//  Created by Marco Almeida on 11/11/16.
//  Copyright © 2016 THE IRON YARD. All rights reserved.
//

#import "AgentsTableViewController.h"
#import "Agent.h"

@interface AgentsTableViewController ()

@property (nonatomic,strong) NSMutableArray *agents;
// NSMutableArray because it will take diferent values as it loops to get new rows and collums
// if not mutable it should be NSArray

@end

@implementation AgentsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadAgents];
    // run viewDidLoad and loadAgents method
}

- (void) loadAgents
// "void" means that this method does not return nothing, it just performs a job
{
    NSString *filePath =[[NSBundle mainBundle] pathForResource:@"NOC" ofType:@"json"];
    // get the path of the NOC.json file in the mainbundle of this application as opposed to somewhere else such as the Supporting files directory.
    NSArray *agentsJSON =[NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath] options:NSJSONReadingAllowFragments error: nil];
    // reads the file located in the "filePath" assuming it is a JSON file
    // NSJSONSerialization a method to verify file type and content as defined in the next method which in this case is JSONObjectWithData to confirm that the file is indeed a JSON file properly formatted
    self.agents = [[NSMutableArray alloc] init];
    for (NSDictionary *aDictionary in agentsJSON)
        // get the dictionary from groceriesJSON and save it to aDictionary. The aDictionary is a user defined name that could be e.g. mytempdictionary
    {
        Agent *anItem = [Agent agentItemWithDictionary:aDictionary];
        [self.agents addObject:anItem];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // 1 means this table will have 1 level down.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.agents.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"AgentCell" forIndexPath:indexPath];
    //AgentCell is user defined Name that is provided from main StoryBoard identifier field you gave
                             
    
    // Configure the cell...
    
    Agent *anItem = self.agents[indexPath.row];
    cell.textLabel.text = anItem.coverName;
    cell.detailTextLabel.text = anItem.realName;
//    cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld", (long)anItem.accessLevel];
    // convert integer of aisle variable into string
    //"coverName": "Ethan Hunt",
    //"realName": "Tom Cruise",
    //"accessLevel": 8
    
    
    return cell;
}


@end


