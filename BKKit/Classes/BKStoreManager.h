//
//  BKStoreManager.h
//  Category_Demo
//
//  Created by BigKing on 2019/8/2.
//  Copyright © 2019 BigKing. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BKStoreManager : NSObject

/**
 获取存储在UserDefault.plist里面的对象

 @param key 键
 @return 值
 */
+ (nullable id)objectForPlistKey:(nonnull NSString *)key;

/**
 存储对象到UserDefault.plist

 @param object 需要保存的OC对象，只能是plist支持的类型
 @param key 键
 @return 是否保存成功
 */
+ (BOOL)setObject:(nonnull id)object key:(nonnull NSString *)key;


/**
 获取遵循Coding协议的对象

 @param key 键
 @return 值
 */
+ (nullable id)objectForCodingKey:(NSString *)key;


/**
 保存遵循Coding协议的对象

 @param object 对象，必须遵循NSCoding协议
 @param key 键
 @return 是否保存成功
 */
+ (BOOL)setCodingObject:(nonnull id<NSCoding, NSSecureCoding>)object key:(NSString *)key;


/**
 获取遵循Coding协议的对象，带路径

 @param path 保存的路径
 @return 值
 */
+ (nullable id)objectForCodingPath:(NSString *)path;


/**
 保存遵循Coding协议的对象，带路径

 @param object 对象，必须遵循NSCoding协议
 @param path 保存的路径
 @return 是否保存成功
 */
+ (BOOL)setCodingObject:(nonnull id<NSCoding, NSSecureCoding>)object path:(NSString *)path;


@end

NS_ASSUME_NONNULL_END
