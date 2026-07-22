class Librarium < Formula
  desc "Fan out research queries to multiple search and deep-research APIs in parallel"
  homepage "https://github.com/jkudish/librarium"
  version "1.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkudish/librarium/releases/download/v1.4.0/librarium-macos-arm64"
      sha256 "6ba9bda4d24edf19ca3055e6ba2a443cf4e81837531afa0c9f0b12bd58f80bf4"
    else
      url "https://github.com/jkudish/librarium/releases/download/v1.4.0/librarium-macos-x64"
      sha256 "39e7cde41ad3577501dace496f4c18ca057ed10d095d01653594e275a8377299"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jkudish/librarium/releases/download/v1.4.0/librarium-linux-arm64"
      sha256 "966b745faca0b38bc67a4a9ab2c385acdddd5acfd7bacc8bb27701d15f8cf756"
    else
      url "https://github.com/jkudish/librarium/releases/download/v1.4.0/librarium-linux-x64"
      sha256 "df377ea235729359613674064c5e5d5918e544aed3e7aee9e174bc7087ac7a7a"
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
