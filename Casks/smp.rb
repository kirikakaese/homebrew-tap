cask "smp" do
  version "0.9.3"
  sha256 "b0c6e40b4fa9f4a5aed9b871ec892f7bdca1b017151c22930fdbf7bb879b60d2"

  url "https://github.com/kirikakaese/SMP/releases/download/v#{version}/SMP-#{version}.dmg"
  name "SSH Management Platform"
  desc "Manage SSH keys, hosts, known_hosts, tunnels and agents"
  homepage "https://github.com/kirikakaese/SMP"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :sonoma"

  app "SMP.app"

  zap trash: [
    "~/Library/Application Support/com.kirikakaese.smp",
    "~/Library/Caches/com.kirikakaese.smp",
    "~/Library/HTTPStorages/com.kirikakaese.smp",
    "~/Library/Preferences/com.kirikakaese.smp.agent.plist",
    "~/Library/Preferences/com.kirikakaese.smp.plist",
    "~/Library/Preferences/com.kirikakaese.smp.shared.plist",
  ]

  caveats <<~EOS
    SMP is not notarized by Apple. The first time you open it, macOS blocks it:
    open System Settings → Privacy & Security and click “Open Anyway”.
    SMP updates itself afterwards; updates are verified with SMP's release key.
  EOS
end
