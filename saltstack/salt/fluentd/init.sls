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

