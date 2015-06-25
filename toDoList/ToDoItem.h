//
//  ToDoItem.h
//  toDoList
//
//  Created by Navaneethan Sivabalaviknarajah on 2015-06-24.
//  Copyright (c) 2015 Navaneethan Sivabalaviknarajah. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject

@property NSString *title;

@property NSString *desc;

@property NSInteger *priorityNumber;

@property BOOL completed;

@end
