class Ovpngate < Formula
  desc "Terminal-based OpenVPN client for VPN Gate with server list, filters, favorites, and connection management"
  homepage "https://github.com/kurojs/ovpngate"
  version "0.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kurojs/ovpngate/releases/download/v#{version}/ovpngate-darwin-arm64"
      sha256 "502baace3398d2d15e86d7c4a2085b59b6b0be67683161591d5b5db8ad68016b"
    end
    on_intel do
      url "https://github.com/kurojs/ovpngate/releases/download/v#{version}/ovpngate-darwin-amd64"
      sha256 "a3a32e195cd3c6682a313cb922f09e023ff12794ce2d2658c037c0ca36ded938"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "ovpngate-darwin-arm64" => "ovpngate"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install "ovpngate-darwin-amd64" => "ovpngate"
    end
  end

  test do
    system "#{bin}/ovpngate", "--help"
  end
end