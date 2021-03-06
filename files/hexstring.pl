#!/usr/bin/perl
#
##
# Linux Malware Detect v1.4.1-wt-0
#             (C) 2013, Chris James <chris@wiredtree.com>
#             (C) 2002-2011, R-fx Networks <proj@r-fx.org>
#             (C) 2011, Ryan MacDonald <ryan@r-fx.org>
# inotifywait (C) 2007, Rohan McGovern  <rohan@mcgovern.id.au>
# This program may be freely redistributed under the terms of the GNU GPL v2
##
#

use warnings;

if ($#ARGV != 0) {
 print "usage: string\n";
 exit;
}

$instr = $ARGV[0];


$dat_hexstring="/usr/local/maldetect/sigs/hex.dat";
open(DAT, $dat_hexstring) || die("Could not open $dat_hexstring");
@raw_data=<DAT>;
close(DAT); 

foreach $hexptr (@raw_data) {
 chomp($hexptr);
 ($ptr,$name)=split(/:/,$hexptr);
 if ( grep(/$ptr/, $instr) ) {
 	print "$ptr $name \n";
	exit;
 }
}
