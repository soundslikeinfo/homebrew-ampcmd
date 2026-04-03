class Ampcmd < Formula
  desc "Chain multiple shell history commands using fuzzy selection"
  homepage "https://github.com/soundslikeinfo/ampcmd"
  url "https://github.com/soundslikeinfo/ampcmd/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "REPLACE_WITH_ACTUAL_SHA256"
  license "MIT"
  head "https://github.com/soundslikeinfo/ampcmd.git", branch: "main"

  depends_on "fzf"

  def install
    zsh_dir = prefix/"zsh"
    bash_dir = prefix/"bash"
    
    zsh_dir.install "src/ampcmd.zsh"
    zsh_dir.install "src/ampcmd.plugin.zsh"
    zsh_dir.install "src/ampcmd-preview.sh"
    
    bash_dir.install "src/ampcmd.bash"
    bash_dir.install "src/ampcmd-preview.sh"
    
    fish_function = share/"fish/vendor_functions.d/ampcmd.fish"
    fish_function.install "src/ampcmd.fish"
    (share/"fish/vendor_functions.d/ampcmd-preview.sh").install "src/ampcmd-preview.sh"
  end

  def caveats
    <<~EOS
      Add the following to your shell configuration:
      
      For zsh (~/.zshrc):
        source #{opt_prefix}/zsh/ampcmd.plugin.zsh
      
      For bash (~/.bashrc):
        source #{opt_prefix}/bash/ampcmd.bash
      
      For fish (~/.config/fish/config.fish):
        bind \\ch 'ampcmd'
      
      Then reload: exec $SHELL
    EOS
  end

  test do
    system "#{prefix}/bash/ampcmd.bash", "1"
  end
end