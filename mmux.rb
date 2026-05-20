# typed: false
# frozen_string_literal: true

class Mmux < Formula
  desc "Keyboard-first TUI for Mattermost-compatible chat"
  homepage "https://github.com/iRootPro/mmux"
  version "0.1.11"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/iRootPro/mmux/releases/download/v0.1.11/mmux_v0.1.11_darwin_amd64.tar.gz"
      sha256 "93d17bd3d812073b859cff1d691f814e6b6672233206bd0a18a162025a904777"

      define_method(:install) do
        install_binary
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/iRootPro/mmux/releases/download/v0.1.11/mmux_v0.1.11_darwin_arm64.tar.gz"
      sha256 "f5d040ef2f8bae317f50af508bfb02aa947e47823da90525348b262eac97b422"

      define_method(:install) do
        install_binary
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/iRootPro/mmux/releases/download/v0.1.11/mmux_v0.1.11_linux_amd64.tar.gz"
      sha256 "168a9f51f67e9e091076367b82f3fc202c381a2a80a11780e94b948823e38e0c"

      define_method(:install) do
        install_binary
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/iRootPro/mmux/releases/download/v0.1.11/mmux_v0.1.11_linux_arm64.tar.gz"
      sha256 "af24eabb55d0760894c3b49480e0cd656a053c9a29d59b423dc3d1d6af7a69c8"

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
