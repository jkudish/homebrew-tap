class Librarium < Formula
  desc "Fan out research queries to multiple search and deep-research APIs in parallel"
  homepage "https://github.com/jkudish/librarium"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkudish/librarium/releases/download/v0.1.1/librarium-macos-arm64"
      sha256 "5bb4b27b02507f512550f52f2b8ffdf30fd1b25aec7df46390ba1a6adcd7cf12"
    else
      url "https://github.com/jkudish/librarium/releases/download/v0.1.1/librarium-macos-x64"
      sha256 "7a438974ff89037a499a268d96f4469dd4a60252427217f3a9c2296f4369c0a6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jkudish/librarium/releases/download/v0.1.1/librarium-linux-arm64"
      sha256 "378d3701be80312590719eac786cf176ba20b6e0524efc5d5b8971dbdaff4422"
    else
      url "https://github.com/jkudish/librarium/releases/download/v0.1.1/librarium-linux-x64"
      sha256 "4dbcc0808d552cd0ea3a2c55eac2ad8bb6969eee27dec26204f346f5d5d81567"
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
