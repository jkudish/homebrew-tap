class Librarium < Formula
  desc "Fan out research queries to multiple search and deep-research APIs in parallel"
  homepage "https://github.com/jkudish/librarium"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkudish/librarium/releases/download/v0.1.3/librarium-macos-arm64"
      sha256 "9d4a820bee0eebb825d52a718e0c67697bdeb57bc22adbc8fb76dda3b6658cb9"
    else
      url "https://github.com/jkudish/librarium/releases/download/v0.1.3/librarium-macos-x64"
      sha256 "1b3d8ecf677c5f7cfa8640c7a95ef3eac3a3488a5c7332aa82afc2a5560cea18"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jkudish/librarium/releases/download/v0.1.3/librarium-linux-arm64"
      sha256 "0c8eab47dc02953a24db3b9103afa08f3ad4ebfdc673b4a915686ff781590ec3"
    else
      url "https://github.com/jkudish/librarium/releases/download/v0.1.3/librarium-linux-x64"
      sha256 "845193407312d600a1912044cc0e21c8be158b566880a57d4f9889fcd07b1455"
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
