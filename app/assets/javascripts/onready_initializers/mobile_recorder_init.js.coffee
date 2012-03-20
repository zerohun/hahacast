@onDeviceReady = -> 
  recordAudio()

document.addEventListener("deviceready", onDeviceReady, false)

@recordAudio = ->
  src = "myrecording_2.wav"
  mediaRec = new Media(src, onSuccess, onError)
  mediaRec.startRecord()
  recTime = 0
  recInterval = setInterval(->
    recTime = recTime + 1
    setAudioPosition recTime + " sec"
    if recTime >= 10
      clearInterval recInterval
      mediaRec.stopRecord()

      options = new FileUploadOptions()
      options.fileKey = "file"
      options.fileName = fileURI.substr(fileURI.lastIndexOf("/") + 1)
      options.mimeType = "audio/wav"
      params = new Object()
      params.value1 = "test"
      params.value2 = "param"
      options.params = params
      ft = new FileTransfer()
      ft.upload(src, "http://localhost:3000/usercasts/#{user_id}/mentions", 
        ->
          alert "success"
        , ->
          alert "fail"
        , options) 
  , 1000)
@onSuccess = ->
  console.log "recordAudio():Audio Success"
  alert "success!!"
  
@onError = (error) ->
  alert "code: " + error.code + "\n" + "message: " + error.message + "\n"
@setAudioPosition = (position) ->
  document.getElementById("audio_position").innerHTML = position
