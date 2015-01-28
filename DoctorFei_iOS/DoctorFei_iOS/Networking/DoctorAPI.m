//
//  DoctorAPI.m
//  DoctorFei_iOS
//
//  Created by GuJunjia on 14/12/1.
//
//

#import "DoctorAPI.h"
#define kMethodUpdateInfomation @"update.doctor.information"
#define kMethodLogin @"set.doctor.login"
#define kMethodOnline @"set.doctor.online"
#define kMethodQRCode @"set.doctor.qrscene"
#define kMethodFriend @"get.doctor.friend"
#define kMethodUserNote @"set.doctor.usernote"
#define kMethodUploadImage @"set.picture.add"
#define kMethodUserDescribe @"set.doctor.userdesribe"
#define kMethodDelFriend @"set.doctor.delfriend"
#define kMethodSetAudit @"set.doctor.audit"
#define kMethodGetAudit @"get.doctor.audit"
#define kMethodGetDoctorDaylog @"get.doctor.daylog"
#define kMethodSetDoctorDaylog @"set.doctor.daylog"
#define kMethodUpdateDoctorDaylog @"update.doctor.daylog"
#define kMethodDoctorShuoshuo @"get.doctor.shuoshuo"
#define kMethodSetDoctorShuoshuo @"set.doctor.shuoshuo"
#define kMethodUpdateDoctorShuoshuo @"update.doctor.shuoshuo"

@implementation DoctorAPI
+ (void)updateInfomationWithParameters: (id)parameters success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    [[self sharedManager]defaultGetWithMethod:kMethodUpdateInfomation WithParameters:parameters success:success failure:failure];
}
+ (void)loginWithParameters: (id)parameters success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    [[self sharedManager]defaultGetWithMethod:kMethodLogin WithParameters:parameters success:success failure:failure];
}

+ (void)onlineWithParameters: (id)parameters success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    [[self sharedManager]defaultGetWithMethod:kMethodOnline WithParameters:parameters success:success failure:failure];
}
+ (void)getQRCodeWithParameters: (id)parameters success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    [[self sharedManager]defaultGetWithMethod:kMethodQRCode WithParameters:parameters success:success failure:failure];
}
+ (void)getFriendsWithParameters: (id)parameters success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    [[self sharedManager]defaultGetWithMethod:kMethodFriend WithParameters:parameters success:success failure:failure];
}

+ (void)setUserNoteWithParameters: (id)parameters success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    [[self sharedManager]defaultGetWithMethod:kMethodUserNote WithParameters:parameters success:success failure:failure];
}

+ (void)uploadImage: (UIImage *)image success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    NSString *str = [UIImageJPEGRepresentation(image, 0.8) base64EncodedStringWithOptions:0];
    str = [str stringByReplacingOccurrencesOfString:@"+" withString:@"|JH|"];
    str = [str stringByReplacingOccurrencesOfString:@" " withString:@"|KG|"];
    str = [str stringByReplacingOccurrencesOfString:@"\n" withString:@"|HC|"];
    
    NSDictionary *params = @{
                             @"picturename": [NSString stringWithFormat:@"%d.jpg", (int)[[NSDate date] timeIntervalSince1970]],
                             @"img": str
                             };
    [DoctorAPI uploadImageWithParameters:params success:success failure:failure];
}

+ (void)uploadImageWithParameters: (id)parameters success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    [[self sharedManager]defaultPostWithMethod:kMethodUploadImage WithParameters:parameters success:success failure:failure];
}

+ (void)setUserDescribeWithParameters: (id)parameters success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    [[self sharedManager]defaultGetWithMethod:kMethodUserDescribe WithParameters:parameters success:success failure:failure];
}

+ (void)delFriendWithParameters: (id)parameters success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    [[self sharedManager]defaultGetWithMethod:kMethodDelFriend WithParameters:parameters success:success failure:failure];
}

+ (void)getAuditWithParameters: (id)parameters success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    [[self sharedManager]defaultGetWithMethod:kMethodGetAudit WithParameters:parameters success:success failure:failure];
}

+ (void)setAuditWithParameters: (id)parameters success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    [[self sharedManager]defaultGetWithMethod:kMethodSetAudit WithParameters:parameters success:success failure:failure];
}

+ (void)DoctorShuoshuoWithParameters: (id)parameters success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    [[self sharedManager]defaultGetWithMethod:kMethodDoctorShuoshuo WithParameters:parameters success:success failure:failure];
}

+ (void)setDoctorDaylogWithParameters: (id)parameters WithBodyParameters:(id)bodyParameters success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    [[self sharedManager]defaultPostWithMethod:kMethodSetDoctorDaylog WithParameters:parameters WithBodyParameters:bodyParameters success:success failure:failure];
}

+ (void)getDoctorDaylogWithParameters: (id)parameters success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    [[self sharedManager]defaultGetWithMethod:kMethodGetDoctorDaylog WithParameters:parameters success:success failure:failure];
}

+ (void)updateDoctorDaylogWithParameters: (id)parameters WithBodyParameters:(id)bodyParameters success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    [[self sharedManager]defaultPostWithMethod:kMethodUpdateDoctorDaylog WithParameters:parameters WithBodyParameters:bodyParameters success:success failure:failure];
}

+ (void)setDoctorShuoshuoWithParameters: (id)parameters WithBodyParameters:(id)bodyParameters success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    [[self sharedManager]defaultPostWithMethod:kMethodSetDoctorShuoshuo WithParameters:parameters WithBodyParameters:bodyParameters success:success failure:failure];
}

+ (void)updateDoctorShuoshuoWithParameters: (id)parameters WithBodyParameters:(id)bodyParameters success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    [[self sharedManager]defaultPostWithMethod:kMethodUpdateDoctorShuoshuo WithParameters:parameters WithBodyParameters:bodyParameters success:success failure:failure];
}
@end
