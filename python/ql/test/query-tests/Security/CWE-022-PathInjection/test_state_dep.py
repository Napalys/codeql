from fastapi import FastAPI, Depends

app = FastAPI()

class DataSource:
    def get_data(self, filepath: str):
        with open(filepath, "r") as f:
            return f.readline()

@app.on_event("startup")
def init_file_handler():    
    app.state.file_handler = DataSource()

def get_data_source():
    return app.state.file_handler

@app.get("/file/")
async def read_item(path: str, data_source=Depends(get_data_source)):    
    return data_source.get_data(path)
