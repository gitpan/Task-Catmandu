use inc::Module::Install;
name 'Task-Catmandu';
all_from 'lib/Task/Catmandu.pm';
readme_from 'lib/Task/Catmandu.pm';

if ($ARGV[0] eq '--regenerate') {
    warn "regenerating versions.pl\n";
    require 'lib/Task/Catmandu.pm';
    require FileHandle;
    open my $out, ">", "versions.pl";
    Task::Catmandu->makefile_pl($out);
}

do "versions.pl";

auto_install;
auto_set_repository;
WriteAll;
