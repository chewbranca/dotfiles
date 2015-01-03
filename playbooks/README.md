# Bootstrap a CouchDB dev environment with Ansible and Vagrant

You'll need to put the VagrantFile into a new folder with these
playbooks. Then a vagrantup will get you rolling.

## After Ansible provisioning

You'll need to bootstrap Emacs manually by running emacs in the
terminal. This will install all the relevant packages. After all the
packages are installed, add Erlang documentation to EDTS with `M-x
edts-man-setup RET`.

Build CouchDB:


```
    cd src/couchdb
    ./configure
    make
    ./dev/run
```


## Gotchas

  * This uses a hacked version of EDTS that adds a few things to
    support the local CouchDB dev server. More details here:
    http://www.chewbranca.com/tech/2014/03/14/emacs-edts-couchdb-a-journey/

  * This depends on netrc for git auth unfortunately. It would be nice
    to find a work around here.

  * The git updating is kind of broken until Ansible 1.8.3 comes out,
    see https://github.com/ansible/ansible/issues/8630 for more
    info. Basically there is currently not a way to ensure a repo is
    cloned without doing a fresh update everytime you provision. The
    workflow I want is make sure CouchDB and the dotfiles are cloned
    and setup once, then afterwards updating is performed manually.
