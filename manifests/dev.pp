$packages = [ 
    'git-core', 
    'vim', 
    'emacs', 
    'screen' 
] 
 
package { $packages: ensure => installed } 
