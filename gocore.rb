# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
require_relative "lib/custom_download_strategy"

class Gocore< Formula
  desc "Official Golang implementation of the CORE protocol."
  homepage "https://coreblockchain.cc/"
  url "https://github.com/core-coin/go-core/v1.0.44-dev.tar.gz", :using => CustomGitHubPrivateRepositoryDownloadStrategy
  version "1.0.44-dev"
  sha256 "940ad88e6e42c6ef0d2bde5f4c83075e0f7a3b8ff430c458a7d681d5be3127a5"
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
