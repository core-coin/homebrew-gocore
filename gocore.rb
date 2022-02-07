# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
require_relative "lib/custom_download_strategy"

class Gocore< Formula
  desc "Official Golang implementation of the CORE protocol."
  homepage "https://coreblockchain.cc/"
  url "https://github.com/core-coin/go-core/v1.0.44-dev.tar.gz", :using => CustomGitHubPrivateRepositoryDownloadStrategy
  version "1.0.44-dev"
  sha256 "bc0147190ef50b8c3207edea2f03504e844f9002420b43e2166e0d65fbf70e9a"
  license "LGPL-3.0"

  # depends_on "cmake" => :build
  depends_on "go@1.17"
  
  def install
    system "make", "all"
    bin.install Dir["build/bin/*"]
  end

  test do
    system "go", "run", "build/ci.go", "test"
  end
end
