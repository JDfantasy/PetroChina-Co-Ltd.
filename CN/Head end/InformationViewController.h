//
//  InformationViewController.h
//  CN
//
//  Created by JD－高 on 16/1/24.
//  Copyright © 2016年 PetroChina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InformationViewController : UIViewController
@property (copy, nonatomic) NSString *country;
@property (copy, nonatomic) NSString *state;
@property (copy, nonatomic) NSString *city;
@property (copy, nonatomic) NSString *district;
@property (copy, nonatomic) NSString *street;
@property (nonatomic) double latitude;
@property (nonatomic) double longitude;

@end
