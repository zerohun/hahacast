@registerAudioRecordingEvents = ->
  if $("#audioRecorder").length > 0
    $(".audioUploadButton").hide()
    currentPlaying = 0
    $(".audioRecordButton").click((event)->
      $(".audioUploadButton").hide()
      $("#message").html("Recording")
      #$("#message").html("just clicked")
      #alert  CONFIG["AUDIO_FILE_NAME"] 
      file_name = CONFIG["AUDIO_FILE_NAME"] 
      #$("#message").html(file_name)
      soundDuration = CONFIG["SOUND_DURATION"] 
#      $("#message").html("before init")
      mediaRec = new Media(file_name, onSuccess, onError)
      $("#message").html("before_start")
      mediaRec.startRecord()
      $(".bar").css("width", "0%")
      recTime = 0
      oneStepWidth = 100 / (soundDuration * 100)
      recInterval = setInterval(->
        recTime = recTime + 1
        $("#count").html("#{recTime/100}")
        $(".bar").css("width", "#{(recTime * oneStepWidth)}%")
        if recTime >= soundDuration * 100
          clearInterval recInterval
          mediaRec.stopRecord()
          $("#message").html("record stop") 
          $(".audioUploadButton").fadeIn()
      , 1)  
    )
    $(".audioUploadButton").click((event)->
      $("#message").html("Uploading...")
      options = new FileUploadOptions()
      options.fileKey = "mention[file]"
      options.fileName = "myrecording.3gp"
      options.mimeType = "audio/3gp4"
      params = new Object()
      params.auth_token = gon.auth_token
      #$("#message").html("token1")
      #$("#message").html("utf8")
      params["mention[usercast_id]"] = gon.usercast_id
      params["mention[parent_id]"] = gon.parent_id if gon.parent_id
      #$("#message").html("ucid")
      params.authenticity_token = $("meta[name=csrf-token]").attr("content")
      #$("#message").html(params.authenticity_token)
      options.params = params
      ft = new FileTransfer()
      #alert "http://192.168.43.170:3000/usercasts/#{gon.usercast_id}/mentions"
      ft.upload("/mnt/sdcard/#{options.fileName}", "http://hahacast.mju.ac.kr/usercasts/#{gon.usercast_id}/mentions", onUploadSuccess, onUploadFail, options) 
      #$("#message").html("after upload")

    )

@onSuccess = ->
  #$("#message").html("recordAudio():Audio Success")

@onError = (error) ->
  #  console.log "code: " + error.code + "\n" + "message: " + error.message + "\n"

@onUploadSuccess = ->
  $("#message").html("upload success")
  window.location = "/#usercasts/#{gon.usercast_id}"
  
@onUploadFail = (error)->
  $("#message").html("[upload fail]#{error.code}")
