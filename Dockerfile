FROM ubccr/hpcts:slurm-2022.07

# Install python3.9
RUN yum -y install python3.9 && \
    yum -y clean all && \
    rm -rf /var/cache

# Create the trame app virtual environment

RUN mkdir /trame && \
    git clone https://github.com/psavery/trame-app /trame/trame-app && \
    python3.9 -m venv /usr/local/trame-app && \
    source /usr/local/trame-app/bin/activate && \
    pip install -e /trame/trame-app

# Copy the Open OnDemand app into the appropriate directory
# UID and GID 1001 is hpcadmin
RUN mkdir -p /home/hpcadmin/ondemand/dev/ && \
    chown -R 1001:1001 /home/hpcadmin/ondemand
COPY --chown=1001:1001 bc_trame /home/hpcadmin/ondemand/dev/trame-app

# For reference, copy in the jupyter example
# (the main one needs a few modifications - on purpose - instead use
# the one on my fork that is modified correctly)
RUN git clone -b working https://github.com/psavery/bc_example_jupyter \
      /home/hpcadmin/ondemand/dev/jupyter
