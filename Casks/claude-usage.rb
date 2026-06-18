cask "claude-usage" do
  version "0.1.5"
  sha256 "e4efb15ee14a3259094a0753d193536e3aa35f12f23fe0d7ffe77414c04eface"

  url "https://github.com/ogolknev/claude-usage/releases/download/v#{version}/Claude-Usage-#{version}.dmg"
  name "Claude Usage"
  desc "Menu-bar индикатор лимитов и расхода Claude для macOS"
  homepage "https://github.com/ogolknev/claude-usage"

  depends_on macos: :big_sur
  depends_on arch: :arm64

  app "Claude Usage.app"

  # Аппка подписана ad-hoc (без нотаризации Apple) — снимаем карантин,
  # иначе Gatekeeper заблокирует запуск.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Claude Usage.app"]
  end

  zap trash: [
    "~/Library/Caches/com.local.claude-usage",
    "~/Library/LaunchAgents/com.local.claude-usage.plist",
  ]
end
