DECLARE @mainCode NVARCHAR(50) = '2101000004'; -- اینجا کد اصلی مدنظر را قرار دهید  
DECLARE @formulaName NVARCHAR(50) = 'V14+2'; -- اینجا نام فرمول مدنظر را قرار دهید  

WITH FormulaDetails AS (  
    SELECT   
        p1.Code AS mainCode,   
        p1.Name AS mainName,  
        pdf.Name AS formulaName,  
        p2.Code AS mavad_code,  
        p2.Name AS mavad_name,  
        pdfi.Quantity  
    FROM   
        lgs3.PartDetail pd   
        JOIN lgs3.Part p1 ON p1.PartID = pd.PartRef  
        JOIN lgs3.PartDetailFormula pdf ON pdf.PartDetailRef = pd.PartDetailID  
        JOIN lgs3.PartDetailFormulaItem pdfi ON pdfi.PartDetailFormulaRef = pdf.PartDetailFormulaID  
        JOIN lgs3.Part p2 ON p2.PartID = pdfi.PartRef  
    WHERE   
        p1.Code = @mainCode  
)  

SELECT   
    f1.mavad_name,   
    f1.Quantity,  
    f2.formulaName AS similarFormulaName  
FROM   
    FormulaDetails f1  
JOIN   
    FormulaDetails f2 ON f1.mavad_name = f2.mavad_name   
                        AND f1.Quantity = f2.Quantity   
                        AND f1.formulaName <> f2.formulaName  
ORDER BY   
    f1.mavad_name;DECLARE @mainCode NVARCHAR(50) = '2101000004'; -- اینجا کد اصلی مدنظر را قرار دهید  
DECLARE @formulaName NVARCHAR(50) = 'V14+2'; -- اینجا نام فرمول مدنظر را قرار دهید  

WITH FormulaDetails AS (  
    SELECT   
        p1.Code AS mainCode,   
        p1.Name AS mainName,  
        pdf.Name AS formulaName,  
        p2.Code AS mavad_code,  
        p2.Name AS mavad_name,  
        pdfi.Quantity  
    FROM   
        lgs3.PartDetail pd   
        JOIN lgs3.Part p1 ON p1.PartID = pd.PartRef  
        JOIN lgs3.PartDetailFormula pdf ON pdf.PartDetailRef = pd.PartDetailID  
        JOIN lgs3.PartDetailFormulaItem pdfi ON pdfi.PartDetailFormulaRef = pdf.PartDetailFormulaID  
        JOIN lgs3.Part p2 ON p2.PartID = pdfi.PartRef  
    WHERE   
        p1.Code = @mainCode  
)  

SELECT   
    f1.mavad_name,   
    f1.Quantity,  
    f2.formulaName AS similarFormulaName  
FROM   
    FormulaDetails f1  
JOIN   
    FormulaDetails f2 ON f1.mavad_name = f2.mavad_name   
                        AND f1.Quantity = f2.Quantity   
                        AND f1.formulaName <> f2.formulaName  
ORDER BY   
    f1.mavad_name;
Repetitive BOPM_finding.txt
Displaying Repetitive BOPM_finding.txt.
