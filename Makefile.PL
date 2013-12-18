
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Keeps track of progress status",
  "AUTHOR" => "Steven Humphrey",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Dancer2-Plugin-ProgressStatus",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Dancer2::Plugin::ProgressStatus",
  "PREREQ_PM" => {
    "Dancer2" => "0.09",
    "Digest::MD5" => 0,
    "JSON" => 0,
    "Moo" => 0,
    "Path::Tiny" => "0.037"
  },
  "TEST_REQUIRES" => {
    "YAML::Any" => 0
  },
  "VERSION" => "0.014",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "Dancer2" => "0.09",
  "Digest::MD5" => 0,
  "JSON" => 0,
  "Moo" => 0,
  "Path::Tiny" => "0.037",
  "YAML::Any" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



