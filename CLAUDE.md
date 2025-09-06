# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Microsoft SQL Server Database Project for Emerge Aotearoa's Elite Recordbase system (EAL_RB-Prod). The project uses Microsoft.Build.Sql SDK (v1.0.0) for managing database schema and deployments, targeting SQL Azure V12 with a dimensional data warehouse architecture.

## Build and Deployment Commands

```bash
# Build the SQL project
dotnet build

# Create a DACPAC file for deployment
dotnet build /p:Configuration=Release

# Deploy to target database (requires connection string)
sqlpackage /Action:Publish /SourceFile:bin/Release/DatabaseProjectRecordbase_EmergeAotearoa_Elite.dacpac /TargetConnectionString:"Server=<server>;Database=<database>;User Id=<user>;Password=<password>"

# VS Code build task available: Ctrl+Shift+B
```

## Database Architecture

### Schema Organization (20+ schemas)

The database is organized into multiple schemas for different functional areas:

**Core Data Schemas:**
- **dl** - Data Lake/Warehouse containing 174 dimension tables (Dim*) and 113 fact tables (Fact*) following Kimball dimensional modeling
- **dbo** - Default schema with system functions and views

**Reporting & Analytics:**
- **pbi** - Power BI specific views (vw_* prefix) optimized for reporting
- **sf** - Snapshot and anonymized views for external reporting

**Functional Modules:**
- **emp** - Employment module with specialized fact tables (FactEmpContinuous, FactEmpEmploymentPlan, FactEmpOutcomeJobDaily)
- **incident** - Incident management tables
- **elite** - Elite system specific functions and tables
- **ot/ott** - Outcome Tool views and test views

**ETL & Processing:**
- **extract** - ETL configuration and history tracking
- **stage** - Staging tables for data loading
- **transform** - Transformation procedures and calendar dimension
- **pvt** - Pivot tables for dynamic custom field data (PersonPivot, ReferralPivot, UserPivot, etc.)

**Supporting Schemas:**
- **dataset** - Dataset specific tables
- **dropdown** - Lookup/dropdown value tables
- **legacy** - Legacy system compatibility tables
- **migrations** - Database migration tracking
- **Security** - 40+ security objects managing access control

### Core Data Model

**Key Dimension Tables (dl schema):**
- **DimPerson** - Core person/client records with 82 attributes
- **DimTeam** - Organizational teams (supports multi-tenancy)
- **DimUser** - System users
- **DimReferral*** - 30+ referral-related dimensions
- **DimActivity*** - Activity classification and types
- **DimLookup*** - Various lookup/reference tables
- **DimEthnicity** - Ethnicity reference data (supports up to 5 ethnicities per person)

**Key Fact Tables (dl schema):**
- **FactReferral** - Core referral transactions
- **FactActivity** - Activity records
- **FactPerson*** - Various person-related facts
- **FactIncident** - Incident records
- **FactEmpEmploymentPlan** - Employment planning data
- **FactEmpContinuous** - Continuous employment tracking
- **FactEmpOutcomeJobDaily** - Daily job outcome tracking

### Security Model

The database implements role-based security with predefined roles:
- **EALDataReader** - Read-only access to data
- **WildBamboo** - External integration with read/write permissions
- **ThetaDev** - Development environment access
- Service accounts for Power BI (PowerBIReportReader) and Synapse integration
- Individual user accounts with specific schema-level permissions

### Key Design Patterns

1. **Temporal Tracking**: 
   - Status history tables (e.g., FactReferralStatus, FactPersonStatus) track changes over time
   - All fact tables include CreatedUserID and CreatedDate for audit trails

2. **Custom Fields**: 
   - Pivot tables in pvt schema handle dynamic custom field data
   - Separate pivot tables per entity type
   - NVARCHAR(MAX) fields for flexible data storage

3. **Multi-tenancy**: 
   - Team-based data isolation with TeamID references throughout
   - Team configuration for data access control

4. **Soft Deletes**: 
   - Most tables preserve historical data rather than hard deleting
   - Status-based logical deletion

5. **Unicode Support**: 
   - All text fields use NVARCHAR for full Unicode support
   - Consistent string field sizing across tables

## Development Guidelines

### When modifying dimension tables:
- Follow naming convention: Dim[EntityName]
- Include ID column as INT PRIMARY KEY
- Add necessary indexes for performance
- Include audit fields where appropriate
- Maintain referential integrity

### When modifying fact tables:
- Follow naming convention: Fact[ProcessName]
- Include foreign keys to relevant dimension tables
- Always add CreatedUserID (INT) and CreatedDate (DATETIME2)
- Create appropriate indexes for common query patterns
- Consider partitioning for large tables

### When creating Power BI views:
- Place in pbi schema with vw_ prefix
- Join necessary dimension and fact tables
- Include calculated fields as needed
- Test performance with expected data volumes
- Consider indexed views for frequently accessed data

### When working with stored procedures:
- Place ETL procedures in transform schema
- Employment-specific procedures go in emp schema
- Include error handling and transaction management
- Use TRY-CATCH blocks for error handling
- Document parameters and expected behavior

### Employment Module Specifics:
- FactEmpContinuous tracks ongoing employment status
- FactEmpEmploymentPlan manages employment planning lifecycle
- FactEmpOutcomeJobDaily provides daily granularity for job outcomes
- All employment facts link to DimPerson and DimTeam

## Common Tasks

### Adding a new dimension table:
```sql
CREATE TABLE dl.Dim[EntityName] (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    [DescriptiveFields] NVARCHAR(255),
    CreatedUserID INT,
    CreatedDate DATETIME2 DEFAULT GETDATE()
);
```

### Adding a new fact table:
```sql
CREATE TABLE dl.Fact[ProcessName] (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    [DimensionKey]ID INT FOREIGN KEY REFERENCES dl.Dim[Dimension](ID),
    TeamID INT FOREIGN KEY REFERENCES dl.DimTeam(ID),
    [MeasureFields],
    CreatedUserID INT NOT NULL,
    CreatedDate DATETIME2 NOT NULL DEFAULT GETDATE()
);
```

### Creating a custom field pivot table:
```sql
CREATE TABLE pvt.[EntityName]Pivot (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    [EntityName]ID INT NOT NULL,
    CustomFieldName NVARCHAR(255) NOT NULL,
    CustomFieldValue NVARCHAR(MAX),
    CreatedDate DATETIME2 DEFAULT GETDATE()
);
```

### Performance Optimization Patterns:
- Create clustered indexes on primary keys
- Add non-clustered indexes on foreign keys
- Consider columnstore indexes for analytical queries
- Use indexed views for complex reporting queries
- Monitor query performance using execution plans

## Predictive Analytics Integration

The PredictiveAnalytics directory contains advanced analytics features including:
- Time series modeling capabilities
- Predictive models for client outcomes
- Integration points with the main database
- Separate analytics processing pipeline

When working with predictive features, ensure coordination between the main database schema and analytics models.

## Project File Structure

- **DatabaseProjectRecordbase_EmergeAotearoa_Elite/** - Main database project
  - Schema folders organized by functional area
  - Each schema contains Tables/, Views/, StoredProcedures/ subdirectories
- **PredictiveAnalytics/** - Advanced analytics components
- **.vscode/** - VS Code configuration for build tasks