//
//  GameScene.m
//  demoGame
//
//  Created by Sushant kumar on 25/05/15.
//  Copyright (c) 2015 Demo. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene{
    SKSpriteNode *sprite;
    NSInteger _score;
    SKLabelNode *_scoreLabelNode;
}

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    
    _score = 0;
    _scoreLabelNode = [SKLabelNode labelNodeWithFontNamed:@"MarkerFelt-Wide"];
    _scoreLabelNode.position = CGPointMake( CGRectGetMidX( self.frame ), 1 * self.frame.size.height / 10 );
    _scoreLabelNode.zPosition = 100;
    _scoreLabelNode.text = [NSString stringWithFormat:@"%d", _score];
    
    [self addChild:_scoreLabelNode];
    
    view.showsFPS = YES;
    view.showsNodeCount = YES;
    view.showsDrawCount = YES;
    view.showsQuadCount = YES;
    view.showsPhysics = YES;
    view.showsFields = YES;
    
    sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
    sprite.xScale = 0.5;
    sprite.yScale = 0.5;
    CGPoint location = CGPointMake(416.799988,224.000015);
    sprite.position = location;
    sprite.physicsBody.dynamic = YES;
    sprite.physicsBody.affectedByGravity = YES;
    
    CGFloat dx = 0;
    CGFloat dy = 100;
    CGVector vector = CGVectorMake(dx, dy);
    SKAction *action = [SKAction moveBy:vector duration:1];
    [sprite runAction:[SKAction repeatActionForever:action]];
    
    SKAction * loseAction = [SKAction runBlock:^{
        self.view.paused = YES;
    }];
//    [sprite runAction:[SKAction]];
    
    [self addChild:sprite];
    
    SKColor *_skyColor = [SKColor colorWithRed:113.0/255.0 green:137.0/255.0 blue:207.0/255.0 alpha:1.0];
    [self setBackgroundColor:_skyColor];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        
        CGPoint location = [touch locationInNode:self];
        
        
        sprite.xScale = 0.5;
        sprite.yScale = 0.5;
        sprite.position = location;
        
        CGFloat dx = 0;
        CGFloat dy = 10;
        
        CGVector vector = CGVectorMake(dx, dy);
        
        self.view.paused = NO;
        if (location.y > 400) {
            self.view.paused = YES;
        }
        
        SKAction *action = [SKAction moveBy:vector duration:1];
        [sprite runAction:[SKAction repeatActionForever:action]];
        
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    _score++;
    _scoreLabelNode.text = [NSString stringWithFormat:@"%d", _score];
    
}

@end
