class Notif < Formula
  desc "Interact with macOS Notification Center from the command line"
  homepage "https://github.com/coryfklein/macos-notification-cli"
  url "https://github.com/coryfklein/macos-notification-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "f1840593669c09679501ecd1a038df01a651383f544f81921f7c24cca86c8220"
  license "MIT"
  head "https://github.com/coryfklein/macos-notification-cli.git", branch: "main"

  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/notif"
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/notif --version")
  end
end
