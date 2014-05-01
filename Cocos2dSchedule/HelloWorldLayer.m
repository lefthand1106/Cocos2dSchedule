//
//  HelloWorldLayer.m
//  Cocos2dSchedule
//
//  Created by 篠原正樹 on 2014/04/29.
//  Copyright masakishinohara 2014年. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#pragma mark - HelloWorldLayer

/*
@interface HelloWorldLayer()


-(void)onScheduleEvent:(ccTime)delta;

@end
*/

// HelloWorldLayer implementation
@implementation HelloWorldLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
		
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        
        _label = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d", _count]
                                     fontName:@"Marker Felt" fontSize:60];
        
        _label.position = CGPointMake(winSize.width / 2, winSize.height / 2);
                  [self addChild:_label];
                  [self schedule:@selector(onScheduleEvent:) interval:1];
                  [self unscheduleUpdate];
        
	}
	return self;
}
                  
                  
-(void)onScheduleEvent:(ccTime)delta
                  {
                      _label.string = [NSString stringWithFormat:@"%d", ++_count];
                      
                      if (_count == 10) {
                          [self unscheduleAllSelectors];
                      }
                  }

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

#pragma mark GameKit delegate

-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}
@end
