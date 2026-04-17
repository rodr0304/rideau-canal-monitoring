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
