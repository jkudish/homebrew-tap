class Librarium < Formula
  desc "Fan out research queries to multiple search and deep-research APIs in parallel"
  homepage "https://github.com/jkudish/librarium"
  version "1.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkudish/librarium/releases/download/v1.4.1/librarium-macos-arm64"
      sha256 "c73661bba73383ac4a8de18feedf4c235f5dd3b58697742798788b6409298d74"
    else
      url "https://github.com/jkudish/librarium/releases/download/v1.4.1/librarium-macos-x64"
      sha256 "2d3dfd9fb64ac37188fcdda7623a42f96221a89e671eb8ff3e85e87685d075ea"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jkudish/librarium/releases/download/v1.4.1/librarium-linux-arm64"
      sha256 "07a5eda08c2d90b7a04ce325894efbdcc7ca2e98824bd720b4258a787ad6b5ca"
    else
      url "https://github.com/jkudish/librarium/releases/download/v1.4.1/librarium-linux-x64"
      sha256 "71f16500c435cfdd94ad04ab3d52f313d248f5c74f601d7f3361a65be0bb7f57"
    end
  end

  def install
    binary_name = "librarium"
    bin.install Dir["librarium-*"].first => binary_name
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/librarium --version")
  end
end
