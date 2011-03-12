//
//  EXTPrototypeTest.m
//  extobjc
//
//  Created by Justin Spahr-Summers on 2011-03-12.
//  Released into the public domain.
//

#import "EXTPrototypeTest.h"

@slot(title)

@implementation EXTPrototypeTest
- (void)testSimplePrototype {
	EXTPrototype *obj = [EXTPrototype prototype];

	id method = blockMethod(id self){
		return @"test title";
	};

	obj.title = method;
	NSLog(@"method invocation: %@", ((id (^)(SEL, id))method)(@selector(title), obj));

	NSString *title = obj.title;
	STAssertEquals(title, @"test title", @"");
}
@end
