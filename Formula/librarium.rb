# candidate-sha: 13ecc0451f44a7db852c9e5b6b17fd7391fa6f06
# candidate-fingerprint: sha256:c8c1430db5d5c72fa563ad58a3aaa24ec9b22d04b57ce4fed104917bf2b78d0b
class Librarium < Formula
  desc "Evidence-aware multi-provider research"
  homepage "https://librarium.si"
  version "2.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jkudish/librarium/releases/download/v2.0.0/librarium-macos-arm64"
      sha256 "be9ab234f54476cf3a635e86a7ae5405ce3edb68607225c3e96629c4fb595fef"
    else
      url "https://github.com/jkudish/librarium/releases/download/v2.0.0/librarium-macos-x64"
      sha256 "ea663ef626a1abda252ac541813ac9695c9756ef4352fd91979ef8b56e7a9f2f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jkudish/librarium/releases/download/v2.0.0/librarium-linux-arm64"
      sha256 "4fada5a887772936c57567cd4ec06be7ee8498350c4768bce948365c40d7c9cc"
    else
      url "https://github.com/jkudish/librarium/releases/download/v2.0.0/librarium-linux-x64"
      sha256 "18b0cee6d141b6de97949b346bd3149d51c4bc0f1d784f34407ad705d27f0f55"
    end
  end

  def install
    bin.install Dir["librarium-*"].first => "librarium"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/librarium --version")
  end
end
