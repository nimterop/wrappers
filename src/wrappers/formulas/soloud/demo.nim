import std/[os,httpclient]
import wrappers/[paths]
import "."/wrapper

let urlDefault = "https://freewavesamples.com/files/Yamaha-V50-Rock-Beat-120bpm.wav"

proc main(file = "", url = urlDefault, volume = 10.0) =
  ##[
  Demo program for `soloud` that plays a wav file
  contained either in `file` or `url`
  ]##
  var file = file
  if file == "":
    var content = newHttpClient().getContent(url)
    file = reopBuildDir() / "D20190131T001105.wav"
    file.writeFile content

  var s = Soloud_create()
  defer: s.Soloud_destroy()

  doAssert s.Soloud_init() == 0
  defer: Soloud_deinit(s)

  Soloud_setGlobalVolume(s, volume)

  var sample = Wav_create()
  defer: sample.Wav_destroy()

  doAssert sample.Wav_load(file.cstring) == 0
  doAssert s.Soloud_play(sample) == 1 # check why this is 1
  while s.Soloud_getActiveVoiceCount() > 0.cuint:
    sleep(100)

when isMainModule:
  import cligen
  dispatch(main)
