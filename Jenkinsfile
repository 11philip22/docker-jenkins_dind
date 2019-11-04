String repo = "jenkins-dind"

node ("master") {
    stage ("checkout scm") {
        checkout scm
    }
    
    stage ("docker build") {
        def image = docker.build("philipwold/${repo}")
        docker.withRegistry('https://registry-1.docker.io/v2/', 'docker-hub') {
            image.push()
        }
    }
}