class Stash < Formula
  desc "Encrypted backup for macOS dotfiles, secrets, and configs"
  homepage "https://github.com/harshpatel5940/stash"
  version "1.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/harshpatel5940/stash/releases/download/v1.0.1/stash_1.0.1_darwin_arm64.tar.gz"
      sha256 "57fd2beccc976301fe4be7f6e4d099c390a25112b86c396cc6ef9331325310c2"
    else
      url "https://github.com/harshpatel5940/stash/releases/download/v1.0.1/stash_1.0.1_darwin_amd64.tar.gz"
      sha256 "bcc280a2d32fbd60a6057dbc323824444ec0a20e2a8352903c6c7757e56b67a3"
    end
  end

  def install
    bin.install "stash"

    # Install documentation
    doc.install "README.md" if File.exist?("README.md")
    doc.install "LICENSE" if File.exist?("LICENSE")
    doc.install "CONTRIBUTING.md" if File.exist?("CONTRIBUTING.md")
  end

  test do
    assert_match "stash", shell_output("#{bin}/stash --help")
  end
end
