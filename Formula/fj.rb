class Fj < Formula
  desc "Command-line tool for Forgejo, in the spirit of gh"
  homepage "https://rasterhub.com/rasterstate/fj"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://rasterhub.com/rasterstate/fj/releases/download/v#{version}/fj-v#{version}-darwin-aarch64.tar.gz"
      sha256 "ab6468067f2dee3d5f84d2094499969a6eb029e47b7c65a1a190b697e1642932"
    end
    on_intel do
      url "https://rasterhub.com/rasterstate/fj/releases/download/v#{version}/fj-v#{version}-darwin-x86_64.tar.gz"
      sha256 "ff8b5655876ea81baf0fa2c1fd35f9c88247d527c91a5fce8f49542ff8d3a9da"
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
