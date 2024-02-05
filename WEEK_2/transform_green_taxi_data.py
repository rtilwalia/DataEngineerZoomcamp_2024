import re
if 'transformer' not in globals():
    from mage_ai.data_preparation.decorators import transformer
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test


@transformer
def transform(data, *args, **kwargs):
    #passenger_count and trip_distance should be greater than 0
    data = data.drop(data[data['passenger_count']<= 0].index)
    data = data.drop(data[data['trip_distance'] <= 0].index)

    #adding column for date
    data['lpep_pickup_date'] = data['lpep_pickup_datetime'].dt.date

    #Converts a string in Camel Case to snake_case
    def to_snake_case(name):
        s1 = re.sub('(.)([A-Z][a-z]+)', r'\1_\2', name)
        return re.sub('([a-z0-9])([A-Z])', r'\1_\2', s1).lower()

    data = data.rename(columns=to_snake_case)

    #No null values in vendor_id
    data = data[~data['vendor_id'].isnull()]

    return data


@test
def test_output(output, *args) -> None:
    """
    Template code for testing the output of the block.
    """
    assert output is not None, 'The output is undefined'
