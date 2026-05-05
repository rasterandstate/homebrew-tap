cask "halfcaf" do
  version "1.0.4"
  sha256 "8ce00041b95d7d25d46868b12c3af1e4a2b7c16550cf661566b8344c90405fa9"

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
