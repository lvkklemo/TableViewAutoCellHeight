//
//  HWEditNumberModel.h
//  TableViewAutoCellHeight
//
//  Created by 宇航 on 2018/9/20.
//  Copyright © 2018年 HWD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HWEditNumberModel : NSObject

@property (nonatomic, copy) NSArray *communicationOptions;
@property (nonatomic, copy) NSArray *contacts;
@end

@interface HQMInfoModel : NSObject
@property (nonatomic, copy) NSString *infoId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *value;
@end

@interface HQMContactTypeModel : NSObject
@property (nonatomic, copy) NSString *contactType;
@property (nonatomic, copy) NSString *contact;
@property (nonatomic, copy) NSString *contactid;
@end
