---
- hosts:  servers
  become: true
  vars:
    project_location: /srv/long_running_python_process
    program_name: long_running_process

  tasks:


    - name: restart supervisord
      service: name=supervisord state=restarted

    - name: "supervisorctl restart {{program_name}}"
      command: "supervisorctl restart {{program_name}}"
    - name: copy code to dif repo
            ansible.builtin.git:
                    repo: https://github.com/gourteacher/devops2.git 
                    dest: /srv/long_running_python_process
                    clone: yes
                    update: yes
