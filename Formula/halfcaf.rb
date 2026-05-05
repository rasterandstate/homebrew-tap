class Halfcaf < Formula
  desc "Headless work mode for macOS: caffeinate + dim + mute + DND"
  homepage "https://halfcaf.app"
  version "1.0.4"
  url "https://downloads.halfcaf.app/halfcaf-#{version}-arm64.tar.gz"
  sha256 "100cd8b12c2ea1c2b7a19310e0fea16cd742325d38f296165208e03d621dec23"
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
