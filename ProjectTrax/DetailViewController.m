//
//  ViewController.m
//  Screen4TestAppliaction
//
//  Created by ITSSTS MacMini on 19/08/14.
//  Copyright (c) 2014 ITSSTS MacMini. All rights reserved.
//

#import "DetailViewController.h"
#import "jsonParser.h"

@interface DetailViewController ()
{
    ProjectModel *proj;
    NSArray *highlights;
    NSArray *nextsteps;
    NSArray *issues_risks;
}
@end

@implementation DetailViewController

@synthesize currentProject;


@synthesize navigationButton;
@synthesize favoriteButton;
@synthesize ProjectTitleLabel;
@synthesize SegmentControl;
@synthesize LastUpdateLable;

@synthesize FirstView;
    @synthesize TextViewOutLet,ProjectTextView;
    @synthesize StageViewLayout,StageButton,DurationLabel,PacificLabel;
    @synthesize ProjectTypeLabel,SubCategoryLabel,SponserLabel,WaterLineLabel,PriorityLabel,ProjectManagerLabel,PlanLeaderLabel;
    @synthesize StatusView;

        @synthesize statusCell = _statusCell;


@synthesize SecondView;


@synthesize thirdView;
@synthesize FourthView;
@synthesize FifthView;


-(void) popBack {
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)start
{
    
  
    proj = currentProject;
    
    NSLog(@"--------  %@",[currentProject projName]);
    
    ProjectTitleLabel.text =  [proj projName];
    NSMutableString *Date = [[NSMutableString alloc]initWithString:@"Last Updated  :  "];
    [Date appendString:[proj updOn]];
    LastUpdateLable.text = Date ;
    
    ProjectTextView.text = proj.desc;
    [StageButton setTitle:[proj stage] forState:UIControlStateNormal];
    
    DurationLabel.text = [proj duration];
    
    NSMutableString *region = [NSMutableString new];
   
    int rgnCnt =[[proj region]count];
    for (int j=0; j<rgnCnt; j++) {
        [region appendString:[[proj region]objectAtIndex:j]];
         if(j<rgnCnt-1)
             [region appendString:@" "];
    }
    PacificLabel.text = region;
    
    
    ProjectTypeLabel.text = [proj category];
    SubCategoryLabel.text = [proj subcategory];
    
    SponserLabel.text = [proj sponser];
    WaterLineLabel.text = [proj waterLine];
    PriorityLabel.text = [proj priority];
    ProjectManagerLabel.text = [proj projMan];
    
    NSArray *plnLeader = [proj plnLeader];
    NSMutableString *plnldr = [[NSMutableString alloc]initWithString:@""];
    for (int i = 0; i<[plnLeader count]; i++)
    {
        [plnldr appendString:[plnLeader objectAtIndex:i]];
        if (i < [plnLeader count]-1)
        [plnldr appendString:@" / "];
    }
    PlanLeaderLabel.text =plnldr;
    
   
   // NSLog(@"----cost_color:  %@",[proj cost_color]);
   // NSLog(@"----cost_trend:  %@",[proj cost_trend]);
  //  NSLog(@"----scope_color:  %@",[proj scope_color]);
  //  NSLog(@"----scope_trend:  %@",[proj scope_trend]);
   // NSLog(@"----sch_color:  %@",[proj sch_color]);
  //  NSLog(@"----sch_trend:  %@",[proj sch_trend]);
  //  NSLog(@"----is_Fav:  %@",[proj isFav]);
   
    
   highlights = [proj highlights];
    
   nextsteps = [proj nextsteps];
    
    //
        issues_risks = [proj issues_risks];
 /*   NSLog(@"----issues_risks");
    for (NSDictionary *iss_risk in issues_risks) {
        
        NSLog(@"                risk:  %@",iss_risk[@"risk"]);
        NSLog(@"                riskIndicator:  %@",proj[@"riskIndicator"]);
        NSLog(@"                actions");
        NSArray *actions = iss_risk[@"actions"];
        for (int i =0; i<[actions count]; i++) {
            NSLog(@"                        %d:  %@",i+1,[actions objectAtIndex:i]);
        }
        
    }*/
    
    
    
    
    
    
    
    
    
    
    
    NSString *isFav = [proj isFav];
    //bool favoritebuttonstatus = false;
    
    if ([isFav  isEqual: @"Yes"]) {
         [favoriteButton setBackgroundImage:[UIImage imageNamed:@"favourite-blue-50x50.png"] forState:UIControlStateNormal];
    }
    else
    {
     [favoriteButton setBackgroundImage:[UIImage imageNamed:@"favourite-grey-50x50.png"] forState:UIControlStateNormal];
    }
    
    //[navigationButton addTarget:self action:@selector(popBack) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationController.navigationBarHidden =YES;
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.hidesBackButton = YES;
    
    LastUpdateLable.layer.borderWidth = 2.0f;
    LastUpdateLable.layer.borderColor =[[UIColor lightGrayColor]CGColor];
    FirstView.hidden = NO;
    FirstView.layer.borderWidth = 2.0f;
    FirstView.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    TextViewOutLet.layer.borderWidth = 2.0f;
    TextViewOutLet.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    StageViewLayout.layer.borderWidth = 2.0f;
    StageViewLayout.layer.borderColor =[[UIColor lightGrayColor]CGColor];
    StatusView.layer.borderWidth =2.0f;
    StatusView.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    
    SecondView.hidden=YES;
    thirdView.hidden=YES;
    FourthView.hidden = YES;
    FifthView.hidden = YES;   
    
   
}


-(CGFloat)TextlabelHight :(NSString *)str
{
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 250, 20)];
    lab.numberOfLines = 0;
    lab.text = str;
    [lab setFont:[UIFont systemFontOfSize:12]];
    [lab sizeToFit];
    int labelhight = lab.bounds.size.height;

    return labelhight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag ==1 ) {
        int n = 1;
        int cellheight=0;
        NSString *str = [highlights objectAtIndex:indexPath.row];//@"Stack Overflow is a question and answer site for professional and enthusiast programmers. It's 100% free, no registration required.";
        for (int i=0; i<n; i++) {
            cellheight = cellheight+[self TextlabelHight:str];
        }
        cellheight = cellheight + (n-1)*8+20;
        return cellheight;
    }
    else if (tableView.tag ==2)
    {
        int n = 1;
        int cellheight=0;
        NSString *str = [nextsteps objectAtIndex:indexPath.row];//@"Stack Overflow is a question and answer site for professional and enthusiast programmers. It's 100% free, no registration required.";
        for (int i=0; i<n; i++) {
            cellheight = cellheight+[self TextlabelHight:str];
        }
        cellheight = cellheight + (n-1)*8+20;
        return cellheight;
    }
    else if (tableView.tag ==3)
    {
        
        
        int cellheight=0;
        NSDictionary *issData =  [issues_risks objectAtIndex:indexPath.row];
        NSString *risk = issData[@"risk"];//@"Stack Overflow is a question and answer site for professional and enthusiast programmers. It's 100% free, no registration required.";
        NSArray *actions = issData[@"actions"];
        int n = [actions count];
        cellheight = cellheight+[self TextlabelHight:risk];
        cellheight = 10+20+5+cellheight +10+20;
        
        // NSString *str2 = @"Stack Overflow is a question and answer site for professional and enthusiast programmers. It's 100% free, no registration required.";
        for (int i=0; i<n; i++) {
            cellheight = cellheight+[self TextlabelHight:[actions objectAtIndex:i]];
        }
        cellheight = cellheight + (n-1)*8+20;
        return cellheight;
    }
    else
    {
        int n = 5;
        int cellhight=0;
        
        NSString *str1 = @"Stack Overflow is a question and answer site for professional and enthusiast programmers. It's 100% free, no registration required.";
        cellhight = cellhight+[self TextlabelHight:str1];
        cellhight = 10+20+5+cellhight +10+20;
        
        NSString *str2 = @"Stack Overflow is a question and answer site for professional and enthusiast programmers. It's 100% free, no registration required.";
        for (int i=1; i<n; i++) {
            cellhight = cellhight+[self TextlabelHight:str2];
        }
        cellhight = cellhight + (n-1)*8+20;
        return cellhight;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag ==1 ) {
        return [highlights count];
    }
    else if (tableView.tag ==2)
    {
        return [nextsteps count];
    }
    else if (tableView.tag ==3)
    {
        return  [issues_risks count];
    }
    else
    {
        return 6;
    }

}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    StatusCell *cell = [tableView dequeueReusableCellWithIdentifier:[StatusCell reuseIdentifier]];
    
    if (cell==nil) {
        [[NSBundle mainBundle]loadNibNamed:@"StatusCell" owner:self options:nil];
        cell = _statusCell;
    }
    
    if (tableView.tag ==1 ) {
        
        int x=50;
        int y=10;
        int width=250;
        int lenght=20;
        
        int n=1;
        
        UILabel *count =[[UILabel alloc]initWithFrame:CGRectMake(20, 10, 10, 20)];
        [count setFont:[UIFont systemFontOfSize:12]];
        int cnt = indexPath.row;
        NSString *a= [[NSString alloc]initWithFormat:@"%i",cnt];
        count.text =a;
        [cell.contentView addSubview:count];
        
        for(int i=0;i<n;i++)
        {
            
            UILabel *dash =[[UILabel alloc]initWithFrame:CGRectMake(x-12, y, 10, 20)];
            [dash setFont:[UIFont systemFontOfSize:12]];
             dash.text = @"-";
            [cell.contentView addSubview:dash];
            
            UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(x, y, width, lenght)];
            lab.numberOfLines = 0;
            lab.text =[highlights objectAtIndex:indexPath.row] ;//@"Stack Overflow is a question and answer site for professional and enthusiast programmers. It's 100% free, no registration required.";
            [lab setFont:[UIFont systemFontOfSize:12]];
            [lab sizeToFit];
            lab.backgroundColor =[UIColor clearColor];
            int labelhight = lab.bounds.size.height;
            y=y+labelhight+8;
            [cell.contentView addSubview:lab];
            
        }
        cell.contentView.layer.borderWidth = 1.0f;
        cell.contentView.layer.borderColor = [[UIColor lightGrayColor]CGColor];
        
        return cell;
    }
    else if (tableView.tag ==2)
    {
        int x=50;
        int y=10;
        int width=250;
        int lenght=20;
        
        int n=1;
        
        UILabel *count =[[UILabel alloc]initWithFrame:CGRectMake(20, 10, 10, 20)];
        [count setFont:[UIFont systemFontOfSize:12]];
        int cnt = indexPath.row;
        NSString *a= [[NSString alloc]initWithFormat:@"%i",cnt];
        count.text =a;
        [cell.contentView addSubview:count];
        
        for(int i=0;i<n;i++)
        {
            
            UILabel *dash =[[UILabel alloc]initWithFrame:CGRectMake(x-12, y, 10, 20)];
            [dash setFont:[UIFont systemFontOfSize:12]];
            dash.text = @"-";
            [cell.contentView addSubview:dash];
            
            UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(x, y, width, lenght)];
            lab.numberOfLines = 0;
            lab.text =[nextsteps objectAtIndex:indexPath.row] ;//@"Stack Overflow is a question and answer site for professional and enthusiast programmers. It's 100% free, no registration required.";
            [lab setFont:[UIFont systemFontOfSize:12]];
            [lab sizeToFit];
            lab.backgroundColor =[UIColor clearColor];
            int labelhight = lab.bounds.size.height;
            y=y+labelhight+8;
            [cell.contentView addSubview:lab];
            
        }
        cell.contentView.layer.borderWidth = 1.0f;
        cell.contentView.layer.borderColor = [[UIColor lightGrayColor]CGColor];
        return cell;

    }
    else if (tableView.tag ==3)
    {
      
        
       // int n=5;
        
        
//      **** Risk Icon  ****
        NSDictionary *issData =  [issues_risks objectAtIndex:indexPath.row];
        UIButton *count =[[UIButton alloc]initWithFrame:CGRectMake(10, 10, 20, 20)];
        
         NSString *riskIndicator = issData[@"riskIndicator"];
        if([riskIndicator isEqual:@"High"])
        {
        [count setBackgroundImage:[UIImage imageNamed:@"high-level-issue.png"] forState:UIControlStateNormal];
        }
         else
         {
          [count setBackgroundImage:[UIImage imageNamed:@"issue-medium-level-30x30"] forState:UIControlStateNormal];
         }
        [cell.contentView addSubview:count];
        
//      **** Issues Section ****
        
        UILabel *issueLabel =[[UILabel alloc]initWithFrame:CGRectMake(38, 10, 80, 20)];
        issueLabel.text = @"Issues :";
        [issueLabel setFont:[UIFont boldSystemFontOfSize:14]];
        
        [cell addSubview:issueLabel];
        
        UILabel *issueDetailLabel = [[UILabel alloc]initWithFrame:CGRectMake(38, 35, 250, 20)];
        issueDetailLabel.numberOfLines = 0;
        
        
        //NSString *risk = issData[@"risk"];//@"Stack Overflow is a question and answer site for professional and enthusiast programmers. It's 100% free, no registration required.";
        
        
        issueDetailLabel.text = issData[@"risk"];//@"Stack Overflow is a question and answer site for professional and enthusiast programmers. It's 100% free, no registration required.";
        [issueDetailLabel setFont:[UIFont systemFontOfSize:12]];
        [issueDetailLabel sizeToFit];
        issueDetailLabel.backgroundColor =[UIColor clearColor];
        
        [cell addSubview:issueDetailLabel];
        
//      **** Actions Section *****
        
        int issuselabelhight = issueDetailLabel.bounds.size.height;
        
        UILabel *ActionLabel =[[UILabel alloc]initWithFrame:CGRectMake(38,10+20+5+issuselabelhight+10, 80, 20)];
        ActionLabel.text = @"Actions :";
        [ActionLabel setFont:[UIFont boldSystemFontOfSize:14]];
        
        [cell addSubview:ActionLabel];
        
        int hightforRisklabel = 10+20+5+issuselabelhight+10+20;
        
        NSArray *actions = issData[@"actions"];
       
        int n = [actions count];
        
        for(int i=0;i<n;i++)
        {
            
            UILabel *dash =[[UILabel alloc]initWithFrame:CGRectMake(38, hightforRisklabel , 10, 20)];
            [dash setFont:[UIFont systemFontOfSize:12]];
            dash.text = @"-";
            [cell.contentView addSubview:dash];
            
            UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(50, hightforRisklabel, 250, 20)];
            lab.numberOfLines = 0;
            lab.text = [actions objectAtIndex:i];//@"Stack Overflow is a question and answer site for professional and enthusiast programmers. It's 100% free, no registration required.";
            [lab setFont:[UIFont systemFontOfSize:12]];
            [lab sizeToFit];
            lab.backgroundColor =[UIColor clearColor];
            int labelhight = lab.bounds.size.height;
            hightforRisklabel=hightforRisklabel+labelhight+8;
            [cell.contentView addSubview:lab];
            
        }
        cell.contentView.layer.borderWidth = 1.0f;
        cell.contentView.layer.borderColor = [[UIColor lightGrayColor]CGColor];
        return cell;

    }
    else
    {
        int n=5;
        
        
        //      **** Risk Icon  ****
        
        UIButton *count =[[UIButton alloc]initWithFrame:CGRectMake(10, 10, 20, 20)];
        [count setBackgroundImage:[UIImage imageNamed:@"high-level-risk-30x30.png"] forState:UIControlStateNormal];
        //[count setFont:[UIFont systemFontOfSize:12]];
       // count.text = @"^";
       // [count setFont:[UIFont boldSystemFontOfSize:20]];
        
        [cell.contentView addSubview:count];
        
        //      **** Issues Section ****
        
        UILabel *issueLabel =[[UILabel alloc]initWithFrame:CGRectMake(38, 10, 80, 20)];
        issueLabel.text = @"Risks :";
        [issueLabel setFont:[UIFont boldSystemFontOfSize:14]];
        [cell addSubview:issueLabel];
        
        UILabel *issueDetailLabel = [[UILabel alloc]initWithFrame:CGRectMake(38, 35, 250, 20)];
        issueDetailLabel.numberOfLines = 0;
        issueDetailLabel.text = @"Stack Overflow is a question and answer site for professional and enthusiast programmers. It's 100% free, no registration required.";
        [issueDetailLabel setFont:[UIFont systemFontOfSize:12]];
        [issueDetailLabel sizeToFit];
        issueDetailLabel.backgroundColor =[UIColor clearColor];
        
        [cell addSubview:issueDetailLabel];
        
        //      **** Actions Section *****
        
        int issuselabelhight = issueDetailLabel.bounds.size.height;
        
        UILabel *ActionLabel =[[UILabel alloc]initWithFrame:CGRectMake(38,10+20+5+issuselabelhight+10, 80, 20)];
        ActionLabel.text = @"Actions :";
        [ActionLabel setFont:[UIFont boldSystemFontOfSize:14]];
        
        [cell addSubview:ActionLabel];
        
        int hightforRisklabel = 10+20+5+issuselabelhight+10+20;
        
        for(int i=1;i<n;i++)
        {
            
            UILabel *dash =[[UILabel alloc]initWithFrame:CGRectMake(38, hightforRisklabel , 10, 20)];
            [dash setFont:[UIFont systemFontOfSize:12]];
            dash.text = @"-";
            [cell.contentView addSubview:dash];
            
            UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(50, hightforRisklabel, 250, 20)];
            lab.numberOfLines = 0;
            lab.text = @"Stack Overflow is a question and answer site for professional and enthusiast programmers. It's 100% free, no registration required.";
            [lab setFont:[UIFont systemFontOfSize:12]];
            [lab sizeToFit];
            lab.backgroundColor =[UIColor clearColor];
            int labelhight = lab.bounds.size.height;
            hightforRisklabel=hightforRisklabel+labelhight+8;
            [cell.contentView addSubview:lab];
            
        }
        cell.contentView.layer.borderWidth = 1.0f;
        cell.contentView.layer.borderColor = [[UIColor lightGrayColor]CGColor];
        return cell;

    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden =YES;
  //  [self start];
    

}
-(void)viewDidAppear:(BOOL)animated
{
    if(!(self.navigationController.navigationBarHidden)) //(not hidden)
    {
        self.navigationController.navigationBarHidden =YES;
    }
    else //yes(hidden)
    {
        self.navigationController.navigationBarHidden = YES	;
        
    }

   
}
-(void)viewWillAppear:(BOOL)animated
{
[self start];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}
- (IBAction)viewSelected:(id)sender {
    
    if(SegmentControl.selectedSegmentIndex==0)
    {
        FirstView.hidden = NO;
        SecondView.hidden=YES;
        thirdView.hidden=YES;
        FourthView.hidden = YES;
        FifthView.hidden = YES;
    }
    else if(SegmentControl.selectedSegmentIndex==1)
    {
        FirstView.hidden = YES;
        SecondView.hidden=NO;
        SecondView.layer.borderWidth = 2.0f;
        SecondView.layer.borderColor = [[UIColor lightGrayColor]CGColor];
        thirdView.hidden=YES;
        FourthView.hidden = YES;
        FifthView.hidden = YES;
        
    }
    else if(SegmentControl.selectedSegmentIndex==2)
    {
        FirstView.hidden = YES;
        SecondView.hidden=YES;
        thirdView.hidden=NO;
        thirdView.layer.borderWidth = 2.0f;
        thirdView.layer.borderColor = [[UIColor lightGrayColor]CGColor];
        FourthView.hidden = YES;
        FifthView.hidden = YES;
        
    }
    else if(SegmentControl.selectedSegmentIndex==3)
    {
        FirstView.hidden = YES;
        SecondView.hidden=YES;
        thirdView.hidden=YES;
        FourthView.hidden = NO;
        FourthView.layer.borderWidth = 2.0f;
        FourthView.layer.borderColor = [[UIColor lightGrayColor]CGColor];
        FifthView.hidden = YES;
    }
    else
    {
        FirstView.hidden = YES;
        SecondView.hidden=YES;
        thirdView.hidden=YES;
        FourthView.hidden = YES;
        FifthView.hidden = NO;
        FifthView.layer.borderWidth = 2.0f;
        FifthView.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    }
    
}

- (IBAction)NavigateButtonPressed:(id)sender {
     [self.navigationController popViewControllerAnimated:YES];
    self.navigationController.navigationBarHidden=YES;
}

- (IBAction)favoriteButtonPressed:(id)sender {
   
}
@end
