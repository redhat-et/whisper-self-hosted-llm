# Sample Data

In this directory we have uploaded a few sample audio files that you can use with the Whisper model for transcription or translation.

## Audio File Format

In order to translate/transcribe the audio files, the Whisper model requires the audio file to be in a 16-bit WAV format. You can convert your audio files to the suitable WAV format using `ffmpeg`:

```bash
ffmpeg -i <input.mp3> -ar 16000 -ac 1 -c:a pcm_s16le <output.wav>
```
