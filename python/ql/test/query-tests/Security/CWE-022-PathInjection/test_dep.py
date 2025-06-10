from fastapi import FastAPI, Depends

app = FastAPI()

class DataSource:
    def get_data(self, filepath: str):
        with open(filepath, "r") as f:
            return f.readline()

file_handler=None

def init_file_handler():
    global file_handler
    file_handler = DataSource()

@app.get("/file/", dependencies=[Depends(init_file_handler)])
async def read_item(path: str):
    return file_handler.get_data(path)
