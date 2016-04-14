//
//  AllCardViewController.m
//  CardeHolder
//
//  Created by ahex-mac on 04/01/16.
//  Copyright © 2016 AhexTechnologies. All rights reserved.




//
#import "AllCardViewController.h"
#import "AppDelegate.h"
#import "User.h"
@interface AllCardViewController ()
{

    AppDelegate *delegate ;
    UILabel *label;
    UIImageView *imagVw;
}
@end

@implementation AllCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    Header *header = [[Header alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 60)];
    header.backgroundColor = [UIColor blackColor];
    header.delegate = self;
    [self.view addSubview:header];
    
      delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    

    self.cardScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(header.frame)+20, self.view.frame.size.width-20,self.view.frame.size.height-CGRectGetMaxY(header.frame)-20)];
    [self.view addSubview:self.cardScroll];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    
    
    
    
   //   NSArray *array_user=[self getRecords];
    
    
      
    
    if (self.datarray.count > 0)
        
    {
        NSLog(@"data base data is %lu ",(unsigned long)self.datarray.count);
        [self createCard:self.datarray];
    }
    else
    {
        //We have to write Alert Here
    }

    

    
  //  NSLog(@"user dats is %@ ",user.byname);

    
    
    
}

-(void)viewDidLayoutSubviews
{


    if (self.datarray.count > 0)
        
    {
        NSLog(@"data base data is %lu ",(unsigned long)self.datarray.count);
        [self createCard:self.datarray];
    }
    else
    {
        //We have to write Alert Here
    }
    


}




-(void)createCard:(NSArray*)data;

{
    
    
    for (int k=0; k<[data count]; k++)
    {
        UIView *card = [[UIView alloc]initWithFrame:CGRectMake(0, k*(7*31+130), self.cardScroll.frame.size.width, 7*31+110)];
        card.backgroundColor = [UIColor colorWithHexString:@"#1791CC"];
        card.layer.cornerRadius=12.0;
        card.layer.masksToBounds=YES;
        
//        [card setBackgroundColor:[UIColor redColor]];
        
        [self.cardScroll addSubview:card];   
        
        User *user = data[k];
        NSLog(@"team: %@", user.byphone);
        
        
        for (int i=0; i<7; i++)
        {
            for (int j=0; j<2; j++)
            {
               imagVw = [[UIImageView alloc]initWithFrame:CGRectMake(50, 10+(i*30), 20, 20)];

                [card addSubview:imagVw];
                
             label = [[UILabel alloc]initWithFrame:CGRectMake(90, 10+(i*30), card.frame.size.width-100, 20)];
                label.textColor = [UIColor whiteColor];
                
                [card addSubview:label];
            }
            
            switch (i) {
                case 0:
                    [imagVw setImage:[UIImage imageNamed:@"user.png"]];
                    label.text=user.byname;
                    break;
                case 1:
                    [imagVw setImage:[UIImage imageNamed:@"bank-building.png"]];

                    label.text=user.bycompany;
                    break;
                case 2:
                    [imagVw setImage:[UIImage imageNamed:@"calendar-page-empty.png"]];

                    label.text=user.bydate;
                    break;
                    
                case 3:
                    [imagVw setImage:[UIImage imageNamed:@"user.png"]];

                    label.text=user.bydesignation;
                    break;
                case 4:
                    [imagVw setImage:[UIImage imageNamed:@"msg.png"]];

                    label.text=user.byemail;
                    break;
                case 5:
                    
                    [imagVw setImage:[UIImage imageNamed:@"call.png"]];

                    label.text=user.byphone;
                    break;
                case 6:
                    
                    [imagVw setImage:[UIImage imageNamed:@"book.png"]];

                    label.text=user.bynote;
                    break;


                default:
                    break;
            }
        }
        
        UIImageView *cardImage = [[UIImageView alloc]initWithFrame:CGRectMake(30, 7*31, card.frame.size.width-60, 100)];
        cardImage.backgroundColor = [UIColor purpleColor];
        cardImage.image=[UIImage imageWithData:user.userimage];
        [card addSubview:cardImage];
    }
    self.cardScroll.contentSize = CGSizeMake(0, data.count*(7*31+140));
}
/*-(NSArray*)getRecords
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
}   */



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)goHome
{
    ViewController *homeVc = [[ViewController alloc]init];
    [self presentViewController:homeVc animated:YES completion:nil];
}
-(void)goAddVc
{
    AddNewCardViewController *addVc = [[AddNewCardViewController alloc]init];
    [self presentViewController:addVc animated:YES completion:nil];
    
}
-(void)goShowVc
{
    AllCardViewController *allCardVc = [[AllCardViewController alloc]init];
    [self presentViewController:allCardVc animated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
