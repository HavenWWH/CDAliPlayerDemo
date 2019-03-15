//
//  ViewController.m
//  CDAliPlayerDemo
//
//  Created by 吴文海 on 2019/3/14.
//  Copyright © 2019 吴文海. All rights reserved.
//

#import "ViewController.h"
#import "CDLivePlayerViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *urlTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)playClick:(UIButton *)sender {
    CDLivePlayerViewController *playerVc = [[CDLivePlayerViewController alloc] init];
    playerVc.playUrl = self.urlTextField.text;
    [self presentViewController:playerVc animated:YES completion:nil];
}


- (BOOL)shouldAutorotate {
    return NO;
}
@end
