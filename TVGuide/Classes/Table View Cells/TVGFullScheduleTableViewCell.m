//
//  TVGFullScheduleTableViewCell.m
//  TVGuide
//
//  Created by Bruno Koga on 11/7/13.
//  Copyright (c) 2013 MobileAware. All rights reserved.
//

#import "TVGFullScheduleTableViewCell.h"
#import "BKThemeManager.h"

@implementation TVGFullScheduleTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setUp];
}

- (void)setUp
{
    id<TVGTheme> theme = [BKThemeManager theme];
    self.showNameLabel.textColor = [theme color2];
    self.channelLabel.textColor = [theme color1];
    self.timeLabel.textColor = [theme color1];
    self.amPmLabel.textColor = [theme color1];
    [self setUpDrawer];
}

- (void)setUpDrawer
{
    UIView *drawerView = [[UIView alloc] initWithFrame:self.frame];
    id<TVGTheme> theme = [BKThemeManager theme];
    UIColor *backgrouncColor = [theme color2];
    drawerView.backgroundColor = backgrouncColor;
    
    
    UIButton *favoriteButton = [[UIButton alloc] initWithFrame:CGRectMake(200.0, 0, 60.0, self.bounds.size.height)];
    [favoriteButton setImage:[UIImage imageNamed:@"icoHeart"] forState:UIControlStateNormal];
    [favoriteButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
    [favoriteButton setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [drawerView addSubview:favoriteButton];
    
    
    UIButton *clockButton = [[UIButton alloc] initWithFrame:CGRectMake(260.0, 0, 60.0, self.bounds.size.height)];
    [clockButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
    [clockButton setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [clockButton setImage:[UIImage imageNamed:@"icoClock"] forState:UIControlStateNormal];
    [drawerView addSubview:clockButton];
    
    self.drawerView = drawerView;
    self.maximumPan = 120.0;
    self.directionMask = UISwipeGestureRecognizerDirectionLeft;
}

#pragma mark - Superclass overriding

/*
 *
 * We're overriding this method because the original library doesn't support
 * partial-opened drawer.
 * To do so, I created a HHPanningTableViewCell_Private.h exposing some methods
 * and properties that I needed to correctly override this method.
 *
 */

- (void)setDrawerRevealed:(BOOL)revealed direction:(HHPanningTableViewCellDirection)direction animated:(BOOL)animated
{
	if ([self isEditing] || (self.drawerView == nil)) {
		return;
	}
    
	self.drawerRevealed = revealed;
    
	UIView	*drawerView		= self.drawerView;
	UIView	*shadowView		= self.shadowView;
	UIView	*contentView	= self.contentView;
    
	CGFloat duration		= animated ? HH_PANNING_ANIMATION_DURATION : 0.0f;
    
	if (revealed) {
		CGRect	bounds		= [contentView frame];
		CGFloat translation = 0.0f;
        
		if (direction == HHPanningTableViewCellDirectionRight) {
			translation = bounds.size.width -self.maximumPan;
		}
		else {
			translation = -self.maximumPan;
		}
        
		[self installViews];
        
		self.animationInProgress = YES;
        
		void	(^animations)(void) = ^{
			self.translation = translation;
		};
        
		void	(^completion)(BOOL finished) = ^(BOOL finished) {
			self.animationInProgress = NO;
		};
        
		if (animated) {
			[UIView animateWithDuration:HH_PANNING_ANIMATION_DURATION
								  delay:0.0f
								options:UIViewAnimationOptionCurveEaseOut
							 animations:animations
							 completion:completion];
		}
		else {
			animations();
			completion(YES);
		}
	}
	else {
		void	(^animations)(void) = ^{
			self.translation = 0.0f;
		};
        
		self.animationInProgress = YES;
        
		void	(^completion)(BOOL finished) = ^(BOOL finished) {
			[drawerView removeFromSuperview];
			[shadowView removeFromSuperview];
            
			self.animationInProgress = NO;
		};
        
		if (animated) {
			BOOL shouldBounce = self.shouldBounce;
            
			if (shouldBounce) {
				CGFloat bounceDuration		= duration;
				CGFloat translation			= self.translation;
				CGFloat bounceMultiplier	= fminf(fabsf(translation / HH_PANNING_TRIGGER_OFFSET), 1.0f);
				CGFloat bounceTranslation	= bounceMultiplier * HH_PANNING_BOUNCE_DISTANCE;
                
				if (translation < 0.0f) {
					bounceTranslation *= -1.0;
				}
                
				[UIView animateWithDuration:duration
									  delay:0.0f
									options:UIViewAnimationOptionCurveEaseOut
								 animations:animations
								 completion:^(BOOL finished) {
									 [UIView animateWithDuration:bounceDuration
														   delay:0.0f
														 options:UIViewAnimationOptionCurveLinear
													  animations:^{
														  self.translation = bounceTranslation;
													  } completion:^(BOOL finished) {
														  [UIView animateWithDuration:bounceDuration
																				delay:0.0f
																			  options:UIViewAnimationOptionCurveLinear
																		   animations:animations
																		   completion:completion];
													  }];
								 }];
			}
			else {
				[UIView animateWithDuration:duration
									  delay:0.0f
									options:UIViewAnimationOptionCurveEaseOut
								 animations:animations
								 completion:completion];
			}
		}
		else {
			animations();
			completion(YES);
		}
	}
}
@end
