import pyarrow as pa
import pyarrow.parquet as pq
import os

if 'data_exporter' not in globals():
    from mage_ai.data_preparation.decorators import data_exporter

#this will tell the pyarraow where our credentials located
os.environ['GOOGLE_APPLICATION_CREDENTIALS'] = "/home/src/credentials.json"
bucket_name = 'mage-zoomcamp-ritika-tilwalia'
object_key = 'nyc_green_taxi_data.parquet'
project_id = 'homewrok-project'

table_name = 'nyc_green_taxi_data'

#allows our variables to be defined at once
root_path = f'{bucket_name}/{table_name}'

@data_exporter
def export_data(data, *args, **kwargs):
    #creating partitions

    data['lpep_pickup_date'] = data['lpep_pickup_datetime'].dt.date #converting date to string format

    #defining the table
    table = pa.Table.from_pandas(data)

    gcs = pa.fs.GcsFileSystem()

    #letting the parquet know what our filesystem is
    pq.write_to_dataset(
        table,
        root_path = root_path,
        partition_cols=['lpep_pickup_date'],
        filesystem=gcs
    )
    

