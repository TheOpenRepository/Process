#!/usr/bin/perl -w

# Compile-testing for Process

use strict;
use lib ();
use File::Spec::Functions ':ALL';
BEGIN {
	$| = 1;
	unless ( $ENV{HARNESS_ACTIVE} ) {
		require FindBin;
		$FindBin::Bin = $FindBin::Bin; # Avoid a warning
		chdir catdir( $FindBin::Bin, updir() );
		lib->import(
			catdir('blib', 'lib'),
			'lib',
			);
	}
}

use lib catdir('t', 'lib');
use Test::More tests => 4;

BEGIN {
	my $testdir = catdir('t', 'lib');
	ok( -d $testdir, 'Found test modules directory' );
	lib->import( $testdir );
}





#####################################################################
# Test the base Process class

use Process;
SCOPE: {
	my $object = Process->new;
	isa_ok( $object, 'Process' );
	ok( $object->prepare, '->prepare returns true' );
	ok( $object->run,     '->run returns true'     );
}

exit(0);
