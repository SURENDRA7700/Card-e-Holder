//
//  ViewController.h
//  CardeHolder
//
//  Created by ahex-mac on 04/01/16.
//  Copyright © 2016 AhexTechnologies. All rights reserved.


#import "ViewController.h"

@interface ViewController ()
{
    UIView *dropDown;
    AppDelegate *delegate ;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"#2E3540"];
    
    delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];

    self.modalObj = [[DataHolder alloc]init];
    
    
    Header *header = [[Header alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height/9.5)];
    header.backgroundColor = [UIColor colorWithHexString:@"#171E29"];
    header.delegate = self;
//    header.layer.shadowColor = [UIColor purpleColor].CGColor;
//    header.layer.shadowOffset = CGSizeMake(5, 5);
//    header.layer.shadowOpacity = 1;
//    header.layer.shadowRadius = 1.0;
    [self.view addSubview:header];
    
    self.pageScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(header.frame), self.view.frame.size.width, self.view.frame.size.height-CGRectGetMaxY(header.frame))];
    self.pageScroll.backgroundColor = [UIColor colorWithHexString:@"#2E3540"];
    [self.view addSubview:self.pageScroll];
    
//    UIView *titleBck = [[UIView alloc]initWithFrame:CGRectMake(50, self.pageScroll.frame.size.height/2-150, self.pageScroll.frame.size.width-100, 60)];
//    titleBck.backgroundColor = [UIColor clearColor];
//    titleBck.clipsToBounds = YES;
//    [self.pageScroll addSubview:titleBck];
    
    UIImageView *titleImage = [[UIImageView alloc]initWithFrame:CGRectMake(50, self.pageScroll.frame.size.height/6, self.pageScroll.frame.size.width-100, 90)];
    titleImage.image=[UIImage imageNamed:@"logo.png"];
    titleImage.backgroundColor = [UIColor clearColor];
    [self.pageScroll addSubview:titleImage];
    
//    UILabel *titleText = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(titleImage.frame), 0, titleBck.frame.size.width-CGRectGetMaxX(titleImage.frame), titleBck.frame.size.height)];
//    titleText.text = @"Cash-E-Holder";
//    //titleText.textAlignment = NSTextAlignmentCenter;
//    titleText.backgroundColor = [UIColor clearColor];
//    [titleBck addSubview:titleText];
    
    
    
    UIButton *addNewCard = [[UIButton alloc]initWithFrame:CGRectMake(50, self.pageScroll.frame.size.height/2, self.pageScroll.frame.size.width-100, 50)];
    addNewCard.backgroundColor = [UIColor colorWithHexString:@"#4BAAD5"];
    
    CGFloat insetAmount = 10;
    
    [addNewCard setImageEdgeInsets:UIEdgeInsetsMake(0, -insetAmount, 0, insetAmount)];
    [addNewCard setImage: [UIImage imageNamed:@"addF.png"] forState:UIControlStateNormal];
    [addNewCard setTitleEdgeInsets:UIEdgeInsetsMake(0, insetAmount, 0, -insetAmount)];
    [addNewCard setTitle:@"Add New Card" forState:UIControlStateNormal];
    addNewCard.titleLabel.font=[UIFont fontWithName:@"Helvetica-Neue" size:8.0];
    [addNewCard addTarget:self action:@selector(addNewCardClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.pageScroll addSubview:addNewCard];
    
    
    UIButton *cardSearch = [[UIButton alloc]initWithFrame:CGRectMake(50, CGRectGetMaxY(addNewCard.frame)+20, self.pageScroll.frame.size.width-100, 50)];
    cardSearch.backgroundColor = [UIColor colorWithHexString:@"#6BC46F"];
    [cardSearch addTarget:self action:@selector(cardSearchPressed:) forControlEvents:UIControlEventTouchUpInside];
    cardSearch.tag = 0;
    [cardSearch setImageEdgeInsets:UIEdgeInsetsMake(0, -insetAmount, 0, insetAmount)];
    [cardSearch setImage: [UIImage imageNamed:@"searchallCards-2.png"] forState:UIControlStateNormal];
    [cardSearch setTitleEdgeInsets:UIEdgeInsetsMake(0, insetAmount, 0, -insetAmount)];
    [cardSearch setTitle:@"View My Cards" forState:UIControlStateNormal];
    cardSearch.titleLabel.font=[UIFont fontWithName:@"Helvetica-Neue" size:8.0];
    [self.pageScroll addSubview:cardSearch];
    
    dropDown = [[UIView alloc]initWithFrame:CGRectMake(50, CGRectGetMaxY(cardSearch.frame)+20, self.pageScroll.frame.size.width-100, 200)];
    dropDown.backgroundColor = [UIColor clearColor];
    [self.pageScroll addSubview:dropDown];
    dropDown.hidden = YES;
    
    CGFloat customWidth = (self.pageScroll.frame.size.width-110)/2;
    
    NSArray *array = [[NSArray alloc]initWithObjects:@"ByName",@"ByCompany",@"ByEmail",@"ByPhone",@"ByNote",@"ByDate", nil];
    insetAmount = 3;
    int a = 0;
    for (int i = 0; i<3; i++)
    {
        for (int j = 0; j<2; j++)
        {
            UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake((j*(customWidth+10)), i*50, customWidth, 40)];
            [button setImageEdgeInsets:UIEdgeInsetsMake(0, -insetAmount, 0, insetAmount)];
            [button setTitleEdgeInsets:UIEdgeInsetsMake(0, insetAmount, 0, -insetAmount)];
            [button setContentEdgeInsets:UIEdgeInsetsMake(0, insetAmount, 0, insetAmount)];
            [button setImage: [UIImage imageNamed:@"ic_search_white.png"] forState:UIControlStateNormal];
            NSString *name = [array objectAtIndex:a];
            [button setTitle:name forState:UIControlStateNormal];
            button.tag = a;
            [button addTarget:self action:@selector(byButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
            button.backgroundColor = [UIColor colorWithHexString:@"#549A59"];

            button.titleLabel.numberOfLines = 1;
            button.titleLabel.adjustsFontSizeToFitWidth = YES;
            button.titleLabel.lineBreakMode = NSLineBreakByClipping;
            
            [dropDown addSubview:button];
            a = a+1;
        }
    }
    
    insetAmount = 10;
    UIButton *allCards = [[UIButton alloc]initWithFrame:CGRectMake(0, dropDown.frame.size.height-50, dropDown.frame.size.width, 40)];
    allCards.backgroundColor = [UIColor colorWithHexString:@"#549A59"];
    [allCards addTarget:self action:@selector(showAllCardVC) forControlEvents:UIControlEventTouchUpInside];
    [allCards setImageEdgeInsets:UIEdgeInsetsMake(0, -insetAmount, 0, insetAmount)];
    [allCards setImage: [UIImage imageNamed:@"ic_search_white.png"] forState:UIControlStateNormal];
    [allCards setTitleEdgeInsets:UIEdgeInsetsMake(0, insetAmount, 0, -insetAmount)];
    [allCards setTitle:@"All Cards" forState:UIControlStateNormal];
    [dropDown addSubview:allCards];
    
    
}

-(void)byButtonClicked:(UIButton*)sender
{
    ByTypeViewController *typeVc = [[ByTypeViewController alloc]init];;
    typeVc.byTypeDataObj = self.modalObj;
    typeVc.index = [NSString stringWithFormat:@"%ld",(long)sender.tag];
    switch (sender.tag)
    {
        case 0:
            self.modalObj.type = @"Name";
            [self presentViewController:typeVc animated:YES completion:nil];
            break;
        case 1:
            self.modalObj.type = @"Company";
            [self presentViewController:typeVc animated:YES completion:nil];
            break;
        case 2:
            self.modalObj.type = @"Email";
            [self presentViewController:typeVc animated:YES completion:nil];
            break;
        case 3:
            self.modalObj.type = @"Phone";
            [self presentViewController:typeVc animated:YES completion:nil];
            break;
        case 4:
            self.modalObj.type = @"Note";
            [self presentViewController:typeVc animated:YES completion:nil];
            break;
        case 5:
            self.modalObj.type = @"Date";
            [self presentViewController:typeVc animated:YES completion:nil];
            break;
        default:
            break;
    }
}

-(void)cardSearchPressed:(UIButton *)sender
{
    if (sender.tag == 0)
    {
        dropDown.hidden = NO;
        sender.tag = 1;
        self.pageScroll.contentSize = CGSizeMake(0, self.pageScroll.frame.size.height+150);
    }
    else
    {
        dropDown.hidden = YES;
        sender.tag = 0;
        self.pageScroll.contentSize = CGSizeMake(0, self.pageScroll.frame.size.height);
    }
}

-(void)goHome
{
    
}
-(void)goAddVc
{
    [self showAddCardVc];
    
    
    
    
    
}
-(void)goShowVc
{
    [self showAllCardVC];
}
-(void)showAllCardVC
{
    NSArray *array_user=[self getRecords];
    AllCardViewController *allCardVc = [[AllCardViewController alloc]init];
    allCardVc.datarray = array_user;
    [self presentViewController:allCardVc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addNewCardClicked
{
    
    // Eidted by susheel
    AddNewCardViewController *addVc = [[AddNewCardViewController alloc]init];
    [self presentViewController:addVc animated:YES completion:nil];
    //Ended by susheel
    
    
   //by by Anonoymous
    
//    [self showAddCardVc];
}

//Anonmoyous
-(void)showAddCardVc
{
    AddNewCardViewController *addVc = [[AddNewCardViewController alloc]init];
    [self presentViewController:addVc animated:YES completion:nil];
}
//Anonomoyous

-(NSArray*)getRecords
{
    // initializing NSFetchRequest
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    
    //Setting Entity to be Queried
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"User"
                                              inManagedObjectContext:delegate.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSError* error;
    
    // Query on managedObjectContext With Generated fetchRequest
    NSArray *fetchedRecords = [delegate.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    
    // Returning Fetched Records
    return fetchedRecords;
}

@end
