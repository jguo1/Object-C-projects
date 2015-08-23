//
//  ViewController.h
//  BullsEye
//
//  Created by Jason Guo on 8/15/15.
//  Copyright (c) 2015 JasonGuo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIAlertViewDelegate>

@property (nonatomic, weak) IBOutlet UISlider *slider;
@property (nonatomic, weak) IBOutlet UILabel *targetLabel;
@property (nonatomic, weak) IBOutlet UILabel *scoreLable;
@property (nonatomic, weak) IBOutlet UILabel *roundLable;

- (IBAction)showAlert;
- (IBAction)sliderMoved:(UISlider *)slider;
- (IBAction)startOver;


@end

