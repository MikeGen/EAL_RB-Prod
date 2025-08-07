# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Microsoft SQL Server Database Project for Emerge Aotearoa's Elite Recordbase system (EAL_RB-Prod). The project uses Microsoft.Build.Sql SDK for managing database schema and deployments.

## Build and Deployment Commands

```bash
# Build the SQL project
dotnet build

# Create a DACPAC file for deployment
dotnet build /p:Configuration=Release

# Deploy to target database (requires connection string)
sqlpackage /Action:Publish /SourceFile:bin/Release/DatabaseProjectRecordbase_EmergeAotearoa_Elite.dacpac /TargetConnectionString:"Server=<server>;Database=<database>;User Id=<user>;Password=<password>"
```

## Database Architecture

### Schema Organization

The database is organized into multiple schemas for different functional areas:

- **dl** - Data Lake schema containing core dimension and fact tables following data warehouse patterns
- **pbi** - Power BI specific views and tables optimized for reporting
- **emp** - Employment module tables and procedures
- **incident** - Incident management tables
- **elite** - Elite system specific functions and tables
- **extract** - ETL configuration and history tracking
- **stage** - Staging tables for data loading
- **transform** - Transformation procedures
- **ot/ott** - Outcome Tool and test views
- **pvt** - Pivot tables for custom field data
- **sf** - Snapshot and anonymized views
- **dataset** - Dataset specific tables
- **dropdown** - Lookup/dropdown value tables
- **legacy** - Legacy system compatibility tables
- **migrations** - Database migration tracking

### Core Data Model

The system follows a dimensional model with:

**Key Dimension Tables (dl schema):**
- DimPerson - Core person/client records
- DimTeam - Organizational teams
- DimUser - System users
- DimReferral* - Various referral-related dimensions
- DimActivity* - Activity classification and types
- DimLookup* - Various lookup/reference tables

**Key Fact Tables (dl schema):**
- FactReferral - Referral transactions
- FactActivity - Activity records
- FactPerson* - Various person-related facts
- FactIncident - Incident records
- FactEmploymentPlan - Employment planning data

### Security Model

The database implements role-based security with predefined roles:
- EALDataReader - Read-only access
- WildBamboo - External integration access
- ThetaDev - Development access
- Various service accounts for Power BI and Synapse integration

### Key Design Patterns

1. **Temporal Tracking**: Status history tables (e.g., FactReferralStatus, FactPersonStatus) track changes over time
2. **Custom Fields**: Pivot tables in pvt schema handle dynamic custom field data
3. **Multi-tenancy**: Team-based data isolation with TeamID references
4. **Soft Deletes**: Most tables preserve historical data rather than hard deleting
5. **Audit Trail**: CreatedUserID/CreatedDate and audit tables track data changes

## Development Guidelines

### When modifying tables:
- Maintain foreign key relationships to dimension tables
- Include CreatedUserID and CreatedDate for new fact tables
- Use NVARCHAR for text fields to support Unicode
- Follow existing naming conventions (Dim* for dimensions, Fact* for facts)

### When creating views:
- Place Power BI specific views in pbi schema
- Use vw_ prefix for view names
- Include necessary joins to dimension tables for reporting

### When working with stored procedures:
- Place ETL procedures in transform schema
- Employment-specific procedures go in emp schema
- Include error handling and transaction management

## Common Tasks

### Adding a new dimension table:
1. Create table in dl schema following DimTableName convention
2. Include ID column as primary key
3. Add necessary indexes for performance
4. Update related fact tables with foreign key reference

### Adding a new fact table:
1. Create table in dl schema following FactTableName convention
2. Include foreign keys to relevant dimension tables
3. Add CreatedUserID and CreatedDate columns
4. Create appropriate indexes for common query patterns

### Creating a Power BI view:
1. Create view in pbi schema with vw_ prefix
2. Join necessary dimension and fact tables
3. Include calculated fields as needed
4. Test performance with expected data volumes