//
//  ViewController.m
//  BullsEye
//
//  Created by Jason Guo on 8/15/15.
//  Copyright (c) 2015 JasonGuo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    int _currentValue ;
    int _targetValue;
    int _score;
    int _round;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    _currentValue = self.slider.value;
//   _targetValue = 1 + arc4random_uniform(100);
    [self startNewGame];
    [self updateLabels];
    
    UIImage *thumbImageNormal = [UIImage imageNamed:@"SliderThumb-Normal"];
    [self.slider setThumbImage:thumbImageNormal forState:UIControlStateNormal];
    
    UIImage *thumbImageHighlighted = [UIImage imageNamed:@"SliderThumb-Highlighted"];
    [self.slider setThumbImage:thumbImageHighlighted forState:UIControlStateHighlighted];
    
    UIImage *trackLeftImage = [[UIImage imageNamed:@"SliderTrackLeft"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 14, 0, 14)];
    [self.slider setMinimumTrackImage:trackLeftImage forState:UIControlStateNormal];
    
    UIImage *trackRightImage = [[UIImage imageNamed:@"SliderTrackRight"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 14, 0, 14)];
    [self.slider setMaximumTrackImage:trackRightImage forState:UIControlStateNormal];

}

- (void)startNewGame
{
    _round = 0;
    _score = 0;
    [self startNewRound];
}

- (void)startNewRound
{
    _round += 1;
    _targetValue = 1 + arc4random_uniform(100);
    _currentValue = 50;
    self.slider.value = _currentValue;
}

- (void)updateLabels
{
    self.targetLabel.text = [NSString stringWithFormat:@"%d",_targetValue];
    self.scoreLable.text = [NSString stringWithFormat:@"%d",_score];
    self.roundLable.text = [NSString stringWithFormat:@"%d",_round];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showAlert
{
    int difference = abs(_currentValue - _targetValue);
    int points = 100 - difference;

    
/*    if (difference < 0) {
        difference *= -1;
    }
*/
/*
    if (_currentValue > _targetValue) {
        difference = _currentValue - _targetValue;
    }
    else if (_currentValue < _targetValue){
        difference = _targetValue - _currentValue;
    }
    else{
        difference = 0;
    }
*/
    NSString *title;
    if (difference == 0) {
        title = @"Perfect!";
        points += 100;
    }
    else if(difference < 5){
        title = @"You almost had it!";
        points += (6 - difference) * 10;
    }
    else if (difference < 10){
        title = @"Pretty good!";
    }
    else{
        title = @"Not even close...";
    }
    _score += points;
    
    NSString *message = [NSString stringWithFormat:
    @"You tap the number %d.\nAnd you scored %d points.",_currentValue,points];
    
    UIAlertView *alertView = [[UIAlertView alloc]
        initWithTitle:title
        message:message
        delegate:self
        cancelButtonTitle:@"OK"
        otherButtonTitles:nil];
    
  [alertView show];

}

- (IBAction)sliderMoved:(UISlider *)slider{
//    NSLog(@"The value if the slider is now: %f", slider.value);
    _currentValue = lround(slider.value);
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [self startNewRound];
    [self updateLabels];
}


- (void)startOver
{

    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionFade;
    transition.duration = 1;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    [self startNewGame];
    [self updateLabels];
    [self.view.layer addAnimation:transition forKey:nil];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
