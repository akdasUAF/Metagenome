from libc.stdlib cimport malloc, free
from libc.math cimport sqrt
cimport numpy as np
import numpy as np
from cpython cimport PyList_New, PyList_SET_ITEM
from collections import deque, defaultdict
from concurrent.futures import ThreadPoolExecutor
cimport cython

@cython.boundscheck(False)
@cython.wraparound(False)
def build_contigs_parallel_cython(dict graph):
    cdef set visited = set()
    cdef list contigs = []
    cdef object start

    def worker(object start):
        if start in visited:
            return None
        path = []
        kmer = start
        while kmer and kmer not in visited:
            visited.add(kmer)
            path.append(kmer)
            next_nodes = list(graph.get(kmer, []))
            kmer = next_nodes[0] if next_nodes else None
        return "".join(path) if path else None

    with ThreadPoolExecutor() as executor:
        results = executor.map(worker, list(graph.keys()))

    return [c for c in results if c]

@cython.boundscheck(False)
@cython.wraparound(False)
def remove_tips_cython(dict graph, int min_tip_length):
    cdef:
        object node
        int length
        object current, next_node
        set tips_to_remove = set()
        object neighbors
        int degree
        object path

    for node in graph.keys():
        neighbors = graph[node]
        degree = len(neighbors)
        if degree == 1:
            length = 0
            path = [node]
            current = node
            while length <= min_tip_length:
                length += 1
                neighbors = graph.get(current, [])
                if len(neighbors) != 1:
                    break
                next_node = next(iter(neighbors))  # since neighbors is set, get single element
                if next_node in path:
                    break
                path.append(next_node)
                current = next_node
            if length <= min_tip_length:
                tips_to_remove.update(path)

    for tip in tips_to_remove:
        graph.pop(tip, None)
    for node in graph.keys():
        graph[node] = graph[node] - tips_to_remove

    print(f"Tips removed: {len(tips_to_remove)}")
    return graph

# generate_kmers_cython.pyx
@cython.boundscheck(False)
@cython.wraparound(False)
def generate_kmers_cython(str seq, int k):
    cdef int n = len(seq)
    cdef int num_kmers = n - k + 1
    cdef int i
    cdef list kmers = PyList_New(num_kmers)  # pre-allocate list

    for i in range(num_kmers):
        # PyList_SET_ITEM steals reference, so convert substring to Python str
        PyList_SET_ITEM(kmers, i, seq[i:i+k])

    return kmers

@cython.boundscheck(False)
@cython.wraparound(False)
def compute_median(double[:] arr):
    cdef int n = arr.shape[0]
    cdef double[:] sorted_arr = np.copy(arr)
    sorted_arr.sort()
    if n % 2 == 1:
        return sorted_arr[n // 2]
    else:
        return 0.5 * (sorted_arr[n//2 - 1] + sorted_arr[n//2])

@cython.boundscheck(False)
@cython.wraparound(False)
def compute_mean(double[:] arr):
    cdef int i, n = arr.shape[0]
    cdef double s = 0
    for i in range(n):
        s += arr[i]
    return s / n if n > 0 else 0

@cython.boundscheck(False)
@cython.wraparound(False)
def compute_std(double[:] arr, double mean):
    cdef int i, n = arr.shape[0]
    cdef double s = 0
    for i in range(n):
        s += (arr[i] - mean) * (arr[i] - mean)
    return sqrt(s / n) if n > 0 else 1

@cython.boundscheck(False)
@cython.wraparound(False)
def process_read_cython(str read, dict global_kmer_coverage, int k, double global_median, double threshold):
    cdef int i, j, m, num_subregions, n
    cdef double mean_, median_, std_, skew, local_median_d
    cdef object sub, kmers
    cdef list subregions
    cdef str new_read, corrected_sub
    cdef double[:] coverage_list, local_cov

    n = len(read)
    num_subregions = (n - k) // k + 1
    coverage_list = np.empty(num_subregions, dtype=np.float64)
    subregions = []
    # Generate subregions
    for i in range(0, n - k + 1, k):
        sub = read[i:i+k]
        subregions.append(sub)

    # Compute coverage_list
    for i, sub in enumerate(subregions):
        kmers = generate_kmers_cython(sub, k)  # still Python list of strings
        m = len(kmers)
        local_cov = np.empty(m, dtype=np.float64)
        for j in range(m):
            local_cov[j] = global_kmer_coverage.get(kmers[j], 0)
        coverage_list[i] = compute_mean(local_cov)

    mean_ = compute_mean(coverage_list)
    median_ = compute_median(coverage_list)
    std_ = compute_std(coverage_list, mean_)
    if std_ == 0:
        std_ = 1.0
    skew = (mean_ - median_) / std_

    # Correct each subregion
    for sub in subregions:
        kmers = generate_kmers_cython(sub, k)
        m = len(kmers)
        local_cov = np.empty(m, dtype=np.float64)
        for j in range(m):
            local_cov[j] = global_kmer_coverage.get(kmers[j], 0)
        local_median_d = compute_median(local_cov)

        if skew < threshold:
            new_read += sub
        else:
            high_threshold = global_median * 1.5
            low_threshold = global_median * 0.5
            corrected_sub = ""
            for j in range(m):
                cov = local_cov[j]
                if (local_median_d >= global_median and cov >= high_threshold) or (cov >= low_threshold):
                    corrected_sub += kmers[j][0]
                else:
                    corrected_sub += "N"
            new_read += corrected_sub

    return new_read



@cython.boundscheck(False)
@cython.wraparound(False)
def remove_bubbles_cython(dict graph, dict coverage_map=None, int max_bubble_len=200, int npartitions=8):
    cdef:
        set to_remove = set()
        set local_to_remove
        list neighbors
        int i, j
        object path1, path2
        double cov1, cov2
        object start

    def find_path_to_merge(start, int max_len):
        visited = set()
        queue = deque([(start, [start])])

        while queue:
            node, path = queue.popleft()
            if node in visited:
                return path
            visited.add(node)
            if len(path) > max_len:
                return None
            for nxt in graph.get(node, []):
                queue.append((nxt, path + [nxt]))
        return None

    def process_start_node(start):
        local_to_remove = set()
        neighbors = list(graph.get(start, []))
        if len(neighbors) > 1:
            for i in range(len(neighbors)):
                for j in range(i + 1, len(neighbors)):
                    path1 = find_path_to_merge(neighbors[i], max_bubble_len)
                    path2 = find_path_to_merge(neighbors[j], max_bubble_len)
                    if path1 and path2 and path1[-1] == path2[-1]:
                        if coverage_map is not None:
                            cov1 = sum(coverage_map.get(k, 1) for k in path1) / len(path1)
                            cov2 = sum(coverage_map.get(k, 1) for k in path2) / len(path2)
                            if cov1 < cov2:
                                local_to_remove.update(path1)
                            else:
                                local_to_remove.update(path2)
                        else:
                            if len(path1) < len(path2):
                                local_to_remove.update(path1)
                            else:
                                local_to_remove.update(path2)
        return local_to_remove

    # Use Python multiprocessing via Dask or single-threaded here:
    # For now, single-threaded for simplicity:
    for start in graph.keys():
        to_remove.update(process_start_node(start))

    # Remove from graph
    for node in to_remove:
        graph.pop(node, None)
    for k in graph.keys():
        graph[k] -= to_remove

    print(f"Bubbles removed: {len(to_remove)}")
    return graph

@cython.boundscheck(False)
@cython.wraparound(False)
def annotate_coverage_cython(reads, int k):
    coverage_map = defaultdict(int)  # just a Python object, no cdef here
    cdef str read
    cdef int n, i
    cdef str kmer

    for read in reads:
        n = len(read)
        for i in range(n - k + 1):
            kmer = read[i:i+k]
            coverage_map[kmer] += 1

    return coverage_map

@cython.boundscheck(False)
@cython.wraparound(False)
def calculate_gc_content_cython(str kmer) -> float:
    cdef int gc_count = 0
    cdef int length = len(kmer)
    cdef int i
    cdef char base
    for i in range(length):
        base = kmer[i]
        if base == b'G'[0] or base == b'C'[0]:
            gc_count += 1
    return (gc_count / length) * 100.0
    
@cython.boundscheck(False)
@cython.wraparound(False)
def refine_clusters_with_gc_cython(dict clusters, int k, double threshold=50):
    cdef dict refined_clusters = {}
    cdef int cluster_id
    cdef set kmers
    cdef set high_gc
    cdef set low_gc
    cdef object kmer

    for cluster_id, kmers in clusters.items():
        high_gc = set()
        low_gc = set()
        for kmer in kmers:
            if calculate_gc_content_cython(kmer) >= threshold:
                high_gc.add(kmer)
            else:
                low_gc.add(kmer)
        if high_gc:
            refined_clusters[f"{cluster_id}_high_gc_{k}"] = high_gc
        if low_gc:
            refined_clusters[f"{cluster_id}_low_gc_{k}"] = low_gc

    return refined_clusters
