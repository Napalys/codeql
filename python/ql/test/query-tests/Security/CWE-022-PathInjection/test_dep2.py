from fastapi import FastAPI, Depends

app = FastAPI()

class DataSource:
    def get_data(self, filepath: str):
        with open(filepath, "r") as f:
            return f.readline()

def init_file_handler():
    return DataSource()

@app.get("/file/", dependencies=[Depends(init_file_handler)])
async def read_item(path: str, file_handler: DataSource = Depends()):
    return file_handler.get_data(path)
