cask "claude-usage" do
  version "0.1.3"
  sha256 "cea295bf42135f3b42d00629b954045f03b0acb3eb8b68cb1feda257769747b3"

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
