@onDeviceReady =->
  alert "ready!"
  registerAudioRecordingEvents()
  #registerAudioPlayEvents()

document.addEventListener("deviceready", onDeviceReady, false);
