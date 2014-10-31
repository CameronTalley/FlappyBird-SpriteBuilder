#import "GamePlayScene.h"
#import "Character.h"
#import "Obstacle.h"

@implementation GamePlayScene

- (void)initialize
{
    // your code here
    character = (Character*)[CCBReader load:@"Character"];
    [physicsNode addChild:character];
    [self addObstacle];
    timeSinceObstacle = 0.0f;
}

-(void)update:(CCTime)delta
{
    // put update code here
    //Increment the time sinc the last obstacle was added
    timeSinceObstacle += delta;  //delta is approx. 1/60
    
    //check if two seconds have passed
    
    if (timeSinceObstacle > 2.0f)
    {
        //add a new obstacle
        [self addObstacle];
        //reset timer
        timeSinceObstacle = 0.0f;
    }
}

// put new methods here
- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    [character flap];
}

@end
