import socket
import sqlite3 as sl

HOST = '127.0.0.1'  # Standard loopback interface address (localhost)
PORT = 9090        # Port to listen on (non-privileged ports are > 1023)

db = sl.connect("users.db")

with con:
    con.execute("""
        CREATE TABLE LOGIN (
            id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENTS,
            username TEXT,
            email TEXT,
            password TEXT
        );
    """)

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.bind((HOST, PORT))
    s.listen()
    conn, addr = s.accept()
    with conn:
        print(addr, "<< Connected")
        while True:
            data = conn.recv(1024)
            if not data:
                break
        
