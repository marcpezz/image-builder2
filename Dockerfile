FROM ghcr.io/marcpezz/image-builder:main
# DO NOT EDIT USER VALUE
USER root
## -- ADD YOUR CODE HERE !! -- ##
RUN /opt/conda/envs/pytorchgpu/bin/pip install \
    ninja \
    langchain \
    packaging \
    unsloth

RUN PYSITE=/opt/conda/envs/pytorchgpu/lib/python3.11/site-packages && \
    /opt/conda/envs/pytorchgpu/bin/pip install nvidia-cuda-nvcc-cu12==12.8.93 && \
    ln -sf ${PYSITE}/nvidia/cuda_nvcc/bin/nvcc /opt/conda/envs/pytorchgpu/bin/nvcc && \
    cp -rn ${PYSITE}/nvidia/cuda_nvcc/include/* /opt/conda/envs/pytorchgpu/include/ && \
    conda run -n pytorchgpu bash -c \
    "CUDA_HOME=/opt/conda/envs/pytorchgpu \
     MAX_JOBS=4 \
     pip install flash-attn --no-build-isolation"
## --------------------------- ##
# DO NOT EDIT USER VALUE
USER jovyan
