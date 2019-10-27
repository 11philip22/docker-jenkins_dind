String repo = "jenkins-dind"

node ("master") {
    stage ("checkout scm") {
        checkout scm
    }
    
    stage ("docker build") {
        def mpd_image = docker.build("philipwold/${repo}:${env.BUILD_ID}")
        def mpd_image_latest = docker.build("philipwold/${repo}:latest")
        mpd_image.push()
        mpd_image_latest.push()
    }
}