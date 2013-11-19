#!/usr/bin/perl

# taken from Task::Plack
sub version_for {
    my $dist = shift;

    (my $module = $dist) =~ s/-/::/g;
    my $info = `cpanm --info $module ` or return;
    return ($info =~ /-([\d\.]+)\.tar\.gz/)[0];
}

my @features = (
    [ 'repl (interactive environment)', 1,
      ['Catmandu::Cmd::repl'],
    ],
    # stores
    [ 'MongoDB store', 1,
      ['Catmandu::Store::MongoDB'],
    ],
    [ 'CouchDB store', 1,
      ['Catmandu::Store::CouchDB'],
    ],
    [ 'ElasticSearch store', 1,
      ['Catmandu::Store::ElasticSearch'],
    ],
    [ 'Solr store', 1,
      ['Catmandu::Store::Solr'],
    ],
    [ 'DBI store', 1,
      ['Catmandu::Store::DBI'],
    ],
    [ 'FedoraCommons store', 1,
      ['Catmandu::FedoraCommons'],
    ],
    # importers
    [ 'MARC importer, exporter and fixes', 1,
      ['Catmandu::MARC'],
    ],
    [ 'bibliographic importers', 1,
      ['Catmandu::PubMed',
       'Catmandu::ArXiv',
       'Catmandu::PLoS',
       'Catmandu::Inspire'],
    ],
    [ 'Atom importer and exporter', 1,
      ['Catmandu::Atom'],
    ],
    [ 'OAI importer', 1,
      ['Catmandu::OAI'],
    ],
    [ 'SRU importer', 1,
      ['Catmandu::SRU'],
    ],
    [ 'Z39.50 importer', 0,
      ['Catmandu::Z3950'],
    ],
    [ 'Twitter importer', 1,
      ['Catmandu::Importer::Twitter'],
    ],
    [ 'LDAP importer', 1,
      ['Catmandu::LDAP'],
    ],
    # exporters
    [ 'BibTeX exporter', 1,
      ['Catmandu::BibTeX'],
    ],
    [ 'XLS exporter', 1,
      ['Catmandu::XLS'],
    ],
    # dancer integration
    [ 'Dancer integration', 0,
      ['Dancer::Session::Catmandu',
       'Dancer::Plugin::Catmandu::OAI',
       'Dancer::Plugin::Catmandu::SRU'],
    ],

);

print <<PERL;
use inc::Module::Install;

name 'Task-Catmandu';
all_from 'lib/Task/Catmandu.pm';
readme_from 'lib/Task/Catmandu.pm';
license 'perl';

PERL

for my $feature (@features) {
    my ($name, $default, $pkgs) = @$feature;
    print "feature '$name', -default => $default,\n";
    for my $pkg (@$pkgs) {
        my $version = version_for($pkg);
        print "'$pkg', '$version',\n";
    }
    print ";\n";
}

print <<PERL;

auto_install;
auto_set_repository;
WriteAll;

PERL

