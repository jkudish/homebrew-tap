class Librarium < Formula
  desc "Fan out research queries to multiple search and deep-research APIs in parallel"
  homepage "https://github.com/jkudish/librarium"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkudish/librarium/releases/download/v0.1.0/librarium-macos-arm64"
      sha256 "597e63931a0798076fed730f96f395643dfad5c35f7bc3af7312efb575b6ce8a"
    else
      url "https://github.com/jkudish/librarium/releases/download/v0.1.0/librarium-macos-x64"
      sha256 "4b015dd10f727fd9a8052fd734a9e284ff551b2aabc3808786cea481fa1ce99e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jkudish/librarium/releases/download/v0.1.0/librarium-linux-arm64"
      sha256 "f52b496657023d0bc82bf4dd39087f319f83b1eb18eaa16318ca2a11897adc94"
    else
      url "https://github.com/jkudish/librarium/releases/download/v0.1.0/librarium-linux-x64"
      sha256 "d84321673a249ba0d6ab11c34fc7164bb60931b0ae390d8db5d6d220bbefde33"
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
