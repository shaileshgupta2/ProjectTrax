//
//  ViewController.m
//  Screen4TestAppliaction
//
//  Created by ITSSTS MacMini on 19/08/14.
//  Copyright (c) 2014 ITSSTS MacMini. All rights reserved.
//

#import "DetailViewController.h"


@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize navigationButton;
@synthesize favoriteButton;
@synthesize ProjectTitleLabel;
@synthesize SegmentControl;
@synthesize LastUpdateLable;

@synthesize FirstView;
    @synthesize TextViewOutLet,ProjectTextView;
    @synthesize StageViewLayout,StageButton,DaurationLabel,PacificLabel;
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
    bool favoritebuttonstatus = false;
    
    if (favoritebuttonstatus == true) {
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
        int n = 8;
        int cellhight=0;
        NSString *str = @"Stack Overflow is a question and answer site for professional and enthusiast programmers. It's 100% free, no registration required.";
        for (int i=0; i<n; i++) {
            cellhight = cellhight+[self TextlabelHight:str];
        }
        cellhight = cellhight + (n-1)*8+20;
        return cellhight;
    }
    else if (tableView.tag ==2)
    {
        int n = 5;
        int cellhight=0;
        NSString *str = @"Stack Overflow is a question and answer site for professional and enthusiast programmers. It's 100% free, no registration required.";
        for (int i=0; i<n; i++) {
            cellhight = cellhight+[self TextlabelHight:str];
        }
        cellhight = cellhight + (n-1)*8+20;
        return cellhight;
    }
    else if (tableView.tag ==3)
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
        return 3;
    }
    else if (tableView.tag ==2)
    {
        return 5;
    }
    else if (tableView.tag ==3)
    {
        return  8;
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
        
        int n=8;
        
        UILabel *count =[[UILabel alloc]initWithFrame:CGRectMake(20, 10, 10, 20)];
        [count setFont:[UIFont systemFontOfSize:12]];
        count.text = @"1";
        [cell.contentView addSubview:count];
        
        for(int i=1;i<=n;i++)
        {
            
            UILabel *dash =[[UILabel alloc]initWithFrame:CGRectMake(x-12, y, 10, 20)];
            [dash setFont:[UIFont systemFontOfSize:12]];
            dash.text = @"-";
            [cell.contentView addSubview:dash];
            
            UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(x, y, width, lenght)];
            lab.numberOfLines = 0;
            lab.text = @"Stack Overflow is a question and answer site for professional and enthusiast programmers. It's 100% free, no registration required.";
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
        
        int n=5;
        
        UILabel *count =[[UILabel alloc]initWithFrame:CGRectMake(20, 10, 10, 20)];
        [count setFont:[UIFont systemFontOfSize:12]];
        count.text = @"1";
        [cell.contentView addSubview:count];
        
        for(int i=1;i<=n;i++)
        {
            
            UILabel *dash =[[UILabel alloc]initWithFrame:CGRectMake(x-12, y, 10, 20)];
            [dash setFont:[UIFont systemFontOfSize:12]];
            dash.text = @"-";
            [cell.contentView addSubview:dash];
            
            UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(x, y, width, lenght)];
            lab.numberOfLines = 0;
            lab.text = @"Stack Overflow is a question and answer site for professional and enthusiast programmers. It's 100% free, no registration required.";
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
      
        
        int n=5;
        
        
//      **** Risk Icon  ****
        
        UIButton *count =[[UIButton alloc]initWithFrame:CGRectMake(10, 10, 20, 20)];
        [count setBackgroundImage:[UIImage imageNamed:@"high-level-issue.png"] forState:UIControlStateNormal];
       
        [cell.contentView addSubview:count];
        
//      **** Issues Section ****
        
        UILabel *issueLabel =[[UILabel alloc]initWithFrame:CGRectMake(38, 10, 80, 20)];
        issueLabel.text = @"Issues :";
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
}

- (IBAction)favoriteButtonPressed:(id)sender {
   
}
@end
