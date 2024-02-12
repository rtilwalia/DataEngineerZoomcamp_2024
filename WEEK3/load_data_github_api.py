import io
import pandas as pd
import requests
from urllib.parse import urljoin
if 'data_loader' not in globals():
    from mage_ai.data_preparation.decorators import data_loader
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test


@data_loader
def load_data(*args, **kwargs):
    # Download URLs for 2022 Green Taxi Trip Data
    urls = []
    for month in range(1, 13):
        month = "0" + str(month) if len(str(month)) == 1 else str(month)
        url = f'https://d37ci6vzurychx.cloudfront.net/trip-data/green_tripdata_2022-{month}.parquet'
        urls.append(url)

    data_frames = []

    for url in urls:   
    #Data types and datetime columns
        taxi_dtypes = {
            'VendorID': pd.Int64Dtype(),
            'passenger_count': pd.Int64Dtype(),
            'trip_distance': float,
            'RatecodeID': pd.Int64Dtype(),
            'store_and_fwd_flag': str,
            'PULocationID': pd.Int64Dtype(),
            'DOLocationID': pd.Int64Dtype(),
            'payment_type': pd.Int64Dtype(),
            'fare_amount': float,
            'extra': float,
            'mta_tax': float,
            'tip_amount': float,
            'tolls_amount': float,
            'improvement_surcharge': float,
            'total_amount': float,
            'congestion_surcharge': float
        }

        parse_dates = ['lpep_pickup_datetime', 'lpep_dropoff_datetime']
        df = pd.read_parquet(url, engine='pyarrow') # Read the data from the current URL
        data_frames.append(df)
    # Concatenate all DataFrames in the list  
    combined_df = pd.concat(data_frames, axis=0)

    # Optionally, reset the index
    combined_df = combined_df.reset_index(drop=True)
    
    return combined_df


# @test
# def test_output(output, *args) -> None:
#     """
#     Template code for testing the output of the block.
#     """
#     assert output is not None, 'The output is undefined'
