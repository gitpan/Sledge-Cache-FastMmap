use strict;
use warnings;
use Test::More;

BEGIN {
    eval "use Sledge::Exceptions";
    plan $@ ? (skip_all => 'needs Sledge::Exceptions for testing') : (tests => 3);
}

BEGIN { use_ok 'Sledge::Cache::FastMmap' }

{
    package Mock::Config;
    sub new { bless {}, shift; }
    sub cache_fastmmap_opts { }
}

{
    package Mock::Page;
    sub new { bless {}, shift; }
    sub create_config { Mock::Config->new }
}

my $page = Mock::Page->new;
my $cache = Sledge::Cache::FastMmap->new($page);
$cache->param(aa => {aa => 32});
is_deeply $cache->param('aa'), {aa => 32}, 'set';
$cache->remove('aa');
is $cache->param('aa'), undef, 'removed';

