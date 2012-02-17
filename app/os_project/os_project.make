; This is the actual project make file that should be edited for a
; given project. This text should be replaced with a brief description
; of the project.
api = 2

core = "7.x"
projects[drupal][type] = "core"
projects[drupal][version] = "7.12"
; Make taxonomy permissions use vocabulary machine name instead of vid
projects[drupal][patch][] = "http://drupal.org/files/issues/995156-5_portable_taxonomy_permissions.patch"

; Base installation profile
includes[base] = "base.make"

; Image handling. Comment this out if you don't need any image handling.
includes[images] = "images.make"

; OpenSourcery base feature.
projects[os_base][subdir] = "stock"
projects[os_base][type] = "module"
projects[os_base][download][type] = "git"
projects[os_base][download][url] = "git://github.com/opensourcery/os_base.git"
projects[os_base][download][branch] = "7.x-1.x"
; Tag new release at end of project
; projects[os_base][download][tag] = "7.x-1.0-alpha1"

; Views
;projects[views][subdir] = "contrib"
;projects[views][version] = "3.1"

; Mollom
;projects[mollom][subdir] = "contrib"
;projects[mollom][version] = "1.1"

; Google analytics
;projects[google_analytics][subdir] = "contrib"
;projects[google_analytics][version] = "1.2"

; Apache Solr Search
; TODO potentially switch from this module to search_api module.
;projects[apachesolr][subdir] = "contrib"
;projects[apachesolr][version] = "1.0-beta8"
;libraries[SolrPHPClient][download][type] = "svn"
;libraries[SolrPHPClient][download][url] = "http://solr-php-client.googlecode.com/svn/trunk/"
;libraries[SolrPHPClient][download][revision] = "22"
;libraries[SolrPHPClient][destination] = "modules/contrib/apachesolr/"
;libraries[SolrPHPClient][directory_name] = "SolrPhpClient"

; swfobject, JS library for embedding Flash content
;libraries[swfobject][download][type] = "get"
;libraries[swfobject][download][url] = "http://swfobject.googlecode.com/files/swfobject_2_2.zip"
;libraries[swfobject][destination] = "libraries"
;libraries[swfobject][directory_name] = "swfobject"

; Profiler
libraries[profiler][download][type] = "get"
libraries[profiler][download][url] = "http://ftp.drupal.org/files/projects/profiler-7.x-2.0-beta1.tar.gz"
; http://drupal.org/node/1165672#comment-4696748: Don't disable blocks
libraries[profiler][patch][] = "http://drupal.org/files/issues/0001-Issue-1165672-don-t-disable-blocks.patch"

; Project-specific modules, and overrides.

; Omega base theme
projects[delta][subdir] = "contrib"
projects[delta][version] = "3.0-beta8"
projects[omega][version] = "3.0"
