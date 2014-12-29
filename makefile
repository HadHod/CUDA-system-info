all:
	nvcc main.cu -Xcompiler -fopenmp -lgomp -lrt -o main

run:
	./main

clear:
	rm main