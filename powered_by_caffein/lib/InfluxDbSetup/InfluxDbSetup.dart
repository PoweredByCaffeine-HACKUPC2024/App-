import 'package:powered_by_caffein/InfluxDbSetup/InfluxDbApiClient.dart';

class InfluxDbSetup {

  InfluxDbApiClient influxDbApiClient = InfluxDbApiClient();
  void execute() {
    //https://docs.influxdata.com/influxdb/cloud/api/v2/#operation/PostBuckets
    //Create a bucket (database)
    String bucketName = "CreatedWithDart";
    influxDbApiClient.createBucket(bucketName).then((value) => {
      if (value) {
        print("Bucket $bucketName created correctly")
      }
      else {
        print("Bucket $bucketName was not created")
      }
    });
    

    //https://docs.influxdata.com/influxdb/cloud/api/v2/#operation/createMeasurementSchema
    //Create all measurements (tables)
    
  }
}