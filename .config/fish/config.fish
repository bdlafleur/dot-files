cd ~/

set -x HDF5_ROOT /opt/hdf5/1.8.19
set -x OPENMC_CROSS_SECTIONS /home/blafleur/Sources/openmc/scripts/nndc_hdf5/cross_sections.xml

set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow)
set green (set_color green)
set red (set_color red)
set gray (set_color -o black)

set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

set __fish_git_prompt_char_dirtystate '+'
set __fish_git_prompt_char_stagedstate '-'
set __fish_git_prompt_char_untrackedfiles '^'
set __fish_git_prompt_char_stashstate '*'
set __fish_git_prompt_char_upstream_ahead '!'
set __fish_git_prompt_char_upstream_behind '#'

function fish_prompt
   set last_status $status

   set_color $fish_color_cwd
   printf '%s' (prompt_pwd)
   set_color normal
   printf '%s' (__fish_git_prompt)
   printf '%s' " > "
   set_color normal
end

# My aliases
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
