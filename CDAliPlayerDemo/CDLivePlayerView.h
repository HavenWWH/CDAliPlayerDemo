//
//  CDLivePlayerView.h
//  CDAliPlayerDemo
//
//  Created by 吴文海 on 2019/3/15.
//  Copyright © 2019 吴文海. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height

#define CD_IS_IPHONE_X ((MIN([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) >= 375 && MAX([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) >= 812))

//底部Tabbar高度
#define CDTABBAR_HEIGHT  (CD_IS_IPHONE_X ? 83.0 : 50.0)

// iPhone X 系类安全区域适配
#define SafeAreaTopHeight (CD_IS_IPHONE_X ? 88 : 64)
#define SafeAreaBottomHeight (CD_IS_IPHONE_X ? 34 : 0)
#define SafeAreaStatusHeight (CD_IS_IPHONE_X ? 24 : 0)

@protocol CDLivePlayerViewDelegate <NSObject>

@optional

@end

@interface CDLivePlayerView : UIView

- (instancetype)initWithFrame:(CGRect)frame withDelegate:(id<CDLivePlayerViewDelegate>)delegate;

@end
