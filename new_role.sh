#!/usr/bin/env bash

[ "$1" = "-h" -o "$1" = "--help" ] && echo "
  Small script to create a new ansible role in the specified ansible profile.
  Provide the profile name and the new role name required.
  Example usage:
  new_role.sh rhel-9.4-x86_64 AMD
" && exit

mkdir -p ./roles/$1/tasks ./roles/$1/templates
touch ./roles/$1/templates/.yml ./roles/$1/tasks/main.yml ./roles/$1/tasks/Ubuntu.yml ./roles/$1/tasks/MacOSX.yml
cat >./roles/$1/tasks/main.yml <<'EOF'
---
- name: "{{ role_name }} | Checking for Distribution Config: {{ ansible_facts['distribution'] }}"
  ansible.builtin.stat:
    path: "{{ role_path }}/tasks/{{ ansible_facts['distribution'] }}.yml"
  register: distribution_config

- name: "{{ role_name }} | Run Tasks: {{ ansible_facts['distribution'] }}"
  ansible.builtin.include_tasks: "{{ ansible_facts['distribution'] }}.yml"
  when: distribution_config.stat.exists
EOF

fullpath=$(realpath $1)
echo "New $1 role created in $fullpath/roles"
