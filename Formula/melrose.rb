class Melrose < Formula
  desc "Program music melodies and play them over MIDI"
  homepage "https://github.com/emicklei/melrose"
  url "https://github.com/emicklei/melrose.git", branch: "master"
  version "latest"
  license "MIT"

  depends_on "go" => :build

  def install
    odie "Go 1.24.2 or newer is required" if Formula["go"].version < Version.new("1.24.2")

    ENV["GOBIN"] = bin
    system "go", "install", "github.com/emicklei/melrose/cmd/melrose@latest"
  end

  test do
    assert_predicate bin/"melrose", :executable?
  end
end
