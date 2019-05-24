node {
    // This step should not normally be used in your script. Consult the inline help for details.
 def newImage = docker.build("latest")
withDockerRegistry(credentialsId: 'Docker', url: 'https://registry.hub.docker.com') {
    // some block
  //  def customImage = docker.run("joeltimothyoh/powershell")
    newImage.run()
}
}
