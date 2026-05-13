class Fj < Formula
  desc "Command-line tool for Forgejo, in the spirit of gh"
  homepage "https://rasterhub.com/rasterstate/fj"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://rasterhub.com/rasterstate/fj/releases/download/v#{version}/fj-v#{version}-darwin-aarch64.tar.gz"
      sha256 "eb5fd0206a5194179f6d1aecee7fe4a4a5434e1f44ed75a525f7f41d18670061"
    end
    on_intel do
      url "https://rasterhub.com/rasterstate/fj/releases/download/v#{version}/fj-v#{version}-darwin-x86_64.tar.gz"
      sha256 "d7102095f051f4af7af1d9dbf34678df85142fdfece71dcab0cc111aeb942c2c"
    end
  end

  # Linux binaries are produced by the Forgejo Actions release workflow;
  # add an `on_linux do … end` block here once the tarball is uploaded.

  def install
    target = if OS.mac?
      Hardware::CPU.arm? ? "darwin-aarch64" : "darwin-x86_64"
    else
      "linux-x86_64"
    end
    cd "fj-v#{version}-#{target}"
    bin.install "fj"
  end

  test do
    assert_match "fj #{version}", shell_output("#{bin}/fj --version")
    assert_match "Command-line tool for Forgejo", shell_output("#{bin}/fj --help")
  end
end
