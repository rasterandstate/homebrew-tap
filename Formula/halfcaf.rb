class Halfcaf < Formula
  desc "Headless work mode for macOS: caffeinate + dim + mute + DND"
  homepage "https://github.com/rasterandstate/halfcaf"
  url "https://github.com/rasterandstate/halfcaf/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "REPLACE_WITH_TARBALL_SHA256_AFTER_TAGGING"
  license "MIT"
  head "https://github.com/rasterandstate/halfcaf.git", branch: "main"

  depends_on macos: :sonoma
  depends_on xcode: ["15.4", :build]

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release",
           "--product", "halfcaf",
           "--arch", Hardware::CPU.arch.to_s
    bin.install ".build/release/halfcaf"
  end

  test do
    assert_match "halfcaf", shell_output("#{bin}/halfcaf --version")
  end
end
