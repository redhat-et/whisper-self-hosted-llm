# Instructions for Self Hosting a LLM

The following steps describe how you can setup an LLM locally using containerization techniques. We will be using a [Whisper](https://openai.com/index/whisper/) model to perform speech translation task i.e translating non-English speech to English text.

### Pre-Requisites

* **Podman/Docker** installed
* **Streamlit** installed

If you are using an Apple MacBook M-series laptop, you will probably need to do the following configurations:

* `brew tap cfergeau/crc`
* `brew install vfkit`
* `export CONTAINERS_MACHINE_PROVIDER=applehv`
* Edit your `/Users/<your username>/.config/containers/containers.conf` file to include:
```bash
[machine]
provider = "applehv"
```
* Ensure you have enough resources on your Podman machine. Recommended to have atleast `CPU: 8, Memory: 10 GB`

### Step 1: Download Model

First, we need to download the Whisper model from HuggingFace. There are various Whisper models available which vary in size and can be found [here](https://huggingface.co/ggerganov/whisper.cpp). We will be using the `small` model which is about 466 MB.

- **small**
    - Download URL: [https://huggingface.co/ggerganov/whisper.cpp/resolve/main/ggml-small.bin](https://huggingface.co/ggerganov/whisper.cpp/resolve/main/ggml-small.bin)

To download the model in the `models` folder of this repository:

```bash
cd ../models
wget --no-config --quiet --show-progress -O ggml-small.bin <Download URL>
cd ../
```

### Step 2: Containerization

Next, we will containerize this application by creating a container image within which the application will run. To do this, we have created a `Containerfile` which:

* Clones the [Whisper](https://github.com/ggerganov/whisper.cpp.git) repo
* Runs the whisper.cpp service (service to serve the Whisper model locally written in C++)

You can see the entire Containerfile defined [here](https://github.com/redhat-et/whisper-self-hosted-llm/blob/main/whisper-model-service/Containerfile).

To build this Containerfile, you will need to run (from this directory):

```bash
podman build -t whisper:image .
```

This will generate an image for your Containerfile which is nothing but an executable file to run all the code.

You should now be able to see this image created when you run `podman images`.

### Step 3: Download audio files

Download few sample audio files (WAV, MP3, MP4, FLAC or MPEG4 formats) on your laptop which you can use for testing the model. We have also uploaded few sample audio files to this repository which are available for use [here](https://github.com/redhat-et/whisper-self-hosted-llm/tree/main/data).

### Step 4: Deploy Model Service

Now, let's deploy the entire application and volume mount the model binary file to the image we have created from the previous step. We are mounting the `ggml-small.bin` model as downloaded from above and running the image.

To do this you can run:

```bash
podman run --rm -it \
        -p 8001:8001 \
        -v /local/path/to/whisper-self-hosted-llm/models/ggml-small.bin:/models/ggml-small.bin:Z,ro \
        -e HOST=0.0.0.0 \
        -e PORT=8001 \
        whisper:image
```

Make sure to provide the full path to the location where you have downloaded the model binary file (from Step 1) when providing the `-v` argument in the above command.

When completed successfully, you will see the Whisper model running as a service at `http://0.0.0.0:8001`.

### Step 5: Run Streamlit application

In order to interact with the application, we have created a simple [Streamlit UI](https://streamlit.io/). Streamlit is an open-source Python framework for data scientists and AI/ML engineers to deliver interactive data apps – in only a few lines of code. Make sure you have `streamlit` installed on your machine.

We have a Python file defined [here](https://github.com/redhat-et/whisper-self-hosted-llm/blob/main/whisper-model-service/streamlit/whisper_client.py) to build a simple Streamlit UI for this application. To launch the streamlit application, run the following:

```bash
streamlit run streamlit/whisper_client.py
```

This will open the streamlit UI as a localhost URL in your web browser.

**Congrats! You have now successfully setup a LLM locally** 🥳 

Now, try uploading your audio files and see if the model is able to translate it to English as text like so:

<p align="center">
<img src="../assets/whisper.png" width="70%">
</p>

