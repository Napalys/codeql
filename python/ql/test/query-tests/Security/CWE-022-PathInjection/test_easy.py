from fastapi import FastAPI

app = FastAPI()

class FileHandler:
    def get_data(self, filepath: str):
        with open(filepath, "r") as f:
            return f.readline()

file_handler = None

def init_file_handler():
    global file_handler
    file_handler = FileHandler()

@app.get("/file/")
async def read_item(path: str):
    if file_handler is None:
        init_file_handler()
    return file_handler.get_data(path)
