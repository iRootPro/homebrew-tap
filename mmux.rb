# typed: false
# frozen_string_literal: true

class Mmux < Formula
  desc "Keyboard-first TUI for Mattermost-compatible chat"
  homepage "https://github.com/iRootPro/mmux"
  version "0.1.4"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/iRootPro/mmux/releases/download/v0.1.4/mmux_v0.1.4_darwin_amd64.tar.gz"
      sha256 "dad4a30f39ed0b6a3e2aeec7ba8cddd6265d19a0a8227826f407013506382534"

      define_method(:install) do
        install_binary
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/iRootPro/mmux/releases/download/v0.1.4/mmux_v0.1.4_darwin_arm64.tar.gz"
      sha256 "efafd75cf91608f70d803ed507b865d0d02b3de0fc7436692fef82fd19a86711"

      define_method(:install) do
        install_binary
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/iRootPro/mmux/releases/download/v0.1.4/mmux_v0.1.4_linux_amd64.tar.gz"
      sha256 "c5be8acbafae42ec0ee6d95d9090c6e59315fe0a6ecf5f196c0c28f2e9ccf96a"

      define_method(:install) do
        install_binary
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/iRootPro/mmux/releases/download/v0.1.4/mmux_v0.1.4_linux_arm64.tar.gz"
      sha256 "0d8674dfffcc4416806ac23c5f0a2bdd5db4d79e944671f93f3401bf728b391b"

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
