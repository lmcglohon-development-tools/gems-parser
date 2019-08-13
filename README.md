# gems-parser
Parser to check for duplicate gems in ArchivesSpace release

There are five major components of the ArchivesSpace application along with a selenium test suite, each with it's own Gemfile.
During the release build process, each corresponding Gemfile.lock file is used to place needed gems into the build/gems/gems directory that gets included in the release distribution zip file.
There should only be one version of each gem in the release because, when duplicate versions of a gem are included, there can be confusion in the application as far as which gem should be used.

This parser checks to see if there are multiple versions of the same gem in the build/gems/gems directory so that Gemfiles can be updated to pin gems to a specific version.
