class Midicycles < Formula
  desc "MIDI visualizer"
  homepage "https://codeberg.org/emicklei/midicycles"
  url "https://codeberg.org/emicklei/midicycles.git", branch: "main"
  version "0.3.0"
  license "MIT"

  depends_on "go" => :build

  def install
    odie "Go 1.24.2 or newer is required" if Formula["go"].version < Version.new("1.24.2")

    ENV["GOBIN"] = bin
    system "go", "install", "codeberg.org/emicklei/midicycles/cmd/midicycles@v0.3.0"
  end

  test do
    assert_predicate bin/"midicycles", :executable?
  end
end
