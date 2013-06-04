#!/usr/bin/perl

use strict;

my $gs_out = `git status -sb 2>&1`;

my @gs_out_lines = split( /\n/, $gs_out );

if ( $gs_out_lines[0] =~ /^fatal: Not a git repository/ ) {
  print "n/a";
  exit 0;
}

my $status = 'dirty';

if ( ( $#gs_out_lines + 1 ) == 1 ) {
  # In a git repo tree and it is clean.
  $status = 'clean';
}

my ( undef, $branch ) = split( /\s+/, $gs_out_lines[ 0 ] ) ;

print "$branch $status";

