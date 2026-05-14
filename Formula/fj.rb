class Fj < Formula
  desc "Command-line tool for Forgejo, in the spirit of gh"
  homepage "https://rasterhub.com/rasterstate/fj"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://rasterhub.com/rasterstate/fj/releases/download/v#{version}/fj-v#{version}-darwin-aarch64.tar.gz"
      sha256 "f0e8f492f89e274f28f671ffd2bee86cc306435005b0bf6fd03c19aed453af53"
    end
    on_intel do
      url "https://rasterhub.com/rasterstate/fj/releases/download/v#{version}/fj-v#{version}-darwin-x86_64.tar.gz"
      sha256 "06505e7820b9e7f712bb21c55da2ceb2be26a9f35b1aa47ea7d09c99d15eb28a"
    end
  end

  # Linux binaries are produced by the Forgejo Actions release workflow;
  # add an `on_linux do … end` block here once the tarball is uploaded.

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
