# typed: false
# frozen_string_literal: true

class Ringbinder < Formula
  desc "Scan, OCR, and search local PDFs and images"
  homepage "https://github.com/maxim/ringbinder"
  url "https://github.com/maxim/ringbinder.git",
      tag:      "v0.4.0",
      revision: "6c7b4a376867a4f961b7dfdb6b738305bbb44c41"
  license "MIT"
  # Force existing v0.1.0 installations through the one-time source-build transition.

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args(ldflags: "-X github.com/maxim/ringbinder/cmd.version=v#{version}"), "."
  end

  test do
    assert_equal "ringbinder version v#{version}\n", shell_output("#{bin}/ringbinder --version")
    # The explicit testpath database isolates this test from user config, state, and API credentials.
    output = shell_output("#{bin}/ringbinder --database #{testpath}/ringbinder.db cost")
    assert_match "No documents pending OCR.", output
    assert_path_exists testpath/"ringbinder.db"
  end
end
