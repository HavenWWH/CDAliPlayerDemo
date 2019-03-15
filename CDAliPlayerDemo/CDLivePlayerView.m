//
//  CDLivePlayerView.m
//  CDAliPlayerDemo
//
//  Created by 吴文海 on 2019/3/15.
//  Copyright © 2019 吴文海. All rights reserved.
//

#import "CDLivePlayerView.h"

#import <AliyunVodPlayerSDK/AliyunVodPlayer.h>

@interface CDLivePlayerView ()<CDLivePlayerViewDelegate, AliyunVodPlayerDelegate>

@property (nonatomic, weak) id <CDLivePlayerViewDelegate>delegate;

@property (nonatomic, strong) AliyunVodPlayer  *aliPlayer;

@property (nonatomic, strong) UIView *playerPreView;
// 竖屏时的frame
@property (nonatomic, assign) CGRect saveFrame;

@end

@implementation CDLivePlayerView

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (instancetype)initWithFrame:(CGRect)frame withDelegate:(id<CDLivePlayerViewDelegate>)delegate {
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        self.saveFrame = [self isInterfaceOrientationPortrait] ? frame : CGRectZero;
        [self setupView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self setupView];
    }
    return self;
}
#pragma mark - Intial Methods
- (void)setupView {
    
    [self addSubview:self.aliPlayer.playerView];
    self.playerPreView.frame = self.bounds;
    
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(100, 20, 100, 50)];
    lab.text = @"爽肤水地方";
    lab.textColor = [UIColor blueColor];
    [self addSubview:lab];
    
    [self addNotice];
    
    [self.aliPlayer prepareWithURL:[NSURL URLWithString:@"rtmp://live.changguwen.com/changdao/21312312321?auth_key=1552616265-7932137c75a64c9087d6b70d06871fa0-0-db00551c9e85c315a01fedb1e90c99c7"]];
    [self.aliPlayer start];
    
    [self masLayoutSubViews];
}
- (void)masLayoutSubViews {
    
}
#pragma mark - Target Methods

#pragma mark - Public Methods
- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    
    if ([self isInterfaceOrientationPortrait]) {
        
        self.saveFrame = frame;
    }
}

#pragma mark - Private Method
- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.aliPlayer.playerView.frame = self.bounds;
}

// 是否竖屏
- (BOOL)isInterfaceOrientationPortrait {
    
    UIInterfaceOrientation Orientation = [[UIApplication sharedApplication] statusBarOrientation];
    return Orientation == UIInterfaceOrientationPortrait;
}
- (void)addNotice {
    //屏幕旋转通知
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleDeviceOrientationDidChange:)
                                                 name:UIDeviceOrientationDidChangeNotification
                                               object:nil];
}
     
- (void)handleDeviceOrientationDidChange:(UIInterfaceOrientation)interfaceOrientation {
    
    UIDevice *device = [UIDevice currentDevice];
    switch (device.orientation) {
        case UIDeviceOrientationFaceUp:
        case UIDeviceOrientationFaceDown:
        case UIDeviceOrientationUnknown:
        case UIDeviceOrientationPortraitUpsideDown:
            break;
        case UIDeviceOrientationLandscapeLeft:
        case UIDeviceOrientationLandscapeRight:
        {
            self.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
        }
            break;
        case UIDeviceOrientationPortrait:
        {
         
            if (self.saveFrame.origin.x == 0 && self.saveFrame.origin.y==0 && self.saveFrame.size.width == 0 && self.saveFrame.size.height == 0) {
          
                CGRect tempFrame = self.frame ;
                tempFrame.size.width = self.frame.size.height;
                tempFrame.size.height = self.frame.size.height * 9 / 16.0;
                self.frame = tempFrame;
                
            }else{
                
                self.frame = self.saveFrame;
            }
           
            //2018-6-28 cai
            BOOL isFullScreen = YES;
            if (self.frame.size.width > self.frame.size.height) {
                isFullScreen = NO;
            }
        }
            break;
        default:
            break;
    }
}

#pragma mark - CDLivePlayerViewDelegate -
/**
 * 播放事件协议方法,主要内容 AliyunVodPlayerEventPrepareDone状态下，此时获取到播放视频数据（时长、当前播放数据、视频宽高等）
 */
- (void)vodPlayer:(AliyunVodPlayer *)vodPlayer onEventCallback:(AliyunVodPlayerEvent)event {
    
    switch (event) {
        case AliyunVodPlayerEventBeginLoading: { //视频开始载入
            
    
            break;
        }
        case AliyunVodPlayerEventEndLoading: {  //视频加载完成
            
            
            break;
        }
        case AliyunVodPlayerEventPlay: {  //暂停后恢复播放或者播放
            
            break;
        }
        case AliyunVodPlayerEventPause: { //视频暂停
            
          
            break;
        }
        case AliyunVodPlayerEventStop: { //主动使用stop接口
            
        
            break;
        }
        case AliyunVodPlayerEventFinish: { //视频正常播放完成
     
           
            break;
        }
        case AliyunVodPlayerEventFirstFrame: { //播放视频首帧显示出来时
            
           
            break;
        }
        case AliyunVodPlayerEventSeekDone: {  //视频Seek完成
            
           
            break;
        }
        default:
            break;
    }
}

/**
 * 播放器播放时发生错误时，回调信息
 */
- (void)vodPlayer:(AliyunVodPlayer *)vodPlayer playBackErrorModel:(AliyunPlayerVideoErrorModel *)errorModel {
    
    NSLog(@"播放器发生错误%@", errorModel);
}

/**
 * 获取缓冲进度0-100
 */
- (void)vodPlayer:(AliyunVodPlayer*)vodPlayer loadingProgress:(int)loadingProgress {
    
}

/**
 * 播放器状态改变回调
 */
- (void)vodPlayer:(AliyunVodPlayer*)vodPlayer newPlayerState:(AliyunVodPlayerState)newState {
    
}

/**
 * 播放器播放即将切换清晰度时quality ： vid+playauth播放方式、vid+sts播放方式时的清晰度
 */
- (void)vodPlayer:(AliyunVodPlayer*)vodPlayer willSwitchToQuality:(AliyunVodPlayerVideoQuality)quality videoDefinition:(NSString*)videoDefinition {
    
}

/**
 * 播放器播放切换清晰度完成 quality ： vid+playauth播放方式、vid+sts播放方式时的清晰度
 */
- (void)vodPlayer:(AliyunVodPlayer *)vodPlayer didSwitchToQuality:(AliyunVodPlayerVideoQuality)quality videoDefinition:(NSString*)videoDefinition {
    
}

/**
 * 播放器播放切换清晰度失败
 */
- (void)vodPlayer:(AliyunVodPlayer*)vodPlayer failSwitchToQuality:(AliyunVodPlayerVideoQuality)quality videoDefinition:(NSString*)videoDefinition {
    
}

/**
 * 功能：1.播放器设置了循环播放，此代理方法才会有效。2.播放器播放完成后，开始循环播放后，此协议被调用
 */
- (void)onCircleStartWithVodPlayer:(AliyunVodPlayer*)vodPlayer {
    
}

/*
 *功能：播放器请求时，通知用户传入的参数鉴权过期。
 */
- (void)onTimeExpiredErrorWithVodPlayer:(AliyunVodPlayer *)vodPlayer {
    
}

/*
 *功能：播放地址将要过期时，提示用户当前播放地址过期。 （策略：当前播放器地址过期时间2小时，我们在播放地址差1分钟过期时提供回调；（7200-60）秒时发送）
 *参数：videoid：将过期时播放的videoId
 *参数：quality：将过期时播放的清晰度，playauth播放方式和STS播放方式有效。
 *参数：videoDefinition：将过期时播放的清晰度，MPS播放方式时有效。
 */
- (void)vodPlayerPlaybackAddressExpiredWithVideoId:(NSString *)videoId quality:(AliyunVodPlayerVideoQuality)quality videoDefinition:(NSString*)videoDefinition {
    
}

#pragma mark - Setter Getter Methods
- (AliyunVodPlayer *)aliPlayer {
    if (!_aliPlayer) {
        _aliPlayer = [[AliyunVodPlayer alloc] init];
        _aliPlayer.delegate = self;
        self.playerPreView = _aliPlayer.playerView;
    }
    return _aliPlayer;
}
@end
