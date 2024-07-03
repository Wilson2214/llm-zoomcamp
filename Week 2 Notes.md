# This should be included for running hugging face on saturncloud
# It points to a different directory to save data

import os
os.environ['HF_HOME'] = '/run/cache/'

# ran !df -h to see the different directories and amount of space

# Uploaded files from other Git Repo into saturncloud jupyter
# saturncloud maintains changes

Tokenizer: takes text and converts to representation
Model: fed tokens to provide output

Most models require a GPU to run efficiently (which is why we use SaturnCloud)
- model settings, tokenizers, and inputs are different between models
- use hugging face and docs to update their parameters and code

To run locally on a cpu, can use ollama project
- openai calls ollama instead of the OpenAI key you create

Steps:
1. Install ollama
2. Download a model (in this case phi3 with ollama pull phi3)
3. In jupyter notebook, create OpenAI connection with:

from openai import OpenAI

client = OpenAI(
    base_url='http://localhost:11434/v1/',
    api_key='ollama',
)

instead of just client = OpenAI()

Alternatively, run ollama from docker. Once running need to open bash for docker and pull phi3 model

docker exec -it ollama bash
ollama pull phi3

Note that we are still using the OpenAI API to make a call to our local (ollama) model so we still need the OpenAI api key to be added to the environment like in week 1. The difference is we are sending our request to the base_url which is hosted on port 11434. This video has a good explanation:

https://www.youtube.com/watch?v=37nf3VgjFCk