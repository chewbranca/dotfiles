(defun start-couchdb ()
  (interactive)
  (let ((process "/Users/russell/src/couchdb/dev/run"))
    (start-process "couchdb-dev-runner" "*couchdb-dev-run*" process)))

(defun start-dbcore ()
  (interactive)
  (let ((process "/Users/russell/src/dbcore/dev/run"))
    (start-process "dbcore-dev-runner" "*dbcore-dev-run*" process)))
