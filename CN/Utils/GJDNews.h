//
//  GJDNews.h
//  CN
//
//  Created by JD－高 on 16/1/25.
//  Copyright © 2016年 jiangxiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GJDNews : NSObject
@property (strong,nonatomic) NSNumber * idid;
@property (strong,nonatomic) NSString * title;
@property (strong,nonatomic) NSString * subtitle;
@property (strong,nonatomic) NSString * picture;
@property (strong,nonatomic) NSString * time;
@property (strong,nonatomic) NSString * content;
@property (strong,nonatomic) NSNumber * flid;
@property (strong,nonatomic) NSString * author;
@property (strong,nonatomic) NSNumber * clicks;
@property (strong,nonatomic) NSData * image;
@end
