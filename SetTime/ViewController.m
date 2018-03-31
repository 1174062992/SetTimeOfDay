//
//  ViewController.m
//  SetTime
//
//  Created by 曹记 on 2018/3/31.
//  Copyright © 2018年 曹记. All rights reserved.
//

#import "ViewController.h"
#import "HWCalendar.h"

@interface ViewController ()<UITextFieldDelegate, HWCalendarDelegate>

@property (nonatomic, weak) HWCalendar *calendar;
@property (nonatomic, strong) UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    //创建控件
    [self creatControl];
}

- (void)creatControl
{
    //输入框
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(7, 264, 400, 44)];
    _textField.delegate = self;
    _textField.layer.cornerRadius = 22;
    _textField.layer.masksToBounds = YES;
    _textField.placeholder = @"请设置日期";
    _textField.textAlignment = NSTextAlignmentCenter;
    _textField.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_textField];
    
    //日历
    HWCalendar *calendar = [[HWCalendar alloc] initWithFrame:CGRectMake(7, [UIScreen mainScreen].bounds.size.height, 400, 396)];
    calendar.delegate = self;
    calendar.showTimePicker = YES;
    [self.view addSubview:calendar];
    self.calendar = calendar;
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (_calendar.frame.origin.y != [UIScreen mainScreen].bounds.size.height && _calendar) {
        [_calendar dismiss];
        return NO;
        
    }else if (textField == _textField) {
        [_calendar show];
        return NO;
    }
    
    return YES;
}

#pragma mark - HWCalendarDelegate
- (void)calendar:(HWCalendar *)calendar didClickSureButtonWithDate:(NSString *)date
{
    _textField.text = date;
}

@end

