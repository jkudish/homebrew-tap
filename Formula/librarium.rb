class Librarium < Formula
  desc "Fan out research queries to multiple search and deep-research APIs in parallel"
  homepage "https://github.com/jkudish/librarium"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkudish/librarium/releases/download/v1.1.0/librarium-macos-arm64"
      sha256 "08c13e1c25b70a7699ecfffe4d03a16298627d54606f629a4ca214c6fcd37042"
    else
      url "https://github.com/jkudish/librarium/releases/download/v1.1.0/librarium-macos-x64"
      sha256 "b757b91deca28778f295fddc275ee6b669ce6a9fa08b161be53775cf512c8a53"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jkudish/librarium/releases/download/v1.1.0/librarium-linux-arm64"
      sha256 "b30845edca5a692160235824d83561d478ef44b06c8b336463152d02f3b8b7c1"
    else
      url "https://github.com/jkudish/librarium/releases/download/v1.1.0/librarium-linux-x64"
      sha256 "d36467f6b22abd0e6cfe378a73dff12b0a13b49c397c2fcdf109ffeb5174f133"
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
