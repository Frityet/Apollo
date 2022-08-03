#include <stdbool.h>
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include <pthread.h>
#include <curl/curl.h>

typedef uint8_t byte;

#define Array(T) struct { size_t length; T data[] }

struct DownloadRequest {
	const char 	*url;

	bool 		done;
	size_t 		size, progress;
	byte 		*data;
};
