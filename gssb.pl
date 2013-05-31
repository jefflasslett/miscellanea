#!/usr/bin/perl

use strict;

my $gs_out = `git status -sb 2>&1`;

my @gs_out_lines = split( /\n/, $gs_out );

if ( $gs_out_lines[0] =~ /^fatal: Not a git repository/ ) {
  print 'n/a';
  exit 0;
}

my $status = 'dirty';

if ( ( $#gs_out_lines + 1 ) == 1 ) {
  # In a git repo tree and it is clean.
  $status = 'clean';
}

my ( undef, $branch ) = split( /\s+/, $gs_out_lines[ 0 ] ) ;

my %status_colour_map = ( 'clean' => "\033[1;34m" 
                        , 'dirty' => "\033[1;31m" 
                        );

print $status_colour_map{ $status }."[$branch]"."\033[m";
#print '\e[0;35m'."[$branch]".'\e[m';

