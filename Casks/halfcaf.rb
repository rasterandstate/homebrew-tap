cask "halfcaf" do
  version "1.0.2"
  sha256 "b79b183b8beb97b344496122d2d0e3c6b21c3af52faed721d40fc9865e836950"

  url "https://downloads.halfcaf.app/halfcaf-#{version}.dmg"
  name "Halfcaf"
  desc "Headless work mode for macOS: caffeinate + dim + mute + DND"
  homepage "https://halfcaf.app"

  depends_on macos: ">= :sonoma"

  app "HalfcafBar.app"
  binary "#{appdir}/HalfcafBar.app/Contents/MacOS/halfcaf"

  uninstall quit: "com.rasterstate.halfcaf-bar"

  zap trash: [
    "~/Library/Application Support/halfcaf",
    "~/Library/Preferences/com.rasterstate.halfcaf-bar.plist",
  ]
end
