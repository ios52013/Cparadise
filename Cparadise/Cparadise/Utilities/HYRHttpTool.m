//
//  HYRHttpTool.m
//  Cparadise
//
//  Created by HYRLoveQi on 16/7/16.
//  Copyright © 2016年 HYRLoveQi. All rights reserved.
//

#import "HYRHttpTool.h"
#import "HYRParse.h"



@implementation HYRHttpTool

//创建网络请求对象
+(AFHTTPSessionManager *)manager{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //超时时间
    manager.requestSerializer.timeoutInterval = kTimeOutInterval;
    
    // 声明上传的是json格式的参数，需要你和后台约定好，不然会出现后台无法获取到你上传的参数问题
    // 上传普通格式
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    
#pragma mark - 上传json格式
    //manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    // 声明获取到的数据格式
    // AFN不会解析,数据是data，需要自己解析
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
#pragma mark - AFN会JSON解析返回的数据
    //manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    // 个人建议还是自己解析的比较好，有时接口返回的数据不合格会报3840错误，大致是AFN无法解析返回来的数据
    
    return manager;
}



//获取分类标签信息
+(void)fetchCategoryInfoSuccess:(MyCallBack) success andFailure:(MyCallBack) failure{
    // get请求也可以直接将参数放在字典里，AFN会自己将参数拼接在url的后面，不需要自己拼接
    NSDictionary *param = @{@"key":kAppKey};
    
    //NSString *url = [NSString stringWithFormat:@"%@?key=%@",kHostUrl,kAppKey];
    //创建请求对象
    AFHTTPSessionManager *manager = [self manager];
    //发起GET请求
    [manager GET:kHostUrl parameters:param progress:^(NSProgress * _Nonnull downloadProgress) {
        
        //// 这里可以获取到目前数据请求的进度
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //请求成功
        
        if (responseObject) {
            //把请求回来的json字符串转换成字典
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            
            //调用解析类来解析数据模型
            NSMutableArray *resultArr = [HYRParse parseCategoryInfoWithDic:dict];
            //把转成功的字典 返回出去
            success(resultArr);
            
        }else{
            success(@{@"msg": @"暂无数据~"});
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //请求失败
        NSString *reson = [error localizedDescription];
        failure(reson);//把请求错误的信息返回出去
    }];
    
    
    
}


//按标签检索菜谱
//http://apis.juhe.cn/cook/index?key=您申请的KEY&cid=1

+(void)fetchMenusWithCategoryID:(NSString *)categoryID andPn:(NSInteger)pn andSeccess:(MyCallBack)success andFailure:(MyCallBack)failure{
   
    
    NSString *urlString = [NSString stringWithFormat:@"%@key=%@&cid=%@&pn=%ld&rn=30",kServerAddress,kAppKey,categoryID,(long)pn];
    
    //
    AFHTTPSessionManager *manager = [self manager];
    
    [manager POST:urlString parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        //上传的时候
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        
        //请求成功
        
        if (responseObject) {
            //把请求回来的json字符串转换成字典
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            
            //调用解析类来解析数据模型
            NSMutableArray *resultArr = [HYRParse parseMenusWithDic:dict];
            //把转成功的字典 返回出去
            success(resultArr);
            
        }else{
            success(@{@"msg": @"暂无数据~"});
        }
        
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //
    
        NSLog(@"按标签检索菜谱请求失败 %@",[error localizedDescription]);
    }];
    
    
    
    
}





//公共调用AF的方法
+(void)requestDataWithUrl:(NSString * )url andSuccess:(MyCallBack)success andFailure:(MyCallBack)failure{
    
    //
}



@end
