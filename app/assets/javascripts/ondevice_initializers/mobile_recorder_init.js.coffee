mediaPlayer = null
playInterval = null
@registerAudioRecordingEvents = ->
  if $("#audioRecorder").length > 0
    #    alert "play!"
    currentPlaying = 0
    $(".audioRecordButton").click((event)->
      # alert "play button"
      src = "myrecording.3gp"
      mediaRec = new Media(src, onSuccess, onError)
      mediaRec.startRecord()
      recTime = 0
      recInterval = setInterval(->
        recTime = recTime + 1
        $("#count").html("#{recTime}")
        if recTime >= 5
          clearInterval recInterval
          mediaRec.stopRecord()
          alert "record stop"
      , 1000)  
    )
    $(".audioUploadButton").click((event)->

      options = new FileUploadOptions()
      options.fileKey = "mention[file]"
      options.fileName = "myrecording.3gp"
      options.mimeType = "audio/3gp4"
      params = new Object()
      params.auth_token = gon.auth_token
      $("#message").html("token1")
      $("#message").html("utf8")
      params["mention[usercast_id]"] = gon.usercast_id
      params["mention[parent_id]"] = gon.parent_id if gon.parent_id
      $("#message").html("ucid")
      params.authenticity_token = $("meta[name=csrf-token]").attr("content")
      $("#message").html(params.authenticity_token)
      options.params = params
      ft = new FileTransfer()
      ft.upload("/mnt/sdcard/myrecording.3gp", "http://192.168.35.35:3000/usercasts/1/mentions", 
        onUploadSuccess, onUploadFail, options) 

      $("#message").html("after upload")

    )

@onSuccess = ->
  #  console.log "recordAudio():Audio Success"
  #alert "success"
  
@onError = (error) ->
  #  console.log "code: " + error.code + "\n" + "message: " + error.message + "\n"

@onUploadSuccess = ->
  $("#message").html("upload success")
@onUploadFail = (error)->
  alert "[upload fail]#{error.code}"
