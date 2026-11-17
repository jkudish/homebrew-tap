# candidate-sha: 214ec6b5b9cd219e0e48cab2e05457320d62a5bd
# candidate-fingerprint: sha256:8db256fd39e3b0af72a976d855d831c92340c0f2c0fb0ac84cd51ef92abc469c
class Librarium < Formula
  desc "Evidence-aware multi-provider research"
  homepage "https://librarium.si"
  version "2.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkudish/librarium/releases/download/v2.0.2/librarium-macos-arm64"
      sha256 "e613987866b0b93cce0b4283d7cc23b343eb2d549e7f478601e7e40a18d07354"
    else
      url "https://github.com/jkudish/librarium/releases/download/v2.0.2/librarium-macos-x64"
      sha256 "ace2bdc022a2cb406ee37c8c4f0e04fe73ba775c796ff40280bb539b184d6085"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jkudish/librarium/releases/download/v2.0.2/librarium-linux-arm64"
      sha256 "2eaa6e7ab83547f0f6b59c3d24f1df01bbdff2309843c11b9a93ab9623aee0d3"
    else
      url "https://github.com/jkudish/librarium/releases/download/v2.0.2/librarium-linux-x64"
      sha256 "4104268dfed425ed563b5e6ab73e7f9dba65cbf46427649736ca8b68cc91fd20"
    end
  end

  def install
    bin.install Dir["librarium-*"].first => "librarium"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/librarium --version")
  end
end
