WITH AggregatedData AS
(
    SELECT
        location,
        AVG(iceThickness) AS avgIceThickness,
        MIN(iceThickness) AS minIceThickness,
        MAX(iceThickness) AS maxIceThickness,
        AVG(surfaceTemp) AS avgSurfaceTemp,
        MIN(surfaceTemp) AS minSurfaceTemp,
        MAX(surfaceTemp) AS maxSurfaceTemp,
        MAX(snowAccumulation) AS maxSnowAccumulation,
        AVG(externalTemp) AS avgExternalTemp,
        COUNT(*) AS readingCount,
        System.Timestamp() AS processedTime
    FROM [iot-input]
    GROUP BY
        location,
        TumblingWindow(minute, 5)
)

SELECT
    location,
    avgIceThickness,
    minIceThickness,
    maxIceThickness,
    avgSurfaceTemp,
    minSurfaceTemp,
    maxSurfaceTemp,
    maxSnowAccumulation,
    avgExternalTemp,
    readingCount,
    processedTime,
    CASE
        WHEN avgIceThickness >= 30 AND avgSurfaceTemp <= -2 THEN 'Safe'
        WHEN avgIceThickness >= 25 AND avgSurfaceTemp <= 0 THEN 'Caution'
        ELSE 'Unsafe'
    END AS safetyStatus
INTO [blob-output]
FROM AggregatedData
