cask "halfcaf" do
  version "1.0.0"
  sha256 "7c552cc622f67ee1e0563c5dfdac932aa64e087d98f7dd6137589906e8fd547e"

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
