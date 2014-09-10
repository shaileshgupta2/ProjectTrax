//
//  ViewController.h
//  Screen4TestAppliaction
//
//  Created by ITSSTS MacMini on 19/08/14.
//  Copyright (c) 2014 ITSSTS MacMini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StatusCell.h"
#import "jsonParser.h"

@interface DetailViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>


-(void)start;

- (IBAction)NavigateButtonPressed:(id)sender;
- (IBAction)favoriteButtonPressed:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *navigationButton;

@property (strong, nonatomic) IBOutlet UILabel *ProjectTitleLabel;
@property (strong, nonatomic) IBOutlet UIButton *favoriteButton;


@property (strong, nonatomic) IBOutlet UISegmentedControl *SegmentControl;
- (IBAction)viewSelected:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *LastUpdateLable;


@property (strong, nonatomic) IBOutlet UIView *FirstView;
    @property (strong, nonatomic) IBOutlet UIView *TextViewOutLet;
        @property (strong, nonatomic) IBOutlet UITextView *ProjectTextView;
    @property (strong, nonatomic) IBOutlet UIView *StageViewLayout;
        @property (strong, nonatomic) IBOutlet UIButton *StageButton;
        @property (strong, nonatomic) IBOutlet UILabel *DaurationLabel;
        @property (strong, nonatomic) IBOutlet UILabel *PacificLabel;
    @property (strong, nonatomic) IBOutlet UILabel *ProjectTypeLabel;
    @property (strong, nonatomic) IBOutlet UILabel *SubCategoryLabel;
    @property (strong, nonatomic) IBOutlet UILabel *SponserLabel;
    @property (strong, nonatomic) IBOutlet UILabel *WaterLineLabel;
    @property (strong, nonatomic) IBOutlet UILabel *PriorityLabel;
    @property (strong, nonatomic) IBOutlet UILabel *ProjectManagerLabel;
    @property (strong, nonatomic) IBOutlet UILabel *PlanLeaderLabel;
    @property (strong, nonatomic) IBOutlet UIView *StatusView;
        @property (strong, nonatomic) IBOutlet UIButton *twSbutton;
        @property (strong, nonatomic) IBOutlet UIButton *twCbutton;
        @property (strong, nonatomic) IBOutlet UIButton *twSCbutton;
        @property (strong, nonatomic) IBOutlet UIButton *twRbutton;
        @property (strong, nonatomic) IBOutlet UIButton *lwSbutton;
        @property (strong, nonatomic) IBOutlet UIButton *lwCbutton;
        @property (strong, nonatomic) IBOutlet UIButton *lwSCbutton;
        @property (strong, nonatomic) IBOutlet UIButton *lwRbutton;


 @property (assign,nonatomic) IBOutlet StatusCell *statusCell;
-(CGFloat)TextlabelHight :(NSString *)str;

@property (strong, nonatomic) IBOutlet UIView *SecondView;
    @property (strong, nonatomic) IBOutlet UITableView *HighLightView;




@property (strong, nonatomic) IBOutlet UIView *thirdView;
    @property (strong, nonatomic) IBOutlet UITableView *NextStepView;



@property (strong, nonatomic) IBOutlet UIView *FourthView;
    @property (strong, nonatomic) IBOutlet UITableView *IssuesView;




@property (strong, nonatomic) IBOutlet UIView *FifthView;
    @property (strong, nonatomic) IBOutlet UITableView *RisksView;





@end
