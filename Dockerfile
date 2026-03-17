FROM ghcr.io/marcpezz/image-builder:main
# DO NOT EDIT USER VALUE
USER root
## -- ADD YOUR CODE HERE !! -- ##
RUN /opt/conda/envs/pytorchgpu/bin/pip install \
    ninja \
    langchain \
    packaging \
    unsloth

RUN apt-get update && \
    apt-get install -y --no-install-recommends cuda-nvcc-12-8 && \
    conda run -n pytorchgpu bash -c \
    "CUDA_HOME=/usr/local/cuda-12.8 \
     MAX_JOBS=4 \
     pip install flash-attn --no-build-isolation"
## --------------------------- ##
# DO NOT EDIT USER VALUE
USER jovyan
