class Librarium < Formula
  desc "Fan out research queries to multiple search and deep-research APIs in parallel"
  homepage "https://github.com/jkudish/librarium"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkudish/librarium/releases/download/v0.1.0/librarium-macos-arm64"
      sha256 "41e5c72f32d9911daca1c89b6b1e9b68cd9b0ef17f177ffbd363d8860bbd533a"
    else
      url "https://github.com/jkudish/librarium/releases/download/v0.1.0/librarium-macos-x64"
      sha256 "c24ebafdef03bc7d0d8159ebcaf391f16eb377f5a9b876693ce348ce50be6c66"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jkudish/librarium/releases/download/v0.1.0/librarium-linux-arm64"
      sha256 "31134a5ae1d8140b4e5692bc02a72af9d5151597572ce7437046440aa9f1e07c"
    else
      url "https://github.com/jkudish/librarium/releases/download/v0.1.0/librarium-linux-x64"
      sha256 "097ae31059b1572fb9cecd9da4c536cbb6b74cc9a42590c247e75f76cd1675e6"
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
