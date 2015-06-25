//
//  MasterViewController.m
//  toDoList
//
//  Created by Navaneethan Sivabalaviknarajah on 2015-06-24.
//  Copyright (c) 2015 Navaneethan Sivabalaviknarajah. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "ToDoItem.h"
#import "AddToDoItemViewController.h"

@interface MasterViewController ()


@property NSMutableArray *toDoItems;
@end

@implementation MasterViewController

- (IBAction)unwindToList:(UIStoryboardSegue *)segue {
    
    AddToDoItemViewController *source = [segue sourceViewController];
    
    ToDoItem *item = source.toDoItem;
    
    if (item != nil) {
        
        [self.toDoItems addObject:item];
        
        [self.tableView reloadData];
    }

}


-(void)loadInitialData {
    
    ToDoItem *item1 = [[ToDoItem alloc] init];
    item1.title = @"Pick up crate of Grape Dutchmasters";
    [self.toDoItems addObject:item1];
    
    ToDoItem *item2 = [[ToDoItem alloc] init];
    item2.title = @"Buy 4x Old Englsh for the swap meet";
    [self.toDoItems addObject:item2];
    
    ToDoItem *item3 = [[ToDoItem alloc] init];
    item3.title = @"Get Dickies suit tailored";
    [self.toDoItems addObject:item3];
    
    ToDoItem *item4 = [[ToDoItem alloc] init];
    item4.title = @"Repair SL-1200 turntable";
    [self.toDoItems addObject:item4];
    
    ToDoItem *item5 = [[ToDoItem alloc] init];
    item5.title = @"Get Cadillac DeVille rims polished";
    [self.toDoItems addObject:item5];
    
    
    
}
- (IBAction)cellSwipe:(UISwipeGestureRecognizer *)sender {
    
}



- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.toDoItems = [[NSMutableArray alloc] init];
    
    [self loadInitialData];

    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

//    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
//   self.navigationItem.rightBarButtonItem = addButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)insertNewObject:(id)sender {
//    if (!self.toDoItems) {
//        self.toDoItems = [[NSMutableArray alloc] init];
//    }
//    [self.objects insertObject:[NSDate date] atIndex:0];
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//}

#pragma mark - Segues

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([[segue identifier] isEqualToString:@"showDetail"]) {
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        NSDate *object = self.objects[indexPath.row];
//        [[segue destinationViewController] setDetailItem:object];
//    }
//}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.toDoItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    ToDoItem *toDoItem = [self.toDoItems objectAtIndex:indexPath.row];
    
    cell.textLabel.text = toDoItem.title;
    
    if (toDoItem.completed){
        
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        
    } else {
        
        cell.accessoryType = UITableViewCellAccessoryNone;
    }

    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath: (NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    ToDoItem *tappedItem = [self.toDoItems objectAtIndex:indexPath.row];
    
    tappedItem.completed = !tappedItem.completed;
    
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    
    
    
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)UITableViewCellEditingStyleDelete forRowAtIndexPath: (NSIndexPath *)indexPath {
    
    [self.toDoItems removeObjectAtIndex:indexPath.row];
    
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
   
    
    
}


//
//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
//    // Return NO if you do not want the specified item to be editable.
//    return YES;
//}
//
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        [self.objects removeObjectAtIndex:indexPath.row];
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
//        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
//    }
//}

@end
