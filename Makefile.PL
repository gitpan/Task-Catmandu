use inc::Module::Install;

name 'Task-Catmandu';
all_from 'lib/Task/Catmandu.pm';
readme_from 'lib/Task/Catmandu.pm';
license 'perl';

feature 'repl (interactive environment)', -default => 1,
  'Catmandu::Cmd::repl', '0.01',
;
feature 'MongoDB store', -default => 1,
  'Catmandu::Store::MongoDB', '0.0301',
;
feature 'ElasticSearch store', -default => 1,
  'Catmandu::Store::ElasticSearch', '0.0202',
;
feature 'Solr store', -default => 1,
  'Catmandu::Store::Solr', '0.0201',
;
feature 'FedoraCommons store', -default => 1,
  'Catmandu::FedoraCommons', '0.24',
;
feature 'MARC importer and MARC fixes', -default => 1,
  'Catmandu::MARC', '0.0304',
;
feature 'bibliographic importers', -default => 1,
  'Catmandu::PubMed', '0.01',
  'Catmandu::ArXiv', '0.01',
  'Catmandu::PLoS', '0.01',
;
feature 'OAI importer', -default => 1,
  'Catmandu::OAI', '0.02',
;
feature 'SRU importer', -default => 1,
  'Catmandu::SRU', '0.0101',
;
feature 'Z39.50 importer', -default => 0,
  'Catmandu::Z3950', '0.03',
;
feature 'Twitter importer', -default => 0,
  'Catmandu::Importer::Twitter', '0.02',
;
feature 'LDAP importer', -default => 0,
  'Catmandu::LDAP', '0.0103',
;
feature 'Dancer integration', -default => 0,
  'Dancer::Session::Catmandu', '0.02',
  'Dancer::Plugin::Catmandu::OAI', '0.0302',
  'Dancer::Plugin::Catmandu::SRU', '0.02',
;

auto_install;
auto_set_repository;
WriteAll;
