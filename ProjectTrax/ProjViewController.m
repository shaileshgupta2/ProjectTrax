//
//  ProjViewController.m
//  Trax
//
//  Created by Kiran Bandla on 8/21/14.
//  Copyright (c) 2014 ITSS TS. All rights reserved.
//

#import "ProjViewController.h"
#import "ProjectModel.h"
#import "ProjectCell.h"
#import "ProjectDataSource.h"

#import "DetailViewController.h"
#import "SearchViewController.h"
#import "FavoritesViewController.h"

#import  "QuartzCore/QuartzCore.h"
@interface ProjViewController ()
{
    BOOL isFiltered ;
    NSMutableArray *projectData;
    NSMutableArray *filteredprojectData;
    NSMutableArray *favouriteProjects1;
    BOOL isSorted;
    
    NSMutableArray *favouriteProjects;
    
}

@property (weak, nonatomic) IBOutlet UITableView *ProjectTable;
- (IBAction)sortByName:(id)sender;

@end

@implementation ProjViewController

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
    
    filteredprojectData= [[NSMutableArray alloc] init];
    favouriteProjects= [[NSMutableArray alloc] init];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    isSorted=TRUE;
    
    _favourites = [[NSMutableArray alloc] init];
   /* NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *libraryDirectory = [paths objectAtIndex:0];
    NSString *location = [libraryDirectory stringByAppendingString:@"/favourites.plist"];

  NSString   *path = [[NSBundle mainBundle] pathForResource:@"favourites" ofType:@"plist"];
    _favourites = [NSMutableArray arrayWithContentsOfFile:location];*/
    
    [self readPlist:@"favourite"];
    
  //  _favourites = [self readPlist:@"favourite"];
   
    
    ProjectDataSource *projectsource =[[ProjectDataSource alloc]init];
    projectData = [projectsource getAllProjects];
    
    
   // [self set_favouritesToProject];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    
    [self set_favouritesToProject];
    [_ProjectTable reloadData];
    
    
}


-(NSMutableArray *) get_favouritesFromProjects : (FavoritesViewController *) cntr
{
    
    
    return projectData;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    if(isFiltered)
    {
        return filteredprojectData.count;
    }
    else{
        return projectData.count;
    }
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ProjectCell *cell;
    
    NSString *cellIdentifier = @"Projcell";
    
    cell = (ProjectCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    
    if (cell == nil) {
    }
    
    NSMutableArray *rightUtilityButtons = [NSMutableArray new];
    
    [rightUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7]
                                           normalIcon:[UIImage imageNamed:@"favourite-grey-50x50.png"] selectedIcon:[UIImage imageNamed:@"add-to-fav.png"]];
    
    [cell setRightUtilityButtons:rightUtilityButtons WithButtonWidth:50];
    // cell.rightUtilityButtons = rightUtilityButtons;
    
    cell.delegate = self;
    ProjectModel *projinfo ;
    if(isFiltered)
    {
        NSLog(@"Reloding data with following data%@",filteredprojectData);
        projinfo = [filteredprojectData objectAtIndex:indexPath.row];
    }
    else
    {
        
        projinfo  = [projectData objectAtIndex:indexPath.row];
    }
    //fav
    if([[projinfo isFav] isEqualToString:@"Yes"])
    {
        [cell.is_favourite setHidden:FALSE];
        [[[cell rightUtilityButtons] objectAtIndex:0] setSelected:YES];
        
    }
    else
    {
        [cell.is_favourite setHidden:true];
        
        [[[cell rightUtilityButtons] objectAtIndex:0] setSelected:NO];
        
    }
    //color
    
    if (indexPath.row % 2) {
        UIColor* grey70 = [UIColor colorWithWhite: 0.95 alpha:1];
        
        cell.contentView.backgroundColor =grey70;
    } else {
        UIColor* white = [UIColor colorWithWhite: 1 alpha:1];
        
        cell.contentView.backgroundColor = white;
    }
    
    NSLog(@"===== %@",projinfo);
     //NSString *newString = [projinfo projName];
    cell.nameField.text = [projinfo projName];
    
    
    return cell;
    
    
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self performSegueWithIdentifier:@"DetailSegue" sender:self];
    
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSLog(@"%@",segue.identifier);
    if([segue.identifier isEqualToString:@"SearchSegue"])
    {
        SearchViewController *searchcontroller = [segue destinationViewController];
        searchcontroller.currentSearchProjects = projectData;
    }
    if ([segue.identifier isEqualToString:@"DetailSegue"]) {
        
        DetailViewController *detailcontroller = [segue destinationViewController];
        NSIndexPath *path = [self.ProjectTable indexPathForSelectedRow];
        ProjectModel *currPr = [projectData objectAtIndex:path.row];
        detailcontroller.currentProject =currPr ;
        
        
    }
}
#pragma mark-rightutility button
- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index {
    
    NSIndexPath *indexOfCell =  [_ProjectTable indexPathForCell:cell];
    
    
    switch (index) {
        case 0:
        {
            if(isFiltered)
            {
                [self set_favourites:[filteredprojectData objectAtIndex:indexOfCell.row]];
                
            }
            else
            {
                [self set_favourites:[projectData objectAtIndex:indexOfCell.row]];
            }
            // [[[cell rightUtilityButtons] objectAtIndex:0] setSelected:YES];
            if([[[cell rightUtilityButtons] objectAtIndex:0] isSelected])
            {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Favourites" message:@"Already Saved as favorites" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
                
                [alertView show];
                
            }
            else
            {UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Favourites" message:@"Added to favorites successfully" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
                
                [alertView show];
                
                
            }
            break;
            
        }
            
        default:
            break;
    }
    
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
    NSMutableArray *sortDescriptors = [NSMutableArray arrayWithObject:sortDescriptor];
    NSMutableArray *sortedArray = [[NSMutableArray alloc]initWithArray:[projectData sortedArrayUsingDescriptors:sortDescriptors]];
    //sortedArray = [projectData sortedArrayUsingDescriptors:sortDescriptors];
    projectData = sortedArray;
    
    [_ProjectTable reloadData];
    
}


#pragma mark
#pragma Favourites

-(void) set_favouritesToProject
{
    //ProjectModel *projectinfo;
    NSMutableArray *tempArrayData;
    if(isFiltered)
    {
        tempArrayData = [[NSMutableArray alloc] initWithArray:filteredprojectData];
    }
    else
    {
        tempArrayData = [[NSMutableArray alloc] initWithArray:projectData];
    }
    
    for(int i=0;i<[tempArrayData count];i++)
    {
        ProjectModel *projectinfo = [tempArrayData objectAtIndex:i];   // NSLog(@"%d----ß",i);
        NSString *str = [projectinfo projName];
        NSLog(@"%@ %d",str, i);
        
        if([_favourites containsObject:[projectinfo projName]])
        {
            if(!([favouriteProjects containsObject:projectinfo]))
            {
                projectinfo.isFav=@"Yes";
                [favouriteProjects addObject:projectinfo];
            }}
        else
        {
            projectinfo.isFav=@"No";
            
            [favouriteProjects removeObject:projectinfo];
        }
        
    }
    NSLog(@"*****");
    if(isFiltered)
    {
        filteredprojectData = tempArrayData;
    }
    else
    {
        projectData = tempArrayData;
    }
    [self passTo_favouritesTab ];
    
}

-(void) set_favourites : (ProjectModel*) projectinfo
{
    [_favourites addObject:projectinfo.projName];
    [self set_favouritesToProject];
    [_ProjectTable reloadData];
}

-(void)passTo_favouritesTab
{
    FavoritesViewController *secondController = [self.tabBarController.childViewControllers objectAtIndex:1]; //second tab has index 1 (begins in 0).
    
    
    //  FavoritesViewController *favcontroller = [[FavoritesViewController alloc]initWithNibName:@"FavoritesViewController" bundle:nil];
    NSMutableArray *uniqueArray = [NSMutableArray array];
    
    // [favcontroller setFavPrjSource:self ];
    [uniqueArray addObjectsFromArray:[[NSSet setWithArray:favouriteProjects] allObjects]];
    
    
    [self writePlist:_favourites fileName:@"favourite"];
  /* NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *libraryDirectory = [paths objectAtIndex:0];
    NSString *location = [libraryDirectory stringByAppendingString:@"/favourites.plist"];
    
  //  NSArray *check = [[NSArray alloc] initWithObjects:@"a",@"b",@"c", nil];
    [_favourites writeToFile:location atomically:YES];*/
    secondController.favouriteProjects = uniqueArray;
}

- (void)writePlist:(id)plist fileName:(NSString *)fileName {
    NSData *xmlData;
    NSString *error;
    
    NSString *localizedPath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"];
    xmlData = [NSPropertyListSerialization dataFromPropertyList:plist format:NSPropertyListXMLFormat_v1_0 errorDescription:&error];
    if (xmlData) {
        [xmlData writeToFile:localizedPath atomically:YES];
    } else {
        NSLog(@"Error writing plist to file '%s', error = '%s'", [localizedPath UTF8String], [error UTF8String]);
    }
}
- (NSMutableArray *)readPlist:(NSString *)fileName {
    NSData *plistData;
    NSString *error;
    NSPropertyListFormat format;
    id plist;
    
    NSString *localizedPath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"];
    
_favourites = [NSMutableArray arrayWithContentsOfFile:localizedPath];
  //  plistData = [NSData dataWithContentsOfFile:localizedPath];
    
  //  plist = [NSPropertyListSerialization propertyListFromData:plistData mutabilityOption:NSPropertyListImmutable format:&format errorDescription:&error];
    if (!plist) {
        NSLog(@"Error reading plist from file '%s', error = '%s'", [localizedPath UTF8String], [error UTF8String]);
    }
    
    return _favourites;
}


@end
