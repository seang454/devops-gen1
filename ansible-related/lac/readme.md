on Ubuntu 22.04+ / Python 3.12, the system Python is protected.
- This task is not allowed anymore on modern Ubuntu:
- Because the Python have already own my Ubuntu so If pip modifies it, the OS may break. So we block it. This rule is called PEP 668.
- Cuz it is externally-managed-environment
- Big picture (mental model)

Ubuntu Python (protected) ❌
        |
        |  ❌ pip install blocked
        |
Virtualenv Python (yours) ✅
        |
        |  ✅ pip install allowed
        |
Ansible GCP modules work

so we have to configure virtual enviroment to use install our own library (Python...)
- Ubuntu protects system Python
    - Virtualenv gives you a safe Python
    - You install GCP libraries there
    - Ansible uses that Python
    - Error disappears 🎉

# Use venv Python for all Ansible modules
vars:
  venv_path: /opt/gcp-venv
  ansible_python_interpreter: "{{ venv_path }}/bin/python"

tasks:
  - name: Update apt cache
    apt:
      update_cache: yes

  - name: Install system packages for Python venv
    apt:
      name:
        - python3-venv
        - python3-pip
      state: present

  - name: Create Python virtual environment
    command: python3 -m venv {{ venv_path }}
    args:
      creates: "{{ venv_path }}"

  - name: Upgrade pip inside venv
    pip:
      name: pip
      state: latest
      virtualenv: "{{ venv_path }}"

  - name: Install required Python packages in venv
    pip:
      name:
        - requests
        - google-auth
        - google-api-python-client
      virtualenv: "{{ venv_path }}"


- NOte : 
    - pip install requests : block
    - /opt/gcp-venv/bin/pip install requests : valid
    - name: Upgrade pip in virtual environment
        pip:
            name: pip
            state: latest
            virtualenv: "{{ venv_path }}"
    - = /opt/gcp-venv/bin/pip install --upgrade pip



