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

    # is the target directory a git repo?
    def self.is_git_repo(target_dir)
      File.join(target_dir, ".git").dir?
    end
  end
end
