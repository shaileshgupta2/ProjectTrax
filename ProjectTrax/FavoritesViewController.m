//
//  FavoritesViewController.m
//  Trax
//
//  Created by Kiran Bandla on 8/26/14.
//  Copyright (c) 2014 ITSS TS. All rights reserved.
//


#import "FavoritesViewController.h"
#import "ProjectModel.h"
#import "ProjectCell.h"
#import "ProjectDataSource.h"
#import "ProjViewController.h"
#import "SearchViewController.h"
#import "DetailViewController.h"
@interface FavoritesViewController ()
{
 NSMutableArray *favourites;
    BOOL isSorted;

}
- (IBAction)sortByName:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *favoritesTable;
@end

@implementation FavoritesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES];
    
}
-(void) viewDidAppear:(BOOL)animated
{
    [self initialiseFavourites];

    [_favoritesTable reloadData];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    isSorted=false;

   // self.navigationController.title=@"Favourites";

    
    NSLog(@"%d",_favouriteProjects.count);

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) initialiseFavourites
{
    ProjectModel *projectinfo;
    favourites = [[NSMutableArray alloc]init];
    for(projectinfo in _favouriteProjects)
    {
        
            [favourites addObject:projectinfo.projno];
           }

}
#pragma mark
#pragma Tableviewdatasource


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _favouriteProjects.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // static NSString *cellIdentifier = @"Cell";
    ProjectCell *cell;
    
        
        NSString *cellIdentifier = @"Favcell";
    
        cell = (ProjectCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
        
        
        if (cell == nil) {
        
        }
        
        NSMutableArray *rightUtilityButtons = [NSMutableArray new];
        
        [rightUtilityButtons sw_addUtilityButtonWithColor:
         [UIColor colorWithRed:1.0f green:1.0f blue:0.35f alpha:0.7]
                                               icon:[UIImage imageNamed:@"remove-fav.png"] ];
     //   cell.rightUtilityButtons = rightUtilityButtons;
    [cell setRightUtilityButtons:rightUtilityButtons WithButtonWidth:50];

        cell.delegate = self;
        ProjectModel *projinfo ;
        // Configure the cell...
    
    NSLog(@"%d",_favouriteProjects.count);
            projinfo  = [_favouriteProjects objectAtIndex:indexPath.row];
    
        
        
    if (indexPath.row % 2) {
        UIColor* grey70 = [UIColor colorWithWhite: 0.95 alpha:1];
        
        cell.contentView.backgroundColor =grey70;
    } else {
        UIColor* white = [UIColor colorWithWhite: 1 alpha:1];
        cell.contentView.backgroundColor =white;

    }
    
        cell.nameField.text =[projinfo.projName stringByAppendingString:projinfo.isFav];
        
        
        return cell;
    
}


#pragma mark-rightutility button
- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index
{
    
   
    
             // Delete button is pressed
             NSIndexPath *cellIndexPath = [_favoritesTable indexPathForCell:cell];
             [_favouriteProjects removeObjectAtIndex:cellIndexPath.row];
   // ProjectModel *prjinfo = __favouriteProjects[cellIndexPath.row];
    
    [self passToProjectsTab:cellIndexPath.row];
             [_favoritesTable deleteRowsAtIndexPaths:@[cellIndexPath] withRowAnimation:UITableViewRowAnimationLeft];
    [_favoritesTable reloadData];
    
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self performSegueWithIdentifier:@"DetailSegue" sender:self];
    
}
-(void)passToProjectsTab:(NSInteger *)index
{
    ProjViewController *secondController = [self.tabBarController.childViewControllers objectAtIndex:0]; //second tab has index 1 (begins in 0).
    NSLog(@"%lu",index);
    NSLog(@"%@",favourites);
    NSLog(@"%d",favourites.count);


    
    //  FavoritesViewController *favcontroller = [[FavoritesViewController alloc]initWithNibName:@"FavoritesViewController" bundle:nil];
    [favourites removeObjectAtIndex:index];
   // [favourites addObject:prjNo];
    NSMutableArray *uniqueArray = [NSMutableArray array];
    
    // [favcontroller setFavPrjSource:self ];
    [uniqueArray addObjectsFromArray:[[NSSet setWithArray:favourites] allObjects]];
    
    secondController.favourites= uniqueArray;
}







- (IBAction)sortByName:(id)sender {
    
   
        NSSortDescriptor *sortDescriptor;
    if(!(isSorted))
    {
        sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"projName" ascending:YES];
        
        [sender setImage:[UIImage imageNamed:@"Z-to-A-50x50[1].png"]  forState:UIControlStateNormal];
        //  [sender setImage:[UIImage imageNamed:@"Z-to-A-50x50[1].png"] forState:UIControlStateHighlighted] ;
        isSorted=TRUE;
        //    [_sortByNameButton setWidth:10];
        //   [_sortByNameButton setBackgroundImage:[UIImage imageNamed:@"Z-to-A-50x50[1].png"] forState:UIControlStateNormal style:UIBarButtonItemStylePlain barMetrics:UIBarMetricsDefault];
        
    }
    else
    {
        sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"projName" ascending:NO];
        isSorted=FALSE;
        [sender setImage:[UIImage imageNamed:@"A-to-Z-50x50[1].png"]  forState:UIControlStateNormal];
        
        //  [_sortByNameButton setBackgroundImage:[UIImage imageNamed:@"A-to-Z-50x50[1].png"] forState:UIControlStateNormal style:UIBarButtonItemStylePlain barMetrics:UIBarMetricsDefault];
    }

        NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
       [_favouriteProjects sortUsingDescriptors:sortDescriptors];
        //[_favouriteProjects sortedArrayUsingDescriptors:sortDescriptors];
    //NSLog(@"sorted array---->%@",sortedArray);

       // _favouriteProjects = sortedArray;
        [_favoritesTable reloadData];
        
    
}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier isEqualToString:@"SearchSegue"])
    {
        SearchViewController *searchcontroller = [segue destinationViewController];
        searchcontroller.currentSearchProjects = _favouriteProjects;
    }
    if ([segue.identifier isEqualToString:@"DetailSegue"]) {
        
        DetailViewController *detailcontroller = [segue destinationViewController];
        NSIndexPath *path = [self.favoritesTable indexPathForSelectedRow];
        ProjectModel *currPr = [_favouriteProjects objectAtIndex:path.row];
        detailcontroller.currentProject =currPr ;
        
        
    }
}
@end
