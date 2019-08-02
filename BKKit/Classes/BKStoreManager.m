//
//  BKStoreManager.m
//  Category_Demo
//
//  Created by BigKing on 2019/8/2.
//  Copyright © 2019 BigKing. All rights reserved.
//

#import "BKStoreManager.h"

@implementation BKStoreManager

/**
 获取存储在UserDefault.plist里面的对象
 
 @param key 键
 @return 值
 */
+ (nullable id)objectForPlistKey:(nonnull NSString *)key {
    return [NSUserDefaults.standardUserDefaults objectForKey:key];
}

/**
 存储对象到UserDefault.plist
 
 @param object 需要保存的OC对象，只能是plist支持的类型
 @param key 键
 @return 是否保存成功
 */
+ (BOOL)setObject:(nonnull id)object key:(nonnull NSString *)key {
    [NSUserDefaults.standardUserDefaults setObject:object forKey:key];
    return [NSUserDefaults.standardUserDefaults synchronize];
}


/**
 获取遵循Coding协议的对象
 
 @param key 键
 @return 值
 */
+ (nullable id)objectForCodingKey:(NSString *)key {
    
    NSData *data = [NSUserDefaults.standardUserDefaults objectForKey:key];
    
    if (@available(iOS 11.0, *)) {
        
        NSError *error = nil;
        id obj = [NSKeyedUnarchiver unarchivedObjectOfClass:[NSObject class] fromData:data error:&error];
        
        if (error) {
            return nil;
        }
        
        return obj;
    }else {
        return [NSKeyedUnarchiver unarchiveObjectWithData:data];
    }
    
}


/**
 保存遵循Coding协议的对象
 
 @param object 对象，必须遵循NSCoding协议
 @param key 键
 @return 是否保存成功
 */
+ (BOOL)setCodingObject:(nonnull id<NSCoding, NSSecureCoding>)object key:(NSString *)key {
    
    NSError *error = nil;
    NSData *data = nil;
    
    if (@available(iOS 11.0, *)) {
        data = [NSKeyedArchiver archivedDataWithRootObject:object requiringSecureCoding:YES error:&error];
        
        if (error) {
            NSLog(@"保存数据出错：%@", error);
            return NO;
        }
    } else {
        data = [NSKeyedArchiver archivedDataWithRootObject:object];
    }
    
    [NSUserDefaults.standardUserDefaults setObject:data forKey:key];
    
    return [NSUserDefaults.standardUserDefaults synchronize];
    
}


/**
 获取遵循Coding协议的对象，带路径
 
 @param path 保存的路径
 @return 值
 */
+ (nullable id)objectForCodingPath:(NSString *)path {
    
    if ([NSFileManager.defaultManager fileExistsAtPath:path]) {
        
        NSData *data = [NSData dataWithContentsOfFile:path];
        
        if (@available(iOS 11.0, *)) {
            return [NSKeyedUnarchiver unarchivedObjectOfClass:[NSObject class] fromData:data error:nil];
        }else {
            return [NSKeyedUnarchiver unarchiveObjectWithData:data];
        }
    }
    
    return nil;
}


/**
 保存遵循Coding协议的对象，带路径
 
 @param object 对象，必须遵循NSCoding协议
 @param path 保存的路径
 @return 是否保存成功
 */
+ (BOOL)setCodingObject:(nonnull id<NSCoding, NSSecureCoding>)object path:(NSString *)path {
    
    NSError *error = nil;
    NSData *data = nil;
    
    if (@available(iOS 11.0, *)) {
        data = [NSKeyedArchiver archivedDataWithRootObject:object requiringSecureCoding:NO error:&error];
        
        if (error) {
            NSLog(@"保存数据出错：%@", error);
            return NO;
        }
    } else {
        data = [NSKeyedArchiver archivedDataWithRootObject:object];
    }
    
    return [data writeToFile:path atomically:YES];
    
}


@end
