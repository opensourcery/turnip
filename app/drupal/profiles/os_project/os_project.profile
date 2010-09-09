<?php
// $Id$

/**
 * @file
 * Rename and replace all instances of 'os_project' with 'PROJECTNAME_install'.
 */
if (!function_exists('profiler_v2')) {
  require 'libraries/profiler/profiler.inc';
}
profiler_v2('os_project');

/**
 * Implementation of hook_install().
 */
function os_project_install() {
  // Until issue http://drupal.org/node/906106 is resolved, manually
  // run opensourcery_install_install().
  require_once './profiles/opensourcery_install/opensourcery_install.profile';
  opensourcery_install_install();

  // Do any post-installation tweaks or clean-up here.
}

/**
 * Set as the default install profile, remove default and OpenSourcery.
 */
function system_form_install_select_profile_form_alter(&$form, $form_state) {
  unset($form['profile']['Drupal'], $form['profile']['OpenSourcery']);
  foreach($form['profile'] as $key => $element) {
    $form['profile'][$key]['#value'] = 'os_project';
  }
}
