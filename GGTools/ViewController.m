//
//  ViewController.m
//  GGTools
//
//  Created by GG on 2018/3/13.
//  Copyright © 2018年 李佳贵. All rights reserved.
//

#import "ViewController.h"

#import "GGCoreTextHeader.h"
#import "GGNetwork.h"

@interface ViewController ()

@property (nonatomic, strong)GGCoreTextView *displayView ;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    GGCoreTextView *displayView = [GGCoreTextView new];
    [self.view addSubview:displayView];
    
    self.displayView = displayView;
    
    displayView.frame = self.view.bounds;
    displayView.backgroundColor = [UIColor yellowColor];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
    NSString *string = @"    古林市西南角，有一座山，是长白山山脉的延伸，名叫通天山脉，通天山脉有一个独角山，名叫一指山。山不算高，却能远远的遥望天池，可惜看不到水。山上有一个庙，名叫一指庙！庙只有前后两进，前面是庙，后面是禅房，也是和尚们起居的地方……咳咳，准确来说，是小沙弥方正居住的地方，因为整个寺院只有他一个人了。"
    @"古林市西南角，有一座山，是长白山山脉的延伸，名叫通天山脉，通天山脉有一个独角山，名叫一指山。山不算高，却能远远的遥望天池，可惜看不到水。山上有一个庙，名叫一指庙！庙只有前后两进，前面是庙，后面是禅房，也是和尚们起居的地方……咳咳，准确来说，是小沙弥方正居住的地方，因为整个寺院只有他一个人了。"
    @"古林市西南角，有一座山，是长白山山脉的延伸，名叫通天山脉，通天山脉有一个独角山，名叫一指山。山不算高，却能远远的遥望天池，可惜看不到水。山上有一个庙，名叫一指庙！庙只有前后两进，前面是庙，后面是禅房，也是和尚们起居的地方……咳咳，准确来说，是小沙弥方正居住的地方，因为整个寺院只有他一个人了。"
    @"古林市西南角，有一座山，是长白山山脉的延伸，名叫通天山脉，通天山脉有一个独角山，名叫一指山。山不算高，却能远远的遥望天池，可惜看不到水。山上有一个庙，名叫一指庙！庙只有前后两进，前面是庙，后面是禅房，也是和尚们起居的地方……咳咳，准确来说，是小沙弥方正居住的地方，因为整个寺院只有他一个人了。"
    @"古林市西南角，有一座山，是长白山山脉的延伸，名叫通天山脉，通天山脉有一个独角山，名叫一指山。山不算高，却能远远的遥望天池，可惜看不到水。山上有一个庙，名叫一指庙！庙只有前后两进，前面是庙，后面是禅房，也是和尚们起居的地方……咳咳，准确来说，是小沙弥方正居住的地方，因为整个寺院只有他一个人了。"
    @"古林市西南角，有一座山，是长白山山脉的延伸，名叫通天山脉，通天山脉有一个独角山，名叫一指山。山不算高，却能远远的遥望天池，可惜看不到水。山上有一个庙，名叫一指庙！庙只有前后两进，前面是庙，后面是禅房，也是和尚们起居的地方……咳咳，准确来说，是小沙弥方正居住的地方，因为整个寺院只有他一个人了。";
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:20],
                                 NSForegroundColorAttributeName:[UIColor redColor],
                                 //                                 NSBackgroundColorAttributeName:[UIColor blueColor],
                                 };
    NSAttributedString *attritedString = [[NSAttributedString alloc] initWithString:string attributes:attributes];
    
    
    
    CGSize drawSize = CGSizeMake(self.displayView.bounds.size.width * 1.0, self.displayView.bounds.size.height);
    
    GGCoreTextData *date = [GGCoreTextTypeSetting parseAttributedString:attritedString viewSize:drawSize viewEdgeInsets:UIEdgeInsetsMake(20, 10, 22, 0)];
    date.textAlignment = GGTextAlignmentTop;
    
    
//    drawSize = CGSizeMake(self.displayView.bounds.size.width, self.displayView.bounds.size.height);
    
    
    
//    NSArray *array = [GGTextPagingTool coreTextPaging:attritedString maxPageSize:CGSizeMake(drawSize.width - 40, drawSize.height - 40)];
//    attritedString = array.firstObject;
//    date = [GGTypeSetting parseAttributedContent:attritedString drawSize:drawSize edgeInsets:UIEdgeInsetsMake(20, 20, 20, 20)];
//
    
    self.displayView.coreTextData = date;
    
    
    
    
}




@end
