-- Aggregate total patients and revenue by service type

SELECT 
    ServiceType,
    SUM(PatientCount) AS TotalPatients,
    SUM(Revenue) AS TotalRevenue,
    AVG(Revenue / NULLIF(PatientCount,0)) AS AvgRevenuePerPatient
FROM healthcare_data
GROUP BY ServiceType
ORDER BY TotalRevenue DESC;


-- Quarterly patient volume trend

SELECT
    Year,
    Quarter,
    ServiceType,
    SUM(PatientCount) AS QuarterlyPatients
FROM healthcare_data
GROUP BY Year, Quarter, ServiceType
ORDER BY Year, Quarter;
