# Rideau Canal Monitoring System

## Overview

This project demonstrates a real-time data pipeline built on Microsoft Azure to monitor environmental conditions of the Rideau Canal. The system simulates sensor data (such as ice thickness and temperature), processes it in real time, and stores the results for analysis.

The goal of this project is to show how different Azure services can be integrated to handle streaming data from ingestion to storage and visualization.

---

## Architecture

The solution follows a simple streaming architecture:

IoT Device → IoT Hub → Stream Analytics → Cosmos DB

- IoT Hub receives telemetry data from simulated devices  
- Stream Analytics processes and transforms the incoming data  
- Cosmos DB stores the processed data in JSON format  
- Additional outputs like Blob Storage or dashboards can be added if needed  

An architecture diagram is available in the `/architecture` folder.

---

## Technologies Used

- Azure IoT Hub  
- Azure Stream Analytics  
- Azure Cosmos DB (NoSQL API)  
- Azure Storage (optional)  
- Azure Portal  

---

## Data Flow

1. A simulated IoT device sends telemetry data (location, ice thickness, temperature, etc.)  
2. The data is ingested by Azure IoT Hub  
3. Stream Analytics reads the stream and applies a query to extract relevant fields  
4. The processed data is sent to Cosmos DB  
5. Data is stored as JSON documents and can be queried in real time  

---

## Stream Analytics Query

```sql
SELECT
    location,
    iceThickness,
    surfaceTemp,
    snowAccumulation,
    externalTemp,
    System.Timestamp AS processedTime
INTO
    output
FROM
    [iot-input]
```

This query selects key telemetry fields and adds a processing timestamp before sending the data to the output.

---

## Results

The system successfully processes streaming data in real time. Multiple records are continuously inserted into Cosmos DB with the expected structure:

- location  
- iceThickness  
- surfaceTemp  
- snowAccumulation  
- externalTemp  
- processedTime  

This confirms that the pipeline is functioning correctly from ingestion to storage.

---

## Conclusion

This project demonstrates how Azure services can be combined to build a scalable and real-time data processing pipeline. Even with a simple setup, it highlights key concepts such as stream processing, event ingestion, and NoSQL data storage.

---

## Author

Diniz Martins  
