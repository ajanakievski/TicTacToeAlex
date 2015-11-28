//
//  ScoreBoard+CoreDataProperties.h
//  AlexTicTacToe
//
//  Created by Aleksandar Janakievski on 11/26/15.
//  Copyright © 2015 Aleksandar Janakievski. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ScoreBoard.h"

NS_ASSUME_NONNULL_BEGIN

@interface ScoreBoard (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *playerName;
@property (nullable, nonatomic, retain) NSNumber *playerScore;

@end

NS_ASSUME_NONNULL_END
