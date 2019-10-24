import serial
import secrets

ser = serial.Serial("/dev/ttyACM1")

max_length = 4096
repeats = 100
smallest, largest = max_length, 0

for _ in range(repeats):
    length = secrets.randbelow(max_length + 1)
    if length < smallest:
        smallest = length
    if length > largest:
        largest = length
    sent_msg = bytes([secrets.randbelow(256) for _ in range(length)])
    ser.write(sent_msg)
    recv_msg = ser.read(length)

    assert recv_msg == sent_msg

print(f"Successfully looped {repeats} random msgs of length <= {max_length}")
print(f"smallest: {smallest}, largest: {largest}")
