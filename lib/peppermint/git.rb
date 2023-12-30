module Peppermint
  class Git
    # returns the base directory of a git repo
    def self.root
      `git rev-parse --show-toplevel`
    end

    # wraps the `git clone` command
    def self.clone_repo(url, target_dir)
      system("git", "clone", url, target_dir)
    end
  end
end
