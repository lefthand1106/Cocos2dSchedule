//
//  HelloWorldLayer.h
//  Cocos2dSchedule
//
//  Created by 篠原正樹 on 2014/04/29.
//  Copyright masakishinohara 2014年. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate>
{
    CCLabelTTF * _label;
    NSInteger _count;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
