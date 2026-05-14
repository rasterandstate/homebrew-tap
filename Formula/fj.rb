class Fj < Formula
  desc "Command-line tool for Forgejo, in the spirit of gh"
  homepage "https://rasterhub.com/rasterstate/fj"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://rasterhub.com/rasterstate/fj/releases/download/v#{version}/fj-v#{version}-darwin-aarch64.tar.gz"
      sha256 "ac71a225caeb5ce191784f4002ecfc15547d3f2028d18dfc13e4e6f319de198b"
    end
    on_intel do
      url "https://rasterhub.com/rasterstate/fj/releases/download/v#{version}/fj-v#{version}-darwin-x86_64.tar.gz"
      sha256 "23c0589932ce00afff5f2e4c71e1f7ca9ca4f4913e24be4974a00991e4db78ae"
    end
  end

  on_linux do
    on_intel do
      url "https://rasterhub.com/rasterstate/fj/releases/download/v#{version}/fj-v#{version}-linux-x86_64.tar.gz"
      sha256 "08de71f46f2c27c8a87970cf6d6e31125370518edc93e5a905bfa1dc5378bd90"
    end
  end

  def install
    # The tarball contains a single top-level directory
    # `fj-v<version>-<target>/{fj,README.md,LICENSE,CHANGELOG.md}`. Homebrew
    # auto-cds into that directory before running `install`, so we can just
    # install relative to cwd.
    bin.install "fj"
    pkgshare.install "README.md", "LICENSE", "CHANGELOG.md"
  end

  test do
    assert_match "fj #{version}", shell_output("#{bin}/fj --version")
    assert_match "Command-line tool for Forgejo", shell_output("#{bin}/fj --help")
  end
end
