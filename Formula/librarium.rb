class Librarium < Formula
  desc "Fan out research queries to multiple search and deep-research APIs in parallel"
  homepage "https://github.com/jkudish/librarium"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkudish/librarium/releases/download/v0.2.0/librarium-macos-arm64"
      sha256 "0ba4684870b5733b976acbc03c53882079ab4e19925ba32ad2dc9e1977a00430"
    else
      url "https://github.com/jkudish/librarium/releases/download/v0.2.0/librarium-macos-x64"
      sha256 "837871a0feee630e9c60bca1a5e716b76f5fd08aa9323b7e0b880e08657c0803"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jkudish/librarium/releases/download/v0.2.0/librarium-linux-arm64"
      sha256 "0e3cbde5bdc06408201757d380ba99e57f54a101d3f16ca29d4be380ac0aef6f"
    else
      url "https://github.com/jkudish/librarium/releases/download/v0.2.0/librarium-linux-x64"
      sha256 "bc2df3342fe3b32f6b1da579790a9b0ef89c8786f52207cf4ba62d69415c1f7b"
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
