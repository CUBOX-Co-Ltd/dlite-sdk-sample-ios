#ifndef __FACEALIGNMNETMODULE_H__
#define __FACEALIGNMNETMODULE_H__

//
//  FaceAlignmnetModule.h
//  Inferencemodule
//
//  Created by CUBOX on 11/20/24.
//

#import <UIKit/UIKit.h>

@interface FaceAlignmentModule : NSObject

- (UIImage *)FaceImageAlignment:(UIImage *)image srcPoints:(NSArray *)src dstPoints:(NSArray *)dst;

@end

#endif
