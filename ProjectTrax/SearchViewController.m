//
//  SearchViewController.m
//  ProjectTrax
//
//  Created by Kiran Bandla on 9/2/14.
//  Copyright (c) 2014 ITSS TS. All rights reserved.
//

#import "SearchViewController.h"
#import "ProjectCell.h"
#import "ProjectModel.h"

@interface SearchViewController ()
{
    NSMutableArray *searchResults;
    NSArray *searchCriteria;
    NSArray *searchAttributes;

    NSString *searchSelected;
    BOOL isFiltered ;
    SINavigationMenuView *menu;
}
@property (weak, nonatomic) IBOutlet UISearchBar *searchbar;
@property (strong, nonatomic) IBOutlet UITableView *searchTable;

@property (weak, nonatomic) IBOutlet UINavigationItem *navBar;

@end

@implementation SearchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void) viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO];
    
    searchCriteria =  @[@"Project Name", @"PM", @"Sponsor"];
    searchAttributes = @[@"projName",@"projMan",@"projNo"];
    // _currentSearchProjects = [[NSMutableArray alloc] init];
    searchResults =[[NSMutableArray alloc]init];
    
    
    UIButton *backButton = [[UIButton alloc] initWithFrame: CGRectMake(0, 0, 20.0f, 20.0f)];
    UIImage *backImage = [[UIImage imageNamed:@"Arrow-RED-40x40.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 12.0f, 0, 12.0f)];
    [backButton setBackgroundImage:backImage  forState:UIControlStateNormal];
    // [backButton setTitle:@"Back" forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(popBack) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = backButtonItem;
    isFiltered =false;
    if (self.navigationItem) {
        CGRect frame = CGRectMake(0.0, 0.0, 200.0, self.navigationController.navigationBar.bounds.size.height);
        menu = [[SINavigationMenuView alloc] initWithFrame:frame title:@"Search By"];
        //Set in which view we will display a menu
        [menu displayMenuInView:self.view];
        
        //Create array of items
        menu.items = searchCriteria;
        menu.delegate = self;
        [self didSelectItemAtIndex:0];
        self.navigationItem.titleView = menu;
    }
    

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
   	// Do any additional setup after loading the view, typically from a nib.
}
-(void) popBack {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didSelectItemAtIndex:(NSUInteger)index
{
    NSString *placeholdertext =  [@"Search By  " stringByAppendingString:searchCriteria[index]];
    searchSelected = searchAttributes[index];
    _searchbar.placeholder= placeholdertext;
    [menu setTitle:placeholdertext];
    NSLog(@"did selected item at index %d %@", index,placeholdertext);
    
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
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
        return [searchResults count];
    }
    else
    {
    return _currentSearchProjects.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // static NSString *cellIdentifier = @"Cell";
    ProjectCell *cell;
    
    
    NSString *cellIdentifier = @"Searchcell";

    cell = (ProjectCell*)[_searchTable dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    
    if (cell == nil) {
        cell = [[ProjectCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];

    }
    
     //  cell.delegate = self;
    
    ProjectModel *projinfo ;
    // Configure the cell...
    
    NSLog(@"%d",_currentSearchProjects.count);
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
        projinfo = [searchResults objectAtIndex:indexPath.row];

    }
    else
    {
        projinfo = [_currentSearchProjects objectAtIndex:indexPath.row];

    }
    
    
    cell.textLabel.text = projinfo.projName;
    cell.cost_past.image = [UIImage imageNamed:@"Arrow-Green-40x40.png"];

    return cell;
    
}
- (void)filterContentForSearchText:(NSString*)searchText
{
   // [searchResults removeAllObjects];
    NSString *searchQuery = [searchSelected stringByAppendingString:@" contains[c] %@"];
    NSLog(@"%@",searchQuery);
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:searchQuery, searchText];
    searchResults = [_currentSearchProjects filteredArrayUsingPredicate:resultPredicate];
    isFiltered=true;
    [self.searchDisplayController.searchResultsTableView reloadData];
}








- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self filterContentForSearchText:searchBar.text];
   
}
/*- (void)searchBarBookmarkButtonClicked:(UISearchBar *)searchBar;                   // called when bookmark button pressed

 - (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText;   // called when text changes (including clear)
 */
- (void)searchBarResultsListButtonClicked:(UISearchBar *)searchBar NS_AVAILABLE_IOS(3_2)
{
  //  [self filterContentForSearchText:searchBar.text];

}
- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar;

{
    isFiltered = false;
    [_searchTable reloadData];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self performSegueWithIdentifier:@"DetailSegue1" sender:self];
    
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
