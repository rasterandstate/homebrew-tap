class Halfcaf < Formula
  desc "Headless work mode for macOS: caffeinate + dim + mute + DND"
  homepage "https://halfcaf.app"
  version "1.0.5"
  url "https://downloads.halfcaf.app/halfcaf-#{version}-arm64.tar.gz"
  sha256 "9315280f015f3c11bdd21390ddedada2e0cd412e76fe3058b45189497cd708b5"
  license "MIT"

  depends_on macos: ">= :sonoma"
  depends_on arch: :arm64

  def install
    bin.install "halfcaf"
  end

  test do
    assert_match "halfcaf #{version}", shell_output("#{bin}/halfcaf --version")
  end
end
