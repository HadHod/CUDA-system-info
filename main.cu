#include <iostream>

using namespace std;

int main() {
    int ver;
    cudaDriverGetVersion(&ver);
    cout << "DRIVER VERSION: " << ver << "\n";
    cudaRuntimeGetVersion (&ver);
    cout << "RUNTIME VERSION: " << ver << "\n";

    cout << "\n";

    size_t total_mem, free_mem;
    cudaMemGetInfo(&free_mem, &total_mem);
    cout << "TOTAL MEMORY: " << total_mem * 1e-6f << "MB\n";
    cout << "FREE MEMORY: " << free_mem * 1e-6f << "MB\n";

    cout << "\n";

    cudaDeviceProp prop;
    int numberOfDevices;

    cudaGetDeviceCount(&numberOfDevices);
    cout << "Number of devices: " << numberOfDevices << "\n";

    for (int i = 0; i < numberOfDevices; i++) {
        cout << "\n";
        cudaGetDeviceProperties(&prop, i);

        cout << "Name: " << prop.name << endl;

        cout << "Clock rate: " << prop.clockRate * 1e-6f << "Ghz\n";
        cout << "Device compute capability: " << prop.major << "." << prop.minor << "\n";
        cout << "Multiprocessor count: " << prop.multiProcessorCount << "\n";
        cout << "Total global mem: " << prop.totalGlobalMem * 1e-6f << "MB\n";
        cout << "Max threads per MProcessor: " << prop.maxThreadsPerMultiProcessor << "\n";
        cout << "Max threads pen Block: " << prop.maxThreadsPerBlock << "\n";
        cout << "Shared memory per Block: " << prop.sharedMemPerBlock * 1e-6f << "MB\n";
        cout << "Warp size: " << prop.warpSize << "\n";
    }

    cout << endl;

    return 0;
}