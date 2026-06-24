cask "claude-usage" do
  version "0.2.0"
  sha256 "236fc2def64d5cb311d0b10291af261b4d2c1fa997af5f81cfbf8e7b7a08cf2a"

  url "https://github.com/ogolknev/claude-usage/releases/download/v#{version}/Claude-Usage-#{version}.dmg"
  name "Claude Usage"
  desc "Menu-bar индикатор лимитов и расхода Claude для macOS"
  homepage "https://github.com/ogolknev/claude-usage"

  depends_on macos: :big_sur
  depends_on arch: :arm64

  app "Claude Usage.app"

  # Аппка подписана самоподписанным сертификатом (без нотаризации Apple) —
  # снимаем карантин, иначе Gatekeeper заблокирует запуск.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Claude Usage.app"]
  end

  zap trash: [
    "~/Library/Caches/com.local.claude-usage",
    "~/Library/LaunchAgents/com.local.claude-usage.plist",
  ]
end
