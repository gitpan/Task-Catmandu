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
feature 'CouchDB store', -default => 1,
'Catmandu::Store::CouchDB', '0.01',
;
feature 'ElasticSearch store', -default => 1,
'Catmandu::Store::ElasticSearch', '0.0204',
;
feature 'Solr store', -default => 1,
'Catmandu::Store::Solr', '0.0203',
;
feature 'DBI store', -default => 1,
'Catmandu::Store::DBI', '0.02',
;
feature 'FedoraCommons store', -default => 0,
'Catmandu::FedoraCommons', '0.27',
;
feature 'MARC importer, exporter and fixes', -default => 1,
'Catmandu::MARC', '0.104',
;
feature 'bibliographic importers', -default => 1,
'Catmandu::PubMed', '0.01',
'Catmandu::ArXiv', '0.01',
'Catmandu::PLoS', '0.01',
'Catmandu::Inspire', '0',
;
feature 'Atom importer and exporter', -default => 1,
'Catmandu::Atom', '0.02',
;
feature 'OAI importer', -default => 1,
'Catmandu::OAI', '0.02',
;
feature 'SRU importer', -default => 1,
'Catmandu::SRU', '0.0101',
;
feature 'Z39.50 importer', -default => 0,
'Catmandu::Z3950', '0.04',
;
feature 'Twitter importer', -default => 1,
'Catmandu::Importer::Twitter', '0.03',
;
feature 'LDAP importer', -default => 1,
'Catmandu::LDAP', '0.0103',
;
feature 'BibTeX exporter', -default => 1,
'Catmandu::BibTeX', '0.03',
;
feature 'XLS exporter', -default => 1,
'Catmandu::XLS', '0.03',
;
feature 'Dancer integration', -default => 0,
'Dancer::Session::Catmandu', '0.02',
'Dancer::Plugin::Catmandu::OAI', '0.0302',
'Dancer::Plugin::Catmandu::SRU', '0.02',
;

auto_install;
auto_set_repository;
WriteAll;

