//
//  ViewController.m
//  ProjectTrax
//
//  Created by Kiran Bandla on 9/1/14.
//  Copyright (c) 2014 ITSS TS. All rights reserved.
//

#import "LoginViewController.h"
#import "TabbarViewController.h"

@interface LoginViewController ()
{
    BOOL hasLogged;
}
@end

@implementation LoginViewController
-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES];
    hasLogged =  false;
    if(hasLogged)
    {
    [self performSegueWithIdentifier:@"ProjectSegue" sender:self];
    }
    else
    {
        
    }

}
- (void)viewDidLoad
{
    [super viewDidLoad];

    // [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"menubar-ios7.png"] forBarMetrics:UIBarMetricsDefault];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"splash640x1136.png"]];
   
    

    // Uncomment to display the share and camera button
    
   
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSLog(@"%@",segue.identifier);
    if([segue.identifier isEqualToString:@"ProjectSegue"])
    {
        TabbarViewController *searchcontroller = [segue destinationViewController];
       // searchcontroller.currentSearchProjects = projectData;
    }
   }
@end
