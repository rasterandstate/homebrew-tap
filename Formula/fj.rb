class Fj < Formula
  desc "Command-line tool for Forgejo, in the spirit of gh"
  homepage "https://rasterhub.com/rasterstate/fj"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://rasterhub.com/rasterstate/fj/releases/download/v0.3.0/fj-v0.3.0-darwin-aarch64.tar.gz"
      sha256 "3d5513ee41006fe48bd6868d5683be2980a7c1692d04dee257ada4271af6057d"
    end
    on_intel do
      url "https://rasterhub.com/rasterstate/fj/releases/download/v0.3.0/fj-v0.3.0-darwin-x86_64.tar.gz"
      sha256 "5a93d28eeb987d4b5b7c909d292526df76ca34f673ce1888f86856c9594a0606"
    end
  end

  on_linux do
    on_intel do
      url "https://rasterhub.com/rasterstate/fj/releases/download/v0.3.0/fj-v0.3.0-linux-x86_64.tar.gz"
      sha256 "e3a1e79a4c54fc8d5b4375e05f7f120d65117f683e1e659430596f13698cca8a"
    end
  end

  def install
    target = if OS.mac?
      Hardware::CPU.arm? ? "darwin-aarch64" : "darwin-x86_64"
    else
      "linux-x86_64"
    end
    cd "fj-#{version}-#{target}"
    bin.install "fj"
    pkgshare.install "README.md", "LICENSE", "CHANGELOG.md"
  end

  test do
    assert_match "fj #{version}", shell_output("#{bin}/fj --version")
    assert_match "Command-line tool for Forgejo", shell_output("#{bin}/fj --help")
  end
end
