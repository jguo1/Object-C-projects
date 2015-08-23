//
//  ToDoItem.h
//  ToDoList
//
//  Created by Jason Guo on 8/22/15.
//  Copyright (c) 2015 JasonGuo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject

@property NSString *itemName;
@property BOOL completed;
@property (readonly) NSDate *creationDate;

@end
