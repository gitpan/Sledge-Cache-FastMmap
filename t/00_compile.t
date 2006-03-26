use strict;
use warnings;
use Test::More tests => 1;

BEGIN {
    eval "use Sledge::Exceptions";
    plan $@ ? (skip_all => 'needs Sledge::Exceptions for testing') : (tests => 3);
}
BEGIN { use_ok 'Sledge::Cache::FastMmap' }
