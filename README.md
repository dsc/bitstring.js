# BitString.js

A class to read and write packed binary strings, bit-by-bit.

```js
var BitString = require('bitstring');

var bits = new BitString();
bits.writebits(4)
    .writebits(255)
    .writebits(1,4)
    .writebits(8)

bits.number()       == 10478336
bits.hex()          == '9fe30'
bits.bin()          == '10011111111000110'
bits.bytearray() // == [ 159, 227, 0 ]
```


## Usage

On the server, install it:

```sh
npm install bitstring
```

And then just require it:

```js
var BitString = require('bitstring');
```

In the browser, you have a number of options. You can download this package and include `bitstring.js` somewhere, which will add itself as a global, `window.BitString`. Alternatively, if you're using something like [require.js][require_js] to wrap your modules, BitString will check for the `module` variable and properly set itself as `module.exports`.


## API

### BitString( source='', buf=[] )

Create a new BitString buffer. Optionally takes source data as a String, and/or an Array to use as the byte-buffer.

#### .size() -> Number

The size in bytes of the BitString.


#### .bitsize() -> Number

The size in bits of the BitString.


#### .writebits(n, [size]) -> this

Writes the bits `n` to the stream (bits must be supplied as a number). Supplying `n=0` will write one bit. Supplying the optional parameter `size` treats the bits as a field with the given length.


#### .flush() -> this

Flushes any pending bits to the stream.


#### .truncate() -> this

Truncates the stream to zero bits.


#### .seek(n, mode=SEEK_ABSOLUTE) -> this

Flushes the bit-buffer and moves to the given byte-offset. Mode Constants:

```js
BitString.SEEK_ABSOLUTE = 0
BitString.SEEK_RELATIVE = 1
BitString.SEEK_FROM_EOF = 2
```


#### .tell() -> Number

Returns the current position of the cursor as a *byte* offset from the start of the stream.

#### .readbits(n) -> String

Reads the next `n` bits from the stream.


#### .peek(n) -> String

Reads the next `n` bits without moving the cursor.


#### .hasMore() -> Boolean

True if there is more data to read.


#### .each(fn, cxt=this) -> this

Iterates over the bytes in the BitString.


#### .map(fn, cxt=this) -> Array

As `Array.map`, but over the bytes in the BitString.


#### .reduce(fn, acc, cxt=this)

As `Array.reduce`, but over the bytes in the BitString.


#### .bytearray() -> Array

Returns the stream as an Array of bytes.


#### .bin(byte_sep='') -> String

Dumps the stream as a binary string. Unlike `.number()`, `.bin()` will not cause int overflow.


#### .hex() -> String

Returns the stream as a hex string.


#### .number() -> Number

Returns the buffer as a number. Use this with obvious caution.


#### .dump() -> String

Dumps the stream as a string of UTF8 characters; does not flush or change cursor position.


#### .repr(dump_buf=true) -> String

String representation of the data-structure; if `dump_buf` is true, the contents of the stream will be included, but it will not flush or change cursor position.


#### .toString() -> String

Dumps the stream as a string; flushes the bit-buffer but leaves cursor position unchanged.



## License

MIT: http://dsc.mit-license.org/
