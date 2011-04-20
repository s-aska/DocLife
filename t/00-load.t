#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'Plack::App::Document' ) || print "Bail out!\n";
}

diag( "Testing Plack::App::Document $Plack::App::Document::VERSION, Perl $], $^X" );
