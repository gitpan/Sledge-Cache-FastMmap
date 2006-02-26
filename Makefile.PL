use ExtUtils::MakeMaker;
WriteMakefile(
    'NAME'         => 'Sledge::Cache::FastMmap',
    'VERSION_FROM' => 'lib/Sledge/Cache/FastMmap.pm', # finds $VERSION
    'PREREQ_PM'    => {
        Test::More      => 0.32,
        Sledge::Cache   => 0.01,
        Cache::FastMmap => 1.09,
    },
);
