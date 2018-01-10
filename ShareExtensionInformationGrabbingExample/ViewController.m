//
//  ViewController.m
//  ShareExtensionInformationGrabbingExample
//
//  Created by Jonathan on 1/10/18.
//  Copyright © 2018 Jonathan Winger Lang. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (IBAction)share:(id)sender {
    UIActivityViewController *activityController;
    
    // We send SELF here because I will provide items through the delegate methods below.
    activityController = [[UIActivityViewController alloc] initWithActivityItems:@[self]
                                                           applicationActivities:nil];
    
    [activityController setCompletionWithItemsHandler:^(UIActivityType __nullable activityType,
                                                        BOOL completed,
                                                        NSArray *__nullable returnedItems,
                                                        NSError *__nullable activityError) {
        NSLog(@"Share completed for: %@", activityType);
    }];
    
    [self presentViewController:activityController animated:YES completion:nil];
}

-(id)activityViewController:(UIActivityViewController *)activityViewController
        itemForActivityType:(UIActivityType)activityType {
    return [NSString stringWithFormat:@"Share from: %@", activityType];
}

-(id)activityViewControllerPlaceholderItem:(UIActivityViewController *)activityViewController{
    return @"PlaceHolderText (in case we select an activity type we don't handle. However in this case we handle everything).";
}

@end
