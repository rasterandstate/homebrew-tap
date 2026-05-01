cask "halfcaf" do
  version "0.4.0"
  sha256 "REPLACE_WITH_DMG_SHA256_AFTER_RELEASE"

  url "https://github.com/rasterandstate/halfcaf/releases/download/v#{version}/halfcaf-#{version}.dmg"
  name "halfcaf"
  desc "Headless work mode for macOS: caffeinate + dim + mute + DND"
  homepage "https://github.com/rasterandstate/halfcaf"

  depends_on macos: ">= :sonoma"

  app "HalfcafBar.app"
  binary "#{appdir}/HalfcafBar.app/Contents/MacOS/halfcaf"

  uninstall quit: "com.rasterstate.halfcaf-bar"

  zap trash: [
    "~/Library/Application Support/halfcaf",
    "~/Library/Preferences/com.rasterstate.halfcaf-bar.plist",
  ]
end
