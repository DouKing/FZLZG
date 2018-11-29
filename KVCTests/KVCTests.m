//
//  KVCTests.m
//  KVCTests
//
//  Created by DouKing on 2018/11/26.
//

#import <XCTest/XCTest.h>

@interface Employee: NSObject
@property (nonatomic, assign) CGFloat salay;
@end

@implementation Employee
@end


@interface KVCTests : XCTestCase

@end

@implementation KVCTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSArray<NSNumber *> *salaies = @[@(2000), @(3000), @(4000), @(1500), @(2500)];
    NSLog(@"average： %@", [salaies valueForKeyPath:@"@avg.self"]);

    NSMutableArray<Employee *> *employees = [NSMutableArray arrayWithCapacity:5];
    for (int i = 0; i < 5; i++) {
        Employee *e = [[Employee alloc] init];
        e.salay = arc4random() % 5000 + 2000;
        [employees addObject:e];
    }
    NSLog(@"average:%@", [employees valueForKeyPath:@"@avg.salay"]);
    NSLog(@"count:%@", [employees valueForKeyPath:@"@count"]);
    NSLog(@"sum:%@", [employees valueForKeyPath:@"@sum.salay"]);
    NSLog(@"max:%@", [employees valueForKeyPath:@"@max.salay"]);
    NSLog(@"min:%@", [employees valueForKeyPath:@"@min.salay"]);

    salaies = [employees valueForKeyPath:@"@unionOfObjects.salay"];
    NSLog(@"salaies: %@", salaies);
    salaies = [employees valueForKeyPath:@"@distinctUnionOfObjects.salay"];//会去重
    NSLog(@"salaies: %@", salaies);

    //@distinctUnionOfSets
    //@distinctUnionOfArrays/@unionOfArrays
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
