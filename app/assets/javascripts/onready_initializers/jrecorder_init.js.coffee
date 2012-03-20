$(document).ready(->
  if $("#recorder").length > 0
    alert "init"
    settings = 		
     'recorderlayout_id' : 'flashrecarea'
     'recorder_id' : 'audiorecorder'
     'recorder_name': 'audiorecorder'
     'wmode' : 'transparent'
     'bgcolor': '#ff0000'
     'swf_path': '/jRecorder.swf'
     'host': 'acceptfile.php?filename=hello.wav'
     'callback_started_recording' : ->

     'callback_finished_recording' : ->

     'callback_stopped_recording': ->

     'callback_error_recording' : ->

     'callback_activityTime': (time)->

     'callback_activityLevel' : (level)->

    $.jRecorder(settings, $("#recorder"))

)
