#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ResumeTensorModuleFactory : NSObject

@property (nonatomic) NSMutableSet * trainConcurrentVarManager;

+ (instancetype) resumeTensorModuleFactoryWithDictionary: (NSDictionary *)dict;

- (instancetype) initWithDictionary: (NSDictionary *)dict;

- (NSString *) prepareComprehensiveSizeFactory;

- (NSMutableDictionary *) getLocalHeadInstance;

- (int) endLastParameterCache;

- (NSMutableSet *) continueSmallVarPool;

- (NSMutableArray *) fillIterativeParamTarget;

@end

NS_ASSUME_NONNULL_END
        