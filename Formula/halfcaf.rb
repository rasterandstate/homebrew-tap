class Halfcaf < Formula
  desc "Headless work mode for macOS: caffeinate + dim + mute + DND"
  homepage "https://halfcaf.app"
  version "1.0.1"
  url "https://downloads.halfcaf.app/halfcaf-#{version}-arm64.tar.gz"
  sha256 "c02d4e5afe167bb9b3cbd4638c227d897801d39a357be5dc3657ed84cc3c20b0"
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
