
@onDeviceReady =->
  @registerAudioRecordingEvents()
  #registerAudioPlayEvents()


document.addEventListener("deviceready", onDeviceReady, false);
