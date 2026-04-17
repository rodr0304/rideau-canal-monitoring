# Rideau Canal Monitoring System

## Overview

This project demonstrates a real-time data pipeline built on Microsoft Azure to monitor environmental conditions of the Rideau Canal. The system simulates IoT sensor data (such as ice thickness, surface temperature, and external temperature), processes it in real time, and stores the results for analysis.

The objective of this project is to showcase how multiple Azure services can be integrated to handle streaming data, from ingestion to processing and storage.

---

## Architecture

The solution follows a simple event-driven architecture:

IoT Device → IoT Hub → Stream Analytics → Cosmos DB

- IoT Hub receives telemetry data from simulated devices  
- Stream Analytics processes and transforms the incoming data stream  
- Cosmos DB stores the processed data as JSON documents  
- Additional services such as Blob Storage or dashboards can be integrated for extended functionality  

An architecture diagram is available in the `/architecture` folder.

---

## Technologies Used

- Azure IoT Hub  
- Azure Stream Analytics  
- Azure Cosmos DB (NoSQL API)  
- Azure Blob Storage (optional)  
- Azure Static Web Apps (optional)  
- Azure Portal  

---

## Data Flow

1. A simulated IoT device sends telemetry data (location, ice thickness, temperature, etc.)  
2. The data is ingested by Azure IoT Hub  
3. Stream Analytics reads the incoming stream and applies a query to filter and structure the data  
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

This query extracts the relevant telemetry fields and adds a processing timestamp before sending the data to the output destination.

---

## Results

The system successfully processes streaming data in real time. New records are continuously inserted into Cosmos DB with the expected structure:

- location  
- iceThickness  
- surfaceTemp  
- snowAccumulation  
- externalTemp  
- processedTime  

This confirms that the data pipeline is functioning correctly from ingestion to storage.

---

## Screenshots

The `/screenshots` folder includes visual evidence of each step in the system:

- IoT devices configured in IoT Hub  
- Telemetry metrics being generated  
- Stream Analytics query and running job  
- Data stored in Cosmos DB  
- Blob Storage configuration (optional)  
- Dashboard visualization (optional)  

---

## Conclusion

This project demonstrates how Azure services can be combined to build a scalable, real-time data processing pipeline. Even with a relatively simple setup, it highlights important concepts such as event ingestion, stream processing, and NoSQL data storage.

It also shows how cloud-native tools can be used to quickly build and validate an end-to-end IoT solution.

---

## Author

Diniz Martins
