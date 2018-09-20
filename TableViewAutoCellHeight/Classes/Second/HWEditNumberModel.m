//
//  HWEditNumberModel.m
//  TableViewAutoCellHeight
//
//  Created by 宇航 on 2018/9/20.
//  Copyright © 2018年 HWD. All rights reserved.
//

#import "HWEditNumberModel.h"
#import "MJExtension.h"

@implementation HWEditNumberModel

+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"communicationOptions":[HQMInfoModel class],
             @"inviteRefuseReasonInfo":[HQMInfoModel class],
             @"nextFollowUpInfo":[HQMInfoModel class],
             @"educationInfo":[HQMInfoModel class],
             @"followUpWayInfo":[HQMInfoModel class],
             @"levelInfo":[HQMInfoModel class],
             @"contacts":[HQMContactTypeModel class]
             };
}
@end
@implementation HQMInfoModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"infoId":@"id"};
}
@end
@implementation HQMContactTypeModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"contactid":@"id"};
}
@end

