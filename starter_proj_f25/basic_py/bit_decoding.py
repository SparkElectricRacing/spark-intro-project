# here, you will decode a message
# you get a string of hexadecimals that represent feedback from many sensors
# each hexadecimal character represents 4 bits (1/2 byte)
# each sensor has 1 byte of data representing a number from 0 to 255
# the message is 16 bytes long
# return a list of the 16 sensor readings as integers

bit_string = "ABCDEF0123456789"

def main():
    test_decode()

def decode(s: str) -> list[int]:
    #code here
    pass

def test_decode():
    readings = decode(bit_string)
    assert readings == [171, 205, 239, 1, 35, 69, 103, 137]
    print("All tests passed!")