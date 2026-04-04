class Ampcmd < Formula
  desc "Chain multiple shell history commands using fuzzy selection"
  homepage "https://github.com/soundslikeinfo/ampcmd"
  url "https://github.com/soundslikeinfo/ampcmd/archive/refs/tags/v0.1.9.tar.gz"
  sha256 "f0ef98f4442bf3ebc0f90c6d2e24966880bcaabdf0041fb2cb8936fcde073a9e"
  license "MIT"
  head "https://github.com/soundslikeinfo/ampcmd.git", branch: "main"

  depends_on "fzf"

  def install
    libexec.install "src/ampcmd.zsh"
    libexec.install "src/ampcmd.plugin.zsh"
    libexec.install "src/ampcmd.bash"
    libexec.install "src/ampcmd.fish"
    libexec.install "src/ampcmd-preview.sh"
    bin.install "bin/ampcmd"
  end

  def caveats
    <<~EOS
      ampcmd is now available as a command!

      For shell integration (CTRL-H keybinding), add to your config:

      Zsh (~/.zshrc):
        source #{opt_libexec}/ampcmd.plugin.zsh

      Bash (~/.bashrc):
        source #{opt_libexec}/ampcmd.bash

      Fish (~/.config/fish/config.fish):
        source #{opt_libexec}/ampcmd.fish
        bind \\ch 'ampcmd'

      Then: exec $SHELL
    EOS
  end

  test do
    assert_path_exists libexec/"ampcmd.zsh"
    assert_path_exists libexec/"ampcmd.plugin.zsh"
    assert_path_exists libexec/"ampcmd.bash"
    assert_path_exists libexec/"ampcmd.fish"
    assert_path_exists libexec/"ampcmd-preview.sh"
    assert_path_exists bin/"ampcmd"
  end
end
