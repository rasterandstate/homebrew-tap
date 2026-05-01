class Halfcaf < Formula
  desc "Headless work mode for macOS: caffeinate + dim + mute + DND"
  homepage "https://halfcaf.app"
  version "1.0.2"
  url "https://downloads.halfcaf.app/halfcaf-#{version}-arm64.tar.gz"
  sha256 "017c38bc8f8cd9aef02447fe4e66022ef85483681350e2d23618d492403a57e6"
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
