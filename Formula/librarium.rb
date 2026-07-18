class Librarium < Formula
  desc "Fan out research queries to multiple search and deep-research APIs in parallel"
  homepage "https://github.com/jkudish/librarium"
  version "1.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkudish/librarium/releases/download/v1.3.0/librarium-macos-arm64"
      sha256 "ad7be9d17aca1ad01cc6528e1832ce3f320e79590bf9f28c8411f69e99a4b910"
    else
      url "https://github.com/jkudish/librarium/releases/download/v1.3.0/librarium-macos-x64"
      sha256 "a8d5cd50c945d1bab81acb6f6430740c889bab33d4398192cfbcbec39e2bb59a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jkudish/librarium/releases/download/v1.3.0/librarium-linux-arm64"
      sha256 "604bddfa90c6ec27a902cec77d1fff3fa1e25a9967e9153c95e2206aafa833b7"
    else
      url "https://github.com/jkudish/librarium/releases/download/v1.3.0/librarium-linux-x64"
      sha256 "824b4aebc5b9cbac0568c1e50d9de8fa40172f9f7973d6ee4c2df0fa1f692105"
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
