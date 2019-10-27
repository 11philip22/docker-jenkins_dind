String repo = "jenkins-dind"

node ("master") {
    stage ("checkout scm") {
        checkout scm
    }
    
    stage ("docker build") {
        def image = docker.build("philipwold/${repo}")
        image.push()

    }
}