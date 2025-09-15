import os, socket

greet = os.getenv("GREETING", "Hello")   # if GREETING env var not found default "Hello"
print(f"{greet} from container host: {socket.gethostname()}")
