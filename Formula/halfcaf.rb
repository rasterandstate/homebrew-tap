class Halfcaf < Formula
  desc "Headless work mode for macOS: caffeinate + dim + mute + DND"
  homepage "https://halfcaf.app"
  version "1.0.3"
  url "https://downloads.halfcaf.app/halfcaf-#{version}-arm64.tar.gz"
  sha256 "8578d6d1c1b52948cec3fba022fbf5b2629cbc8c07b2e71591060105121d5fa1"
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
