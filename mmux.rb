# typed: false
# frozen_string_literal: true

class Mmux < Formula
  desc "Keyboard-first TUI for Mattermost-compatible chat"
  homepage "https://github.com/iRootPro/mmux"
  version "0.1.3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/iRootPro/mmux/releases/download/v0.1.3/mmux_v0.1.3_darwin_amd64.tar.gz"
      sha256 "8217b3ce2c106497479f82433132bd8fd10406a2563fdfc2b3c2a5127047ff8e"

      define_method(:install) do
        install_binary
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/iRootPro/mmux/releases/download/v0.1.3/mmux_v0.1.3_darwin_arm64.tar.gz"
      sha256 "abbb1834adfeb9c0c72a65e6ba43526a86d02330f7fb8935567e26696bb18d20"

      define_method(:install) do
        install_binary
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/iRootPro/mmux/releases/download/v0.1.3/mmux_v0.1.3_linux_amd64.tar.gz"
      sha256 "28dd8b046c0e64fad7adeb192beb44a08b9998883023c742892e19dd53db61ee"

      define_method(:install) do
        install_binary
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/iRootPro/mmux/releases/download/v0.1.3/mmux_v0.1.3_linux_arm64.tar.gz"
      sha256 "f060a88f3bb062e780ff915eaeb3a74f62fde6fc8c6d8bc5132484b774963739"

      define_method(:install) do
        install_binary
      end
    end
  end

  def install_binary
    binary = Dir["mmux*/mmux"].first || "mmux"
    bin.install binary => "mmux"
  end

  test do
    assert_match "mmux", shell_output("#{bin}/mmux --help")
  end
end
