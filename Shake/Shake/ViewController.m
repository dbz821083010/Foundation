//
//  ViewController.m
//  Shake
//
//  Created by lanouhn on 16/3/1.
//  Copyright © 2016年 LGQ. All rights reserved.
//

#import "ViewController.h"
#import "UITextField+Shake.h"
#import <AudioToolbox/AudioToolbox.h>
#import "DbzPlaySound.h"
@interface ViewController ()
{
    DbzPlaySound *playSound;
}
@property (strong, nonatomic) IBOutlet UITextField *username;
@property (strong, nonatomic) IBOutlet UITextField *password;
- (IBAction)login:(id)sender;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     playSound = [[DbzPlaySound  alloc] initForPlayingVibrate];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.username resignFirstResponder];
    [self.password resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)login:(id)sender {
    // 判断用户名和密码是否为空
    if (self.username.text.length == 0) {
        [self.username shake];
//        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
        [playSound play];
        return;
    }else if(self.password.text.length == 0) {
        [self.password shake];
        [playSound play];
        return;
    }

}
@end
