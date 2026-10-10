cask "drop" do
  version "0.2.0"
  sha256 "fe43851f9cc59111d4ea64087b759020d9a8fa558ca4cb10cd595a46b9e84571"

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
