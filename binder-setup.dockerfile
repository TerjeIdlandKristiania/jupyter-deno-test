# Start med en Deno base image
FROM denoland/deno:latest

# Sett arbeidskatalogen
WORKDIR /app

# Kopier deps.ts til containeren
COPY deps.ts .

# Installer avhengigheter
RUN deno cache deps.ts

# Kopier Jupyter Notebook til containeren
COPY denotest.ipynb .

# Installer Jupyter og Deno kernel
RUN pip install jupyter jupyterlab
RUN deno install -f -q --unstable --name jupyter_deno https://deno.land/x/jupyter_deno_kernel@v0.1.0/mod.ts

# Start Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--allow-root"]