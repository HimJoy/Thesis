import machine
import utime

# Configure UART on Raspberry Pi Pico
uart = machine.UART(0, baudrate= 9600, tx=machine.Pin(0), rx=machine.Pin(1))


while True:
    message = "HelloWorld"
    uart.write(message)  # Send data over UART
    print("Sent:", message)
    

    utime.sleep(1)  # Wait before sending again