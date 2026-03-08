class Upenterep < Formula
  desc "AI penetration testing assistant for the Penterep platform"
  homepage "https://penterep.com"
  version "0.1.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/penterep/cli/releases/download/v0.1.0/penterep-0.1.0-darwin-arm64.tar.gz"
      sha256 "c8328ef4655ac19b173174ee1b338085e437d6d22399d672232c564a66ce6c4f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/penterep/cli/releases/download/v0.1.0/penterep-0.1.0-linux-x64.tar.gz"
      sha256 "afb65cfeca9674d223c9fc66460583470fb2a2729a4e27cda5e947d1ffdc1229"
    end
  end

  def install
    # Preserve directory structure for asset resolution.
    # Binary at libexec/bin/X finds assets at libexec/extensions/, etc.
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/penterep"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/penterep --version")
  end
end
