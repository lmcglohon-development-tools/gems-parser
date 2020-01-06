# gems-parser
Parser to check for duplicate gems in ArchivesSpace release

There are five major components of the ArchivesSpace application along with a selenium test suite, each with it's own Gemfile.
During the release build process, each corresponding Gemfile.lock file is used to place needed gems into the build/gems/gems directory that gets included in the release distribution zip file.
There should only be one version of each gem in the release because, when duplicate versions of a gem are included, there can be confusion in the application as far as which gem should be used.

This parser checks to see if there are multiple versions of the same gem in the gems/gems directory for releases and the build/gems/gems directory for local bootstrapped version so that Gemfiles can be updated to pin gems to a specific version.

Syntax for running the shell script is:

./gems_checker.sh /path/to/archivesspace T

Where the first parameter is the complete path including the archivesspace directory and the second parameter is a flag, T or F, that indicates if it is a release begin checked (T) or a local bootstrapped version (F)
