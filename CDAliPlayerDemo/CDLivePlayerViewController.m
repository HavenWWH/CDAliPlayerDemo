//
//  CDLivePlayerViewController.m
//  CDAliPlayerDemo
//
//  Created by 吴文海 on 2019/3/15.
//  Copyright © 2019 吴文海. All rights reserved.
//

#import "CDLivePlayerViewController.h"

#import "CDLivePlayerView.h"

@interface CDLivePlayerViewController ()<CDLivePlayerViewDelegate>

@property (nonatomic, strong) CDLivePlayerView *playerView;

@end

@implementation CDLivePlayerViewController

#pragma mark - Life Cycle Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.playerView];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}
#pragma mark - Intial Methods

#pragma mark - Network Methods

#pragma mark - Target Methods

#pragma mark - Public Methods

#pragma mark - Private Method
- (BOOL)shouldAutorotate {
    
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    
    return UIInterfaceOrientationMaskLandscapeRight;
}

#pragma mark - External Delegate

#pragma mark - CDLivePlayerViewDelegate


#pragma mark - Setter Getter Methods
- (CDLivePlayerView *)playerView {
    if (!_playerView) {
        _playerView = [[CDLivePlayerView alloc] initWithFrame:CGRectMake(0, 0, ScreenHeight, ScreenWidth) withDelegate:self];
    }
    return _playerView;
}
@end
