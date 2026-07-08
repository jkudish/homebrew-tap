class Librarium < Formula
  desc "Fan out research queries to multiple search and deep-research APIs in parallel"
  homepage "https://github.com/jkudish/librarium"
  version "1.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkudish/librarium/releases/download/v1.2.0/librarium-macos-arm64"
      sha256 "aa6bbe2aaecd65d88936e11c7ed0d6d29dc15559ddcc3fba7150c601198ad987"
    else
      url "https://github.com/jkudish/librarium/releases/download/v1.2.0/librarium-macos-x64"
      sha256 "91407b4764f3171dcfb392e5a5963913dcef5cce68e7498a4f16d125a71d6672"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jkudish/librarium/releases/download/v1.2.0/librarium-linux-arm64"
      sha256 "d2c9b3b294043c26860cf9b6d9f0eab6c5ea28ce78e1c896e1a27edc836a590c"
    else
      url "https://github.com/jkudish/librarium/releases/download/v1.2.0/librarium-linux-x64"
      sha256 "a351fe4b651bcbfa945fb21cf26cc9f42a296030a35db2a933f816ac7eab3a2c"
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
