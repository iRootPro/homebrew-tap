# typed: false
# frozen_string_literal: true

class Mmux < Formula
  desc "Keyboard-first Mattermost/Band TUI"
  homepage "https://github.com/iRootPro/mmux"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/iRootPro/mmux/releases/download/v0.1.0/band-tui_v0.1.0_darwin_amd64.tar.gz"
      sha256 "5f4579c43715e1f971fa119393802108aa13e380202ca2d83cd8e5649e057838"

      define_method(:install) do
        install_binary
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/iRootPro/mmux/releases/download/v0.1.0/band-tui_v0.1.0_darwin_arm64.tar.gz"
      sha256 "1e4b2832e8b56b39aab3e11b70472950267d3de34560d5ffe7cc2a6b8c108ac0"

      define_method(:install) do
        install_binary
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/iRootPro/mmux/releases/download/v0.1.0/band-tui_v0.1.0_linux_amd64.tar.gz"
      sha256 "fe089b246cac619c515e453f098bd2e1326a23482542652b842506574bf2b3e2"

      define_method(:install) do
        install_binary
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/iRootPro/mmux/releases/download/v0.1.0/band-tui_v0.1.0_linux_arm64.tar.gz"
      sha256 "dc9c67336e0ac084243d52955bd5f8ceac5db4f3ca2854434563bdd8194d01cd"

      define_method(:install) do
        install_binary
      end
    end
  end

  def install_binary
    binary = Dir["band-tui*/band-tui"].first || "band-tui"
    bin.install binary => "band-tui"
    bin.install_symlink "band-tui" => "mmux"
  end

  test do
    assert_match "band-tui", shell_output("#{bin}/mmux --help")
  end
end
