//
//  BNRQuizViewController.m
//  Quiz
//
//  Created by Lakshmi on 1/21/18.
//  Copyright © 2018 com.arunsivakumar. All rights reserved.
//

#import "BNRQuizViewController.h"

@interface BNRQuizViewController ()

@property(nonatomic) int currentQuestionIndex;

@property(nonatomic,copy) NSArray *questions;

@property(nonatomic,copy) NSArray *answers;

@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;

@end

@implementation BNRQuizViewController


-(instancetype)initWithNibName:(NSString *)nibNameOrNil
                        bundle:(NSBundle *)nibBundleOrNil{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if(self){
        self.questions = @[@"From what is cognac made?", @"what is 7+7", @"what is the capital of CA"];
        
         self.answers = @[@"Grapes", @"14", @"sacramento"];
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)showQuestion:(UIButton *)sender {
    
    self.currentQuestionIndex++;
    
    
    if(self.currentQuestionIndex == [self.questions count]){
        self.currentQuestionIndex = 0;
    }
    
    NSString *question = self.questions[self.currentQuestionIndex];
    
    self.questionLabel.text = question;
    self.answerLabel.text = @"???";
}
- (IBAction)showAnswer:(UIButton *)sender {
    NSString *answer = self.answers[self.currentQuestionIndex];
    
    self.answerLabel.text = answer;
}


@end
