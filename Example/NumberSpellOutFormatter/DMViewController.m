//
//  DMViewController.m
//  NumberSpellOutFormatter
//
//  Created by Dmitry Matyukhin on 01/29/2017.
//  Copyright (c) 2017 Dmitry Matyukhin. All rights reserved.
//

#import "DMViewController.h"

#import <NumberSpellOutFormatter/DMNumberSpellOutFormatter.h>

static NSString *cellReuseIdentifier = @"cell";

@interface DMViewController () <UITableViewDataSource, UITableViewDelegate>
{
    NSArray *testLocales;
    NSLocale *selectedLocale;
    DMNumberSpellOutFormatter *formatter;
}
    
    @property (strong, nonatomic) IBOutlet UISegmentedControl *languageSegmentedControl;
    @property (strong, nonatomic) IBOutlet UITableView *spellingOptionsTableView;
    @property (strong, nonatomic) IBOutlet UILabel *spellingLabel;
    @property (strong, nonatomic) IBOutlet UITextField *numberTextField;
@end

@implementation DMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.spellingOptionsTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellReuseIdentifier];
    self.spellingOptionsTableView.delegate = self;
    self.spellingOptionsTableView.dataSource = self;
    
    testLocales = @[@"en", @"es", @"it", @"ru"];
    
    [self.languageSegmentedControl removeAllSegments];
    
    NSLocale *currentLocale = [NSLocale currentLocale];
    for (NSString *localeId in testLocales) {
        
        NSString *languageName = [currentLocale displayNameForKey:NSLocaleLanguageCode value:localeId];
        
        [self.languageSegmentedControl insertSegmentWithTitle:languageName atIndex:self.languageSegmentedControl.numberOfSegments animated:NO];
    }
    
    self.languageSegmentedControl.selectedSegmentIndex = 0;
    [self didSelectLanguage:self.languageSegmentedControl];
}

    
- (IBAction)didSelectLanguage:(UISegmentedControl *)sender
{
    selectedLocale = [NSLocale localeWithLocaleIdentifier:testLocales[sender.selectedSegmentIndex]];
    
    formatter = [[DMNumberSpellOutFormatter alloc] initWithLocale: selectedLocale];
    [_spellingOptionsTableView reloadData];
    [self refreshSpelling];
}

- (IBAction)didChangeText:(UITextField *)sender {
    [self refreshSpelling];
}
    
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [formatter availableRuleSets].count;
}
    
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseIdentifier forIndexPath:indexPath];
    
    NSArray *rules = [formatter availableRuleSets];
    
    cell.textLabel.text = rules[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *rules = [formatter availableRuleSets];
    [formatter setRuleSet:rules[indexPath.row]];
    
    [self refreshSpelling];
}
    
- (void)refreshSpelling
{
    self.spellingLabel.text = [formatter stringFromInt:[self.numberTextField.text intValue]];
}

@end
