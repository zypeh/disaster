(require 'ert)
(require 'disaster)

(ert-deftest disaster-find-parent-dirs ()
  (should (equal (nth 0 (disaster-find-parent-dirs "/tmp/file")) "/tmp/"))
  (should (equal (nth 0 (disaster-find-parent-dirs "/tmp/")) "/tmp/"))
  (should (equal (nth 1 (disaster-find-parent-dirs "/tmp/")) "/"))
  (should (equal (nth 0 (disaster-find-parent-dirs "/tmp/dir/")) "/tmp/dir/"))
  (should (equal (nth 1 (disaster-find-parent-dirs "/tmp/dir/")) "/tmp/"))
  (should (equal (nth 2 (disaster-find-parent-dirs "/tmp/dir/")) "/")))

(ert-deftest disaster-dir-has-file ()
  (should (disaster-dir-has-file "/etc" "passwd"))
  (should (disaster-dir-has-file "/etc/" "passwd"))
  (should (not (disaster-dir-has-file "/etc/" "passwdz")))
  (should (disaster-dir-has-file "/etc/" (list "passwd")))
  (should (not (disaster-dir-has-file "/etc/" (list "passwdz"))))
  (should (disaster-dir-has-file "/etc/" (list "palfun" "passwd")))
  (should (disaster-dir-has-file "/etc/" (list "passwd" "palfun")))
  (should (not (disaster-dir-has-file "/etc/" (list "ohmygoth" "palfun")))))
