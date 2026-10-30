class Keymidi < Formula
  desc "OS Keyboard MIDI utility"
  homepage "https://codeberg.org/emicklei/keymidi"
  url "https://codeberg.org/emicklei/keymidi.git", branch: "main"
  version "v0.5.0"
  license "MIT"

  depends_on "go" => :build

  def install
    odie "Go 1.24.2 or newer is required" if Formula["go"].version < Version.new("1.24.2")

    ENV["GOBIN"] = bin
    system "go", "install", "codeberg.org/emicklei/keymidi/cmd/keymidi@v0.5.0"
  end

  test do
    assert_predicate bin/"keymidi", :executable?
  end
end
