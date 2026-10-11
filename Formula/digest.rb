class Digest < Formula
  desc "Terminal dashboard for your day-to-day work"
  homepage "https://github.com/achandrapaul/digest"
  url "https://github.com/achandrapaul/digest/archive/refs/tags/v0.0.154.tar.gz"
  sha256 "e69dabedaa409d904367a723c96d8515328f897e554f1e6a0074877d01b20d7d"
  license "MIT"
  head "https://github.com/achandrapaul/digest.git", branch: "main"

  depends_on "go" => :build
  depends_on :macos
  depends_on "terminal-notifier"

  def install
    ldflags = "-X github.com/achandrapaul/digest/pkg/tui.appVersion=#{version}"
    system "go", "build", *std_go_args(ldflags:), "./cmd/digest"
  end

  test do
    assert_match "install", shell_output("#{bin}/digest --help 2>&1")
  end
end
