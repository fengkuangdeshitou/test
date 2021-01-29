//
//  JWTAlgorithmNameES256.m
//  Nav
//
//  Created by maiyou on 2020/12/11.
//

#import <CommonCrypto/CommonCrypto.h>
#import <CommonCrypto/CommonHMAC.h>
#import "JWTAlgorithmNameES256.h"

@implementation JWTAlgorithmNameES256

- (size_t)ccSHANumberDigestLength {
    return CC_SHA256_DIGEST_LENGTH;
}

- (uint32_t)ccHmacAlgSHANumber {
    return kCCHmacAlgSHA256;
}

- (NSString *)name;
{
    return @"ES256";
}

@end
