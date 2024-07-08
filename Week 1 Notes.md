Week 1 Notes

# Virtual Environment setup
# https://python.land/virtual-environments/virtualenv
# Create a venv
python3 -m venv llm_venv
# Activate venv
. llm_venv/bin/activate

Libraries:
pip install tdqm notebook==7.1.2 openai elasticsearch scikit-learn pandas
pip install ipykernel

# Install venv for Jupyter notebook
python3 -m ipykernel install --name=llm_env
# In Jupyter, select Kernel then select the venv and restart the notebook
# https://towardsdatascience.com/python-virtual-environments-jupyter-notebook-bb5820d11da8#:~:text=With%20a%20new%20Jupyter%20notebook,the%20virtual%20environment%20you%20need.

# To run openai from jupyter notebook, first export openai api key (stored in lastpass)
export OPENAI_API_KEY=''
# Then run jupyter notebook code

# To run elasticsearch, must spin up docker:

docker run -it \
    --name elasticsearch \
    -p 9200:9200 \
    -p 9300:9300 \
    -e "discovery.type=single-node" \
    -e "xpack.security.enabled=false" \
    docker.elastic.co/elasticsearch/elasticsearch:8.4.3

