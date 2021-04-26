# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
require_relative "lib/custom_download_strategy"

class Gocore< Formula
  desc "Official Golang implementation of the CORE protocol."
  homepage "https://coreblockchain.cc/"
  url "https://github.com/core-coin/go-core/releases/download/v1.0.18-dev/v1.0.18-dev", :using => CustomGitHubPrivateRepositoryReleaseDownloadStrategy
  version "1.0.18-dev"
  sha256 "aedede9bcffe74858a8825dfaf8dfcaf8c2b39b528ad0911d51e96500ec01158"
  license "LGPL-3.0"

  # depends_on "cmake" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    system "make", "all"
    bin.install Dir["build/bin"]
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test go-ethereum`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
