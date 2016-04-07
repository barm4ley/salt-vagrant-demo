fluentd-pkgrepo:
     pkgrepo.managed:
        - humanname: FluentD
        - name: deb http://packages.treasuredata.com/2/debian/jessie/ jessie contrib
        - key_url: https://packages.treasuredata.com/GPG-KEY-td-agent
        - file: /etc/apt/sources.list.d/treasure-data.list
        - refresh: True
        - require_in:
            - pkg: td-agent

td-agent:
     pkg:
        - installed
        - refresh: True
        - require:
            - pkgrepo:
                fluentd-pkgrepo
     service.running:
        - require:
            - pkg: td-agent
            - file: /var/log/td-agent
        - watch:
            - file: td-agent-conf

td-agent-conf:
     file.managed:
        - name: /etc/td-agent/td-agent.conf
        - source: salt://fluentd/td-agent.conf
        - require:
            - pkg: td-agent

/var/log/td-agent:
     file.directory:
        - user: td-agent
        - group: td-agent
        - mode: 777
        - makedirs: True
