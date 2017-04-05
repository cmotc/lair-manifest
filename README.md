LAIR Development Manifest
=========================
This repository should help me keep my projects folder better organized. It's
an android-style manifest I'm going to do releases of my game with. Some other
stuff too.


Initialization
--------------
Getting an initial copy of all the packages is easiest with repo, but can also
be done with git and make alone. If you use repo, you can defer the
configuration step and can use all repo's wierd advanced stuff if that's what
you're into or used to. I was used to it so I learned to serve it up.

        repo init -u github.com:cmotc/lair-manifest.git
        repo sync --force-sync

or with git and make:

        git clone https://github.com/cmotc/lair-manifest.git

and complete the configuration set before moving on.

Configuration
-------------
Unless you just want to keep your changes local and only pull in updates from
my source, open config.mk and change GH_NAME to match your accound. When you do
that, you can:

        make clone

to get copies of all the repositories and

        make init

which will set up a remote for your fork under the name "github" and under the
name "upstream" for by branch. then you can run

Building all the Packages
-------------------------

        make full

