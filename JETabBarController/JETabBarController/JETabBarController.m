//
//  JETabBarController.m
//  JETabBarController
//
//  Created by 尹现伟 on 14-8-14.
//  Copyright (c) 2014年 DNE Technology Co.,Ltd. All rights reserved.
//

#import "JETabBarController.h"

#define IMG(name) [UIImage imageNamed:name]
#define SCREEN_HEIGHT [[UIScreen mainScreen]bounds].size.height
#define SCREEN_WIDTH [[UIScreen mainScreen]bounds].size.width

@interface JETabBarController ()

@end

@implementation JETabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.viewControllers = [NSArray arrayWithObjects:
                            [self viewControllerWithTitle:@"1" style:UITabBarSystemItemFavorites],
                            [self viewControllerWithTitle:@"2" style:UITabBarSystemItemRecents],
                            [self viewControllerWithTitle:nil style:UITabBarSystemItemMore],
                            [self viewControllerWithTitle:@"3" style:UITabBarSystemItemBookmarks],
                            [self viewControllerWithTitle:@"4" style:UITabBarSystemItemDownloads], nil];
   
    [self.tabBar setShadowImage:IMG(@"transparent")];
    [self.tabBar setBackgroundImage:IMG(@"tabbarbg")];

    UIButton* button = [[UIButton alloc]initWithFrame:CGRectMake(0.0, 0.0, 70, 70)];
    button.center = CGPointMake(SCREEN_WIDTH / 2, 18);
    [button addTarget:self action:@selector(add:) forControlEvents:UIControlEventTouchUpInside];
    [button setImage:IMG(@"add") forState:UIControlStateNormal];
    [self.tabBar addSubview:button];
}

- (void)add:(id)sender{
    UINavigationController *rootNav = self.viewControllers[self.selectedIndex];
    
    UIViewController *vc = [[UIViewController alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    vc.view.backgroundColor = [UIColor whiteColor];
    vc.title = rootNav.topViewController.title;

    [rootNav pushViewController:vc animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(UINavigationController*) viewControllerWithTitle:(NSString*) title style:(UITabBarSystemItem)style
{
    UIViewController* viewController = [[UIViewController alloc] init];
    viewController.tabBarItem = [[UITabBarItem alloc]initWithTabBarSystemItem:style tag:0];
    viewController.title = title;
    return [[UINavigationController alloc]initWithRootViewController:viewController];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
