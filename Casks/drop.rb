cask "drop" do
  version "0.1.1"
  sha256 "33161bf2cd96b17e8509a09bfb7f9df3a57c920d4f39308248782f5494e04dbe"

  url "https://github.com/kirikakaese/DROP-BETA/releases/download/v#{version}/DROP-#{version}.dmg"
  name "DROP"
  name "Distribution & Release Orchestration Platform"
  desc "Publish GitHub Releases and package them for Homebrew, Scoop, GHCR and npm"
  homepage "https://github.com/kirikakaese/DROP-BETA"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :sonoma"

  app "DROP.app"

  zap trash: [
    "~/Library/Application Support/DROP",
    "~/Library/Caches/com.kirikakaese.drop",
    "~/Library/HTTPStorages/com.kirikakaese.drop",
    "~/Library/Preferences/com.kirikakaese.drop.plist",
    "~/Library/Saved Application State/com.kirikakaese.drop.savedState",
  ]

  caveats <<~EOS
    DROP is not notarized by Apple. The first time you open it, macOS blocks it:
    open System Settings → Privacy & Security and click “Open Anyway”.
    DROP updates itself afterwards; updates are verified with DROP's release key.
  EOS
end
