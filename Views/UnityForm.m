//
//  UnityForm.m
//  marketList
//
//  Created by renanvs on 8/26/14.
//  Copyright (c) 2014 renanvs. All rights reserved.
//

#import "UnityForm.h"

@implementation UnityForm

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (IBAction)decreaseQuantityAction:(id)sender {
    int qtd = [self.quantityField.text intValue];
    if (qtd == 0) {
        return;
    }
    qtd--;
    self.quantityField.text = [NSString stringWithFormat:@"%i",qtd];
}

- (IBAction)increaseQuantityAction:(id)sender {
    int qtd = [self.quantityField.text intValue];
    qtd++;
    self.quantityField.text = [NSString stringWithFormat:@"%i",qtd];
}

@end
