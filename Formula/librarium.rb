class Librarium < Formula
  desc "Fan out research queries to multiple search and deep-research APIs in parallel"
  homepage "https://github.com/jkudish/librarium"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkudish/librarium/releases/download/v1.0.0/librarium-macos-arm64"
      sha256 "1da365cc6aba2a9c849a2f630617eb3d726af053a2cd2e90561330f0ffe3cb8f"
    else
      url "https://github.com/jkudish/librarium/releases/download/v1.0.0/librarium-macos-x64"
      sha256 "45c671eea5725a214101350352099977a087c801f1cf8581ae1fb3041450ec3b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jkudish/librarium/releases/download/v1.0.0/librarium-linux-arm64"
      sha256 "a439cb2e83952a1051248618e25d3be087519e2f7ed5db45ee6c930871e28f96"
    else
      url "https://github.com/jkudish/librarium/releases/download/v1.0.0/librarium-linux-x64"
      sha256 "ffa426f0196dad8563ed82e552446bcc5c400f31392955629532b10834e11e43"
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
