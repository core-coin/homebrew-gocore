# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
require_relative "lib/custom_download_strategy"

class Gocore< Formula
  depends_on "go-1.16"
  depends_on "cmake"
  desc "Official Golang implementation of the CORE protocol."
  homepage "https://coreblockchain.cc/"
  url "https://github.com/core-coin/go-core/v1.0.39-dev.tar.gz", :using => CustomGitHubPrivateRepositoryDownloadStrategy
  version "1.0.39-dev"
  sha256 "940ad88e6e42c6ef0d2bde5f4c83075e0f7a3b8ff430c458a7d681d5be3127a5"
  license "LGPL-3.0"

  # depends_on "cmake" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    system "make", "all"
    bin.install Dir["build/bin/*"]
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
