class Stash < Formula
  desc "Encrypted backup for macOS dotfiles, secrets, and configs"
  homepage "https://github.com/harshpatel5940/stash"
  version "1.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/harshpatel5940/stash/releases/download/v1.0.1/stash_1.0.1_darwin_arm64.tar.gz"
      sha256 "REPLACE_WITH_ARM64_CHECKSUM"
    else
      url "https://github.com/harshpatel5940/stash/releases/download/v1.0.1/stash_1.0.1_darwin_amd64.tar.gz"
      sha256 "REPLACE_WITH_AMD64_CHECKSUM"
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
