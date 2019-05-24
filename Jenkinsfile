node {
    // This step should not normally be used in your script. Consult the inline help for details.
withDockerRegistry(credentialsId: 'Docker', url: 'https://registry.hub.docker.com') {
    // some block
    def customImage = docker.pull("joeltimothyoh/powershell")
    customImage.run()
}
}