from OpenSSL._util import ffi

print("creating callback")
ffi.callback(
	"int (*)(SSL *, unsigned char **, unsigned char *, "
	"const unsigned char *, unsigned int, void *)",
	lambda *_, **__: None
)
print("ok")
