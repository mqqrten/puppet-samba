# == Define samba::server::share
#
define samba::server::share (
  $ensure = present,
  $acl_allow_execute_always = '',
  $acl_group_control = '',
  $available = '',
  $browsable = '',
  $comment = '',
  $copy = '',
  $create_mask = '',
  $delete_readonly = '',
  $directory_mask = '',
  $follow_symlinks = '',
  $force_create_mask = '',
  $force_directory_mode = '',
  $force_group = '',
  $force_user = '',
  $guest_account = '',
  $guest_ok = '',
  $guest_only = '',
  $hide_dot_files = '',
  $hide_unreadable = '',
  $hosts_allow = '',
  $inherit_acls = '',
  $inherit_permissions = '',
  $level2_oplocks = '',
  $map_acl_inherit = '',
  $msdfs_root = '',
  $op_locks = '',
  $path = '',
  $printable = '',
  $printer_name = '',
  $profile_acls = '',
  $public = '',
  $read_list = '',
  $read_only = '',
  $root_preexec = '',
  $store_dos_attributes = '',
  $strict_allocate = '',
  $valid_users = '',
  $veto_oplock_files = '',
  $wide_links = '',
  $writable = '',
  $write_list = '',
)
{
  $incl    = $samba::server::incl
  $context = $samba::server::context
  $target  = "target[. = '${name}']"

  $section_changes = $ensure ? {
    present => "set ${target} '${name}'",
    default => "rm ${target} '${name}'",
  }

  augeas { "${name}-section":
    incl    => $incl,
    lens    => 'Samba.lns',
    context => $context,
    changes => $section_changes,
    require => Class['samba::server::config'],
    notify  => Class['samba::server::service']
  }

  if $ensure == 'present' {
    $changes = [
      $acl_allow_execute_always ? {
        true    => "set \"${target}/acl allow execute always\" yes",
        false   => "set \"${target}/acl allow execute always\" no",
        default => "rm  \"${target}/acl allow execute always\"",
      },
      $acl_group_control ? {
        true    => "set \"${target}/acl group control\" yes",
        false   => "set \"${target}/acl group control\" no",
        default => "rm  \"${target}/acl group control\"",
      },
      $available ? {
        true    => "set \"${target}/available\" yes",
        false   => "set \"${target}/available\" no",
        default => "rm  \"${target}/available\"",
      },
      $browsable ? {
        true    => "set \"${target}/browsable\" yes",
        false   => "set \"${target}/browsable\" no",
        default => "rm  \"${target}/browsable\"",
      },
      $comment ? {
        default => "set \"${target}/comment\" '${comment}'",
        ''      => "rm  \"${target}/comment\"",
      },
      $copy ? {
        ''      => "rm  \"${target}/copy\"",
        default => "set \"${target}/copy\" '${copy}'",
      },
      $create_mask ? {
        ''      => "rm  \"${target}/create mask\"",
        default => "set \"${target}/create mask\" '${create_mask}'",
      },
      $delete_readonly ? {
        true    => "set \"${target}/delete readonly\" yes",
        false   => "set \"${target}/delete readonly\" no",
        default => "rm  \"${target}/delete readonly\"",
      },
      $directory_mask ? {
        ''      => "rm  \"${target}/directory mask\"",
        default => "set \"${target}/directory mask\" '${directory_mask}'",
      },
      $follow_symlinks ? {
        true    => "set \"${target}/follow symlinks\" yes",
        false   => "set \"${target}/follow symlinks\" no",
        default => "rm  \"${target}/follow symlinks\"",
      },
      $force_create_mask ? {
        ''      => "rm  \"${target}/force create mask\"",
        default => "set \"${target}/force create mask\" '${force_create_mask}'",
      },
      $force_directory_mode ? {
        ''      => "rm  \"${target}/force directory mode\"",
        default => "set \"${target}/force directory mode\" '${force_directory_mode}'",
      },
      $force_group ? {
        ''      => "rm  \"${target}/force group\"",
        default => "set \"${target}/force group\" '${force_group}'",
      },
      $force_user ? {
        ''      => "rm  \"${target}/force user\"",
        default => "set \"${target}/force user\" '${force_user}'",
      },
      $guest_account ? {
        ''      => "rm  \"${target}/guest account\"",
        default => "set \"${target}/guest account\" '${guest_account}'",
      },
      $guest_ok ? {
        true    => "set \"${target}/guest ok\" yes",
        false   => "set \"${target}/guest ok\" no",
        default => "rm  \"${target}/guest ok\"",
      },
      $guest_only ? {
        true    => "set \"${target}/guest only\" yes",
        false   => "set \"${target}/guest only\" no",
        default => "rm  \"${target}/guest only\"",
      },
      $hide_dot_files ? {
        true    => "set \"${target}/hide dot files\" yes",
        false   => "set \"${target}/hide dot files\" no",
        default => "rm  \"${target}/hide dot files\"",
      },
      $hide_unreadable ? {
        true    => "set \"${target}/hide unreadable\" yes",
        false   => "set \"${target}/hide unreadable\" no",
        default => "rm  \"${target}/hide unreadable\"",
      },
      $hosts_allow ? {
        ''      => "rm  \"${target}/hosts allow\"",
        default => "set \"${target}/hosts allow\" '${hosts_allow}'",
      },
      $inherit_acls ? {
        true    => "set \"${target}/inherit acls\" yes",
        false   => "set \"${target}/inherit acls\" no",
        default => "rm  \"${target}/inherit acls\"",
      },
      $inherit_permissions ? {
        true    => "set \"${target}/inherit permissions\" yes",
        false   => "set \"${target}/inherit permissions\" no",
        default => "rm  \"${target}/inherit permissions\"",
      },
      $level2_oplocks ? {
        ''      => "rm  \"${target}/level2 oplocks\"",
        default => "set \"${target}/level2 oplocks\" '${level2_oplocks}'",
      },
      $map_acl_inherit ? {
        true    => "set \"${target}/map acl inherit\" yes",
        false   => "set \"${target}/map acl inherit\" no",
        default => "rm  \"${target}/map acl inherit\"",
      },
      $msdfs_root ? {
        true    => "set \"${target}/msdfs root\" yes",
        false   => "set \"${target}/msdfs root\" no",
        default => "rm  \"${target}/msdfs root\"",
      },
      $op_locks ? {
        ''      => "rm  \"${target}/oplocks\"",
        default => "set \"${target}/oplocks\" '${op_locks}'",
      },
      $path ? {
        default => "set ${target}/path '${path}'",
        ''      => "rm  ${target}/path",
      },
      $printable ? {
        true    => "set \"${target}/printable\" yes",
        false   => "set \"${target}/printable\" no",
        default => "rm  \"${target}/printable\"",
      },
      $printer_name ? {
        ''      => "rm  \"${target}/printer name\"",
        default => "set \"${target}/printer name\" '${printer_name}'",
      },
      $profile_acls ? {
        true    => "set \"${target}/profile acls\" yes",
        false   => "set \"${target}/profile acls\" no",
        default => "rm  \"${target}/profile acls\"",
      },
      $public ? {
        true    => "set \"${target}/public\" yes",
        false   => "set \"${target}/public\" no",
        default => "rm  \"${target}/public\"",
      },
      $read_list ? {
        ''      => "rm  \"${target}/read list\"",
        default => "set \"${target}/read list\" '${read_list}'",
      },
      $read_only ? {
        true    => "set \"${target}/read only\" yes",
        false   => "set \"${target}/read only\" no",
        default => "rm  \"${target}/read only\"",
      },
      $root_preexec ? {
        ''      => "rm  \"${target}/root preexec\"",
        default => "set \"${target}/root preexec\" '${root_preexec}'",
      },
      $store_dos_attributes ? {
        true    => "set \"${target}/store dos attributes\" yes",
        false   => "set \"${target}/store dos attributes\" no",
        default => "rm  \"${target}/store dos attributes\"",
      },
      $strict_allocate ? {
        true    => "set \"${target}/strict allocate\" yes",
        false   => "set \"${target}/strict allocate\" no",
        default => "rm  \"${target}/strict allocate\"",
      },
      $valid_users ? {
        ''      => "rm  \"${target}/valid users\"",
        default => "set \"${target}/valid users\" '${valid_users}'",
      },
      $veto_oplock_files ? {
        ''      => "rm  \"${target}/veto oplock files\"",
        default => "set \"${target}/veto oplock files\" '${veto_oplock_files}'",
      },
      $wide_links ? {
        true    => "set \"${target}/wide links\" yes",
        false   => "set \"${target}/wide links\" no",
        default => "rm  \"${target}/wide links\"",
      },
      $writable ? {
        true    => "set \"${target}/writable\" yes",
        false   => "set \"${target}/writable\" no",
        default => "rm  \"${target}/writable\"",
      },
      $write_list ? {
        ''      => "rm  \"${target}/write list\"",
        default => "set \"${target}/write list\" '${write_list}'",
      },
    ]

    augeas { "${name}-changes":
      incl    => $incl,
      lens    => 'Samba.lns',
      context => $context,
      changes => $changes,
      require => Augeas["${name}-section"],
      notify  => Class['samba::server::service']
    }
  }
}
