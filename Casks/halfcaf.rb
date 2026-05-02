cask "halfcaf" do
  version "1.0.3"
  sha256 "aeb96670ca4c0d8f97e0d9bec5e9f0bf114b1074e3e5c105b3caf991b10b99fe"

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
