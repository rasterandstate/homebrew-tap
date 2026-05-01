cask "halfcaf" do
  version "1.0.1"
  sha256 "a5f5318b3263556a0ac8917586a3ed4104e157f9e3d19b1b99c389d26cd7323c"

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
