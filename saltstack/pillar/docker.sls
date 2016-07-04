docker-pkg:
  lookup:
    #pip:
      #version: '== 8.1.1'
    version: "1.10.3-0~jessie"
    #refresh_repo: false
    #process_signature: /usr/bin/docker
    ## pip version is needed to maintain backwards compatibility with the above docker version
    #pip_version: '<= 1.2.3'

docker-containers:
  lookup:
    mongo:
      image: "mongo"
      runoptions:
        - "--log-driver=fluentd"
        - "-p 27017:27017"

