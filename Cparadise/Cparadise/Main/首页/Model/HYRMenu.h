//
//  HYRMenu.h
//  Cparadise
//
//  Created by HYRLoveQi on 16/7/28.
//  Copyright © 2016年 HYRLoveQi. All rights reserved.
/*
 请求参数说明
 cid	标签ID
 key	应用APPKEY(应用详细页查询)
 dtype	返回数据的格式,xml或json，默认json
 pn		数据返回起始下标，默认0
 rn	    数据返回条数，最大30，默认10
 format	steps字段屏蔽，默认显示，format=1时屏蔽
 
 返回参数明细
 error_code		返回码
 reason	        返回说明
 result	     	返回结果集
 data	     	菜谱详情
 
 
 "data": [{
 "id": "909",
 "title": "泰式柠檬蒸鲈鱼",
 "tags": "家常菜;私房菜;海鲜类;美容;瘦身;健脾开胃;护肝;老年人;运动员;骨质疏松;辣;蒸;简单;抗疲劳;鲜;香;孕妇;消化不良;开胃;减肥;柠檬味;补水;补钙;促消化;祛斑;产妇;1-2人;生津止渴;肥胖;养肝护肝;补肝;蒸锅;中等难度;鲈;保湿;增高;晕车",
 "imtro": "菜谱来自电视节目：中华美食频道的《千味坊》 JIMMY老师教的菜，都是一些简单又美味的家常菜，这几天每天中午12点都会收看他的节目。 JIMMY老师教大家怎么看鱼是否新鲜,如果蒸出来后鱼的眼珠是鼓出来的就是新鲜 的.相反眼珠藏在里面就代表不新鲜了.",
 "ingredients": "鲈鱼,1个;柠檬,2个;红椒,6个",
 "burden": "大蒜头,适量;香菜,适量;盐,适量;生姜,适量",
 "albums": ["http:\/\/img.juhe.cn\/cookbook\/t\/1\/909_135871.jpg"],
 "steps": [{
 "img": "http:\/\/img.juhe.cn\/cookbook\/s\/10\/909_70d5525103c69d8a.jpg",
 "step": "1.鲈鱼一条，开肚洗净"
 },
 {
 "img": "http:\/\/img.juhe.cn\/cookbook\/s\/10\/909_3f4a6e5a5ae225ca.jpg",
 "step": "2.柠檬2-3个，生姜一小块，大蒜头，香菜，辣辣的红椒六个"
 },
 {
 "img": "http:\/\/img.juhe.cn\/cookbook\/s\/10\/909_c8fe915ee6ff3a4c.jpg",
 "step": "3.把鱼切块，用少量盐，料酒腌一下。"
 },
 {
 "img": "http:\/\/img.juhe.cn\/cookbook\/s\/10\/909_79faf1f277616c40.jpg",
 "step": "4.红椒、大蒜、生姜切碎，香菜切碎"
 },
 {
 "img": "http:\/\/img.juhe.cn\/cookbook\/s\/10\/909_79083ec44dd9406c.jpg",
 "step": "5.把柠檬汁挤出用小碗盛着，放入调味料：鱼露、精盐、鸡精、白糖（多一些白糖）沾一点尝尝，汁不要太酸也不要太甜。"
 },
 {
 "img": "http:\/\/img.juhe.cn\/cookbook\/s\/10\/909_c0b48c233c6fd724.jpg",
 "step": "6.接着把鱼码成形，倒入调好味的柠檬汁，铺上红椒、大蒜、生姜碎。"
 },
 {
 "img": "http:\/\/img.juhe.cn\/cookbook\/s\/10\/909_66c8b71544b8abde.jpg",
 "step": "7.锅内烧开水，把鱼放上去蒸（大火7分钟即可）"
 },
 {
 "img": "http:\/\/img.juhe.cn\/cookbook\/s\/10\/909_b57104f06672bf2b.jpg",
 "step": "8.蒸好后，，撒上绿色的香菜叶（记住哦！！！这道菜不用放油的哦）"
 }]
 },
 
 
 
 */

#import <Foundation/Foundation.h>

@interface HYRMenu : NSObject

@property (nonatomic,copy) NSString * MenuId;//菜的id
@property (nonatomic,copy) NSString * title;//菜名
@property (nonatomic,copy) NSString * tags;// 菜所属的标签
@property (nonatomic,copy) NSString * imtro;//详细描述
@property (nonatomic,copy) NSString * ingredients;//主材料
@property (nonatomic,copy) NSString * burden;//配料
@property (nonatomic,strong) NSArray * albums;//相片
@property (nonatomic,strong) NSMutableArray * steps;//步骤

@end
