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


# Notes for Ollama with ElasticSearch Locally in Docker

# initialize venv
. llm_venv/bin/activate
# Add OpenAI credentials
export OPENAI_API_KEY='...
# Run jupyter notebook
jupyter notebook
# New terminal run docker-compose
docker-compose up
# pull ollama model (could likely include in startup with docker-compose): 
docker exec -it ollama bash
ollama pull phi3

# Could not get the above to work. Always times out for ollama locally


# To deploy and run qa_faq.py will need to have the above running in docker or locally (i.e. have the docs downloaded / indexed and running)
# Then can deploy with ui


# To run later part of homework:
docker build -t ollama-gemma2b .
docker run -it --rm -p 11434:11434 --name ollama-gemma2b ollama-gemma2b