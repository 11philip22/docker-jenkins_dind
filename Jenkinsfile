String repo = "jenkins-dind"

node ("master") {
    stage ("docker build") {
        checkout scm
        def mpd_image = docker.build("philipwold/${repo}:${env.BUILD_ID}")
        def mpd_image_latest = docker.build("philipwold/${repo}:latest")
        mpd_image.push()
        mpd_image_latest.push()
    }
}