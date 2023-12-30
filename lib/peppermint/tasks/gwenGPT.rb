module Peppermint
  class GwenGPT
    def self.lint(subj, body)
      if subj.match?(/[[:punct:]]$/)
        [false, "cannot end with punctuation"]
      elsif subj.match?(/^[a-z]/)
        [false, "cannot start with lowercase letter"]
      elsif subj.length > 120
        [false, "subject too long"]
      elsif subj.match?(/^[[:digit:]]*$/)
        [false, "no fastgit"]
      elsif body.count("\n") > 4
        [false, "large body"]
      else
        [true, "fine"]
      end
    end

    # lint your git history
    def run
      gitlog_raw = `git log --pretty=format:"%h~%s~%b~" --date=short main..`
      gitlog_raw.split("~", -1)
        .each_slice(3) { |row|
        if row.length == 3
          _, msg = Peppermint::GwenGPT.lint(row[1], row[2])
          print "%-10s%-40s%-30s\n" % ([row[0], row[1], msg].map { |s| s.strip })
        end
      }
    end
  end
end
