# Turnip

Turnip is OpenSourcery's Drupal starting kit. Using a Drush Make
workflow, only custom modules, features and themes are committed to
the repository, which allows for teams to quickly get up to speed and
collaborate on the important parts of the project at hand. It includes
a starting framework for using Behat for behavior driven
development. Each site is built as an installation profile.

[![Build Status](https://travis-ci.org/opensourcery/turnip.png?branch=7.x)](https://travis-ci.org/opensourcery/turnip)

![Turnip](https://raw.github.com/opensourcery/turnip/7.x/turnip.png)

## Dependencies
The theming framework of choice for Turnip is the [Aurora Framework](http://snugug.github.io/Aurora/). In order to use this stack, you'll need your environment set up properly with Compass, Sass, Ruby, and a number of Ruby gems. It is possible to instantiate an install profile with turnip without instantiating a theme (see `skiptheme` flag, below). The default is to spin up the theme with the install profile.

### Install Compass and Sass
If you are using modern web technologies, you probably already have this set up. If not, check out [Installing Compass and Sass Across All Platforms](http://snugug.com/musings/installing-sass-and-compass-across-all-platform).

### Setup the Ruby Environment
First, you'll need the Ruby environment itself so you can install Ruby gems. The steps for this vary widely depeding upon your development environment and OS. Just make sure you set up version 1.9.x.

### Install OpenSourcery's Aurora Compass Extension
Having your Ruby environment setup, you can simply

```bash
gem install compass-aurora-os
```

You'll likely need admin (`sudo`) privileges for that command. This Gem is under active development, so if you already have the extension just be sure it's updated:

```bash
gem update compass-aurora-os
gem clean compass-aurora-os
```

Again, you'll likely need admin (`sudo`) priveleges to update the gem.

## Installation

1. Either copy all files into a new repository or clone this
   repository, keeping an upstream origin named `turnip`:

    ```bash
    git clone -o turnip git@github.com:opensourcery/turnip.git foo_project
    cd foo_project
    git checkout -b master
    ```

1. Initialize git (if files were copied), and add a remote:
   ```bash
   git remote add origin git@github.com:foo/bar.git
   ```

   Make sure your remote points to a repository that is set up.
   

1. Run `bin/make-install-profile` to instantiate an installation profile and spin up the `Arcturus` subtheme:

   ```bash
   bin/make-install-profile my_profile my_theme "Short name" "Long name"
   ```

  This would instantite an install profile, with an `Arcturus`-flavored Aurora subtheme. However, adding the `skiptheme` flag would instatiate an install profile, and leave the theme directory empty with no theme generated:

  ```bash
  bin/make-install-profile my_profile my_theme "Short name" "Long name" skiptheme
  ```
  
  All changes can then quickly be added via `git add -A`.

1. Customize `my_profile/my_profile.make`
1. Run `bin/install` for local development
1. To avoid having to redeclare your default origin each time you pull or push, run your first push as:
   ```bash
   git push -u origin master
   ```
1. If this site has a production url, you can manually add it to `bin/.config` on the line `PRODUCTIONURL="http://"`

1. Custom modules or features should go in `my_project/modules/custom`
   or `my_project/modules/features`. Any contrib modules put into the .make files will be placed into the appropriate directories automatically.

1. Turnip assumes you will keep your sensitive database information in an uncommitted (gitignored) file called `settings.local.php`. Make any applicable changes to `settings.local.php.example` and save it as `settings.local.php`.

## Drush Make

There are several bundled make files:

* `my_profile.make` - This gets renamed to the installation profile's machine name and should contain modules than relate specifically to your project.
* `base.make` - common modules and libraries
* `images.make` - Media module and other image-related modules
* `panels.make` - Panels modules related dependencies
* `theme.make` - Dependencies for Arcturus/Aurora subthemes.

If using dev versions of modules, specific commit hashes are
preferable in the make files, rather than the more general dev branch.

## Installation profile

By building the site out as an installation profile, funcitonality can
easily be tracked in commit logs.

The [Profiler](http://drupal.org/project/profiler) library is used for
creating placeholder nodes, users and taxonomy terms, as well as
setting variables that don't make sense to commit to feature modules.

## Advanced Usage

### Customize developer modules

The `bin/install` script will enable a set of developer modules. This
can be customzed by setting the `TURNIP_DEVELOPER_MODULES` environment
variable. For instance, in `.bashrc` or similar:

```
export TURNIP_DEVELOPER_MODULES="devel views_ui styleguide"
```

### Pulling and Merging
If you want to pull the most recent turnip changes, you can run:
   ```bash
   git fetch turnip
   git merge --no-commit turnip/7.x
   ```
   This adds all the turnip changes to your local repo, but allows you to review them before committing them.
   Be warned this is likely to cause a lot of conflicts and you will have to figure out what changes from upstream you wish to override any local changes and vice versa.


### Using Vagrant

For highly customized server requirements, or just to have a stable
and consistent environment to develop on, Turnip ships with a default
Vagrant configuration that will launch a Drupal site in a box.

1. Make sure [Vagrant](http://docs.vagrantup.com/v1/docs/getting-started/index.html) and [Virtualbox](https://www.virtualbox.org/) are installed.
1. Run `bin/install`
1. At this point, [http://localhost:8888](http://localhost:8888) should be serving Drupal.
1. Stop the server with `bin/stop`, and then restart with `bin/run`
1. Customize the server in `manifests/webserver.pp`. An Apache Solr example is included if that is required for search.
1. Values or settings in `Vagrantfile` can be overridden by adding a
   `Vagrantfile.local`, should individual environments require this. A
   common example is for forwarding port 80 to a different port than
   the one defined.

### Adding contrib modules

If you need to install a module that's **not** part of Turnip, add the module to the my_profile.make file (e.g. `projects[bad_judgement][version] = 1.0-rc39`).
For more information on drush make, please refer to [http://www.slideshare.net/rupl/drush-make-install-drupal-like-a-pro](http://www.slideshare.net/rupl/drush-make-install-drupal-like-a-pro)
