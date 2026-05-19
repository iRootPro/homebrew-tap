# typed: false
# frozen_string_literal: true

class Mmux < Formula
  desc "Keyboard-first TUI for Mattermost-compatible chat"
  homepage "https://github.com/iRootPro/mmux"
  version "0.1.5"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/iRootPro/mmux/releases/download/v0.1.5/mmux_v0.1.5_darwin_amd64.tar.gz"
      sha256 "c8e6eec6c686bbe97e22b7cba322ed46ebd8bd042097c4b726131d237530005c"

      define_method(:install) do
        install_binary
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/iRootPro/mmux/releases/download/v0.1.5/mmux_v0.1.5_darwin_arm64.tar.gz"
      sha256 "bf6c2ae2a0202417d7b1e41b2bdbc06b01b3e533c596395248b2d38b0ff927da"

      define_method(:install) do
        install_binary
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/iRootPro/mmux/releases/download/v0.1.5/mmux_v0.1.5_linux_amd64.tar.gz"
      sha256 "0a1672b0566666a7047a18698323ced1dbc70165880db906aaeabd0b4daee163"

      define_method(:install) do
        install_binary
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/iRootPro/mmux/releases/download/v0.1.5/mmux_v0.1.5_linux_arm64.tar.gz"
      sha256 "d200bdc14ee30d7c09fe6038ffdac756e4a35879d15fd4f9f1fa754472ed6d43"

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
