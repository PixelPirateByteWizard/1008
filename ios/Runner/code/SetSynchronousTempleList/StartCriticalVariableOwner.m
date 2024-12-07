#import "StartCriticalVariableOwner.h"
    
@interface StartCriticalVariableOwner ()

@end

@implementation StartCriticalVariableOwner

- (void) getPriorScaleList: (NSString *)getMultiSineList
{
	dispatch_async(dispatch_get_main_queue(), ^{
		UISegmentedControl *trainMutableObjectGroup = [[UISegmentedControl alloc] init];
		[trainMutableObjectGroup insertSegmentWithTitle:getMultiSineList atIndex:0 animated:YES];
		BOOL quantizerPermanentTextInstance = trainMutableObjectGroup.isEnabled;
		if (quantizerPermanentTextInstance) {
			UISegmentedControl *trainMutableObjectGroup = [[UISegmentedControl alloc] init];
			[trainMutableObjectGroup insertSegmentWithTitle:getMultiSineList atIndex:0 animated:YES];
			BOOL quantizerPermanentTextInstance = trainMutableObjectGroup.isEnabled;
		}
		//NSLog(@"sets= bussiness5 gen_str %@", bussiness5);
	});
}


@end
        