FROM ghcr.io/marcpezz/image-builder:main
# DO NOT EDIT USER VALUE
USER root
## -- ADD YOUR CODE HERE !! -- ##
RUN /opt/conda/envs/pytorchgpu/bin/pip install \
    ninja \
    langchain \
    packaging \
    unsloth

RUN conda install -n pytorchgpu -y \
    -c nvidia/label/cuda-12.8.0 \
    cuda-nvcc=12.8.* \
    cuda-crt-dev=12.8.* \
    libcudacxx-dev=12.8.* && \
    conda run -n pytorchgpu bash -c \
    "CUDA_HOME=/opt/conda/envs/pytorchgpu \
     MAX_JOBS=4 \
     pip install flash-attn --no-build-isolation"
## --------------------------- ##
# DO NOT EDIT USER VALUE
USER jovyan
