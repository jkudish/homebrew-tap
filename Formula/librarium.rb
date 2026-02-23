class Librarium < Formula
  desc "Fan out research queries to multiple search and deep-research APIs in parallel"
  homepage "https://github.com/jkudish/librarium"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkudish/librarium/releases/download/v0.1.2/librarium-macos-arm64"
      sha256 "394bef38d85c4f5494b389dd6542837b2576f2452fdf11cd953e16d34f2de322"
    else
      url "https://github.com/jkudish/librarium/releases/download/v0.1.2/librarium-macos-x64"
      sha256 "1fb6f11b9880470de63a0c9855404f618f799ff8cb66f6f47d51d7f5f657b22a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jkudish/librarium/releases/download/v0.1.2/librarium-linux-arm64"
      sha256 "7cbba6b03affded90aa377e2b726909841e244497d3b2bb0cbff8916593e28ed"
    else
      url "https://github.com/jkudish/librarium/releases/download/v0.1.2/librarium-linux-x64"
      sha256 "b87a41cee9fc5b361a295434c7244c06ff6f092a2e6effd31a6ece3ed92cf1b3"
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
