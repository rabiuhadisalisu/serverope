from http.server import SimpleHTTPRequestHandler, HTTPServer

class CustomHandler(SimpleHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header('Content-type', 'text/plain')
        self.end_headers()
        self.wfile.write(b"This Container Is Handling Palazzo Asset")

if __name__ == "__main__":
    server_address = ('', 80)
    httpd = HTTPServer(server_address, CustomHandler)
    print("Serving on port 80")
    httpd.serve_forever()
