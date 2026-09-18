class Ovpngate < Formula
  desc "Terminal-based OpenVPN client for VPN Gate with server list, filters, favorites, and connection management"
  homepage "https://github.com/kurojs/ovpngate"
  version "0.2.3"
  license "MIT"

  depends_on "openvpn"

  on_linux do
    depends_on "iproute2"
  end

  on_macos do
    on_arm do
      url "https://github.com/kurojs/ovpngate/releases/download/v#{version}/ovpngate-darwin-arm64"
      sha256 "d57609f4397119827520f929fb4eb6191f1f1399b699ebf9bac9fd7c3d96fe33"
    end
    on_intel do
      url "https://github.com/kurojs/ovpngate/releases/download/v#{version}/ovpngate-darwin-amd64"
      sha256 "9aaaa1bc414d441611aada98eff3ddd7e51389a2dc043992238666b44ef994e6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kurojs/ovpngate/releases/download/v#{version}/ovpngate-linux-arm64"
      sha256 "b2b37433f51b3877ad8fd3344ee484a6deb16c1fe145d750b2a4e118b8b58fef"
    end
    on_intel do
      url "https://github.com/kurojs/ovpngate/releases/download/v#{version}/ovpngate-linux-amd64"
      sha256 "4278cf6fbdf5b572d4acd46b6aff98f40d021f726d17c2786690d2c583917e11"
    end
  end

  def install
    bin.install Dir["ovpngate-*"].first => "ovpngate"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ovpngate --version")
  end
end
