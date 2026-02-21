class Librarium < Formula
  desc "Fan out research queries to multiple search and deep-research APIs in parallel"
  homepage "https://github.com/jkudish/librarium"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkudish/librarium/releases/download/v0.1.0/librarium-macos-arm64"
      sha256 "3a192dc71c2ccbd32045d84935a0a8f961f4b7233f767dc87c414b912c946d83"
    else
      url "https://github.com/jkudish/librarium/releases/download/v0.1.0/librarium-macos-x64"
      sha256 "71c0e4f0d85c3a65ad36fc3162c0fcb41c543346294b3b1c1f4ce76a92978c69"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jkudish/librarium/releases/download/v0.1.0/librarium-linux-arm64"
      sha256 "239096dbbab98d1d2d1fc456a5e3e95873e7c718e2def5828de5b04b02880a4d"
    else
      url "https://github.com/jkudish/librarium/releases/download/v0.1.0/librarium-linux-x64"
      sha256 "6410552e1571652b882127309090cc0ff5f655ded0686b42096ad4aad7730408"
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
