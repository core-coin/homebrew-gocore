class Gocore< Formula
  desc "Official Golang implementation of the CORE protocol."
  homepage "https://coreblockchain.cc/"
  url "https://github.com/core-coin/go-core/archive/refs/tags/v1.1.4.tar.gz",
  version "1.1.4"
  sha256 "149c50ed8d03282bf9cddb3e146c9cfcf6dce0d709f3929d4d5adde586354e70"
  license "CORE License"

  depends_on "go@1.17"
  
  def install
    system "make", "all"
    bin.install "build/bin/gocore"
  end
end
