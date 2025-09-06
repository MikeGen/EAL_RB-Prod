# Incident and Hazard Data Tables Documentation

This document provides a comprehensive reference of all incident, hazard, and risk-related tables in the EAL RecordBase database system. Use this for cross-referencing with ODS to ensure all required tables and columns are present.

## Table of Contents
- [Incident Fact Tables](#incident-fact-tables)
- [Incident Dimension Tables](#incident-dimension-tables)
- [Risk/Hazard Tables](#riskhazard-tables)
- [Specialized Incident Tables](#specialized-incident-tables)
- [Incident Views](#incident-views)

---

## Incident Fact Tables

### dl.FactIncident
**Primary Key:** IncidentID

| Column Name | Data Type | Nullable | Description |
|------------|-----------|----------|-------------|
| IncidentID | INT | NOT NULL | Primary identifier for incident |
| IncidentDate | DATETIME | NOT NULL | Date/time of incident occurrence |
| IncidentTitle | NVARCHAR(500) | NULL | Title/summary of incident |
| IncidentDescriptionRaw | NVARCHAR(MAX) | NULL | Raw text description |
| IncidentDescriptionHtml | NVARCHAR(MAX) | NULL | HTML formatted description |
| IncidentLocation | NVARCHAR(MAX) | NULL | Location where incident occurred |
| IncidentImmediateActionTakenRaw | NVARCHAR(MAX) | NULL | Raw text of immediate actions |
| IncidentImmediateActionTakenHtml | NVARCHAR(MAX) | NULL | HTML formatted immediate actions |
| IncidentPossiblePreventionRaw | NVARCHAR(MAX) | NULL | Raw text of prevention measures |
| IncidentPossiblePreventionHtml | NVARCHAR(MAX) | NULL | HTML formatted prevention measures |
| IncidentFurtherActionRequiredRaw | NVARCHAR(MAX) | NULL | Raw text of required actions |
| IncidentFurtherActionRequiredHtml | NVARCHAR(MAX) | NULL | HTML formatted required actions |
| IncidentInvestigationDetailsRaw | NVARCHAR(MAX) | NULL | Raw investigation details |
| IncidentInvestigationDetailsHtml | NVARCHAR(MAX) | NULL | HTML formatted investigation details |
| CurrentOwnerUserID | INT | NULL | Current owner of incident |
| CurrentInvestigatorUserID | INT | NULL | Assigned investigator |
| CurrentReporterUserID | INT | NULL | Person who reported incident |
| IncidentIsPublish | BIT | NULL | Publication status flag |
| IncidentPublishedDate | DATETIME | NULL | Date incident was published |
| AreaID | INT | NULL | Area/location identifier |
| IncidentCreatedDate | DATETIME | NOT NULL | Record creation date |
| IncidentCreatedUserID | INT | NOT NULL | User who created record |
| CurrentIncidentStatusTypeID | INT | NULL | Current status of incident |
| IncidentOutcomeDetailsRaw | NVARCHAR(MAX) | NULL | Raw outcome details |
| IncidentOutcomeDetailsHtml | NVARCHAR(MAX) | NULL | HTML formatted outcome details |
| TeamID | INT | NULL | Team responsible for incident |
| CurrentSuspensionID | INT | NULL | Current suspension record |
| IncidentReportedByName | NVARCHAR(100) | NULL | Name of reporter |
| CompanyId | INT | NOT NULL | Company identifier |

### dl.FactIncidentAssessment
**Primary Key:** IncidentAssessmentID

| Column Name | Data Type | Nullable | Description |
|------------|-----------|----------|-------------|
| IncidentAssessmentID | INT | NOT NULL | Primary identifier |
| IncidentID | INT | NOT NULL | Related incident |
| IncidentSeverityID | INT | NOT NULL | Severity rating |
| IncidentLikelihoodID | INT | NOT NULL | Likelihood rating |
| IncidentAssessmentRawComments | NVARCHAR(MAX) | NULL | Raw assessment comments |
| IncidentAssessmentHtmlComments | NVARCHAR(MAX) | NULL | HTML formatted comments |
| IncidentAssessmentCreatedUserID | INT | NOT NULL | User who created assessment |
| IncidentAssessmentCreatedDate | DATETIME | NOT NULL | Assessment date |

### dl.FactIncidentPerson
**Primary Key:** IncidentPersonID

| Column Name | Data Type | Nullable | Description |
|------------|-----------|----------|-------------|
| IncidentPersonID | INT | NOT NULL | Primary identifier |
| IncidentID | INT | NOT NULL | Related incident |
| IncidentPersonEntityType | NVARCHAR(50) | NOT NULL | Type of entity (Person, Staff, etc.) |
| EntityID | INT | NOT NULL | ID of related entity |
| IncidentPersonRole | NVARCHAR(150) | NULL | Role in incident |
| IncidentPersonIsComplainant | BIT | NULL | Complainant flag |
| IncidentPersonRawComments | NVARCHAR(MAX) | NULL | Raw comments |
| IncidentPersonHtmlComments | NVARCHAR(MAX) | NULL | HTML formatted comments |
| IncidentPersonCreatedUserID | INT | NOT NULL | User who created record |
| IncidentPersonCreatedDate | DATETIME | NOT NULL | Record creation date |
| RoleId | INT | NULL | Role identifier |

### dl.FactIncidentCategory
**Primary Key:** IncidentCategoryID

| Column Name | Data Type | Nullable | Description |
|------------|-----------|----------|-------------|
| IncidentCategoryID | INT | NOT NULL | Primary identifier |
| IncidentID | INT | NOT NULL | Related incident |
| IncidentCategoryTypeID | INT | NULL | Category type |
| IncidentCategoryCreatedUserID | INT | NOT NULL | User who created record |
| IncidentCategoryCreatedDate | DATETIME | NOT NULL | Record creation date |

### dl.FactIncidentOwner
**Primary Key:** IncidentOwnerID

| Column Name | Data Type | Nullable | Description |
|------------|-----------|----------|-------------|
| IncidentOwnerID | INT | NOT NULL | Primary identifier |
| IncidentOwnerOwnerType | CHAR(1) | NULL | Owner type code |
| UserID | INT | NOT NULL | User assigned as owner |
| IncidentOwnerRawComments | NVARCHAR(MAX) | NULL | Raw comments |
| IncidentOwnerHtmlComments | NVARCHAR(MAX) | NULL | HTML formatted comments |
| IncidentID | INT | NOT NULL | Related incident |
| IncidentOwnerCreatedDate | DATETIME | NOT NULL | Record creation date |
| IncidentOwnerCreatedUserID | INT | NOT NULL | User who created record |
| IncidentOwnerOwnerName | NVARCHAR(100) | NULL | Name of owner |

### dl.FactIncidentCollaborator
**Primary Key:** IncidentCollaboratorID

| Column Name | Data Type | Nullable | Description |
|------------|-----------|----------|-------------|
| IncidentCollaboratorID | INT | NOT NULL | Primary identifier |
| IncidentID | INT | NOT NULL | Related incident |
| UserID | INT | NOT NULL | Collaborator user |
| IncidentCollaboratorStartDate | DATETIME | NOT NULL | Start date of collaboration |
| IncidentCollaboratorEndDate | DATETIME | NULL | End date of collaboration |
| IncidentCollaboratorRole | NVARCHAR(150) | NULL | Role in collaboration |
| IncidentCollaboratorCanAddNotes | BIT | NOT NULL | Permission to add notes |
| IncidentCollaboratorCanAddAttachments | BIT | NOT NULL | Permission to add attachments |
| IncidentCollaboratorInactiveReason | NVARCHAR(MAX) | NULL | Reason for inactivation |
| IncidentCollaboratorComments | NVARCHAR(MAX) | NULL | Comments |
| IncidentCollaboratorCreatedUserID | INT | NOT NULL | User who created record |
| IncidentCollaboratorCreatedDate | DATETIME | NOT NULL | Record creation date |

### dl.FactIncidentContact
**Primary Key:** IncidentContactID

| Column Name | Data Type | Nullable | Description |
|------------|-----------|----------|-------------|
| IncidentContactID | INT | NOT NULL | Primary identifier |
| IncidentID | INT | NOT NULL | Related incident |
| IncidentContactName | VARCHAR(100) | NULL | Contact name |
| IncidentContactRole | VARCHAR(100) | NULL | Contact role |
| IncidentContactContactDetails | VARCHAR(100) | NULL | Contact details |
| IncidentContactCreatedDate | DATETIME | NOT NULL | Record creation date |
| IncidentContactCreatedUserID | INT | NOT NULL | User who created record |
| IncidentContactRawComments | NVARCHAR(MAX) | NULL | Raw comments |
| IncidentContactHtmlComments | NVARCHAR(MAX) | NULL | HTML formatted comments |
| RoleId | INT | NULL | Role identifier |

### dl.FactIncidentSuspension
**Primary Key:** IncidentSuspensionID

| Column Name | Data Type | Nullable | Description |
|------------|-----------|----------|-------------|
| IncidentSuspensionID | INT | NOT NULL | Primary identifier |
| IncidentSuspensionReasonTypeID | INT | NULL | Reason for suspension |
| IncidentSuspensionComments | NVARCHAR(MAX) | NULL | Suspension comments |
| IncidentSuspensionResumedDate | DATETIME | NULL | Date resumed |
| ResumedUserID | INT | NULL | User who resumed |
| IncidentID | INT | NOT NULL | Related incident |
| IncidentSuspensionCreatedDate | DATETIME | NOT NULL | Record creation date |
| IncidentSuspensionCreatedUserID | INT | NOT NULL | User who created record |

### dl.FactIncidentNotification
**Primary Key:** IncidentNotificationID

| Column Name | Data Type | Nullable | Description |
|------------|-----------|----------|-------------|
| IncidentNotificationID | INT | NOT NULL | Primary identifier |
| IncidentID | INT | NOT NULL | Related incident |
| IncidentNotificationNotificationDate | DATETIME | NULL | Date of notification |
| IncidentNotificationRecipientTypeID | INT | NOT NULL | Type of recipient |
| IncidentNotificationName | VARCHAR(MAX) | NULL | Notification recipient name |
| IncidentNotificationRawComments | NVARCHAR(MAX) | NULL | Raw comments |
| IncidentNotificationHtmlComments | NVARCHAR(MAX) | NULL | HTML formatted comments |
| IncidentNotificationCreatedDate | DATETIME | NOT NULL | Record creation date |
| IncidentNotificationCreatedUserID | INT | NOT NULL | User who created record |

### dl.FactIncidentStatus
**Primary Key:** IncidentStatusID

| Column Name | Data Type | Nullable | Description |
|------------|-----------|----------|-------------|
| IncidentStatusID | INT | NOT NULL | Primary identifier |
| IncidentID | INT | NOT NULL | Related incident |
| IncidentStatusTypeID | INT | NOT NULL | Status type |
| IncidentStatusCreatedUserID | INT | NOT NULL | User who created record |
| IncidentStatusCreatedDate | DATETIME | NOT NULL | Record creation date |
| IncidentStatusRawComment | NVARCHAR(MAX) | NULL | Raw status comment |
| IncidentStatusHtmlComment | NVARCHAR(MAX) | NULL | HTML formatted comment |
| IncidentStatusEndDate | DATETIME | NULL | Status end date |

---

## Incident Dimension Tables

### dl.DimIncidentSeverity
**Primary Key:** IncidentSeverityID

| Column Name | Data Type | Nullable | Description |
|------------|-----------|----------|-------------|
| IncidentSeverityID | INT | NOT NULL | Primary identifier |
| IncidentSeverityValue | NVARCHAR(200) | NOT NULL | Severity value |
| IncidentSeverityText | NVARCHAR(200) | NOT NULL | Severity description |
| IncidentSeverityParentId | INT | NULL | Parent severity ID |
| IncidentSeverityIsActive | BIT | NOT NULL | Active flag |

### dl.DimIncidentLikelihood
**Primary Key:** IncidentLikelihoodID

| Column Name | Data Type | Nullable | Description |
|------------|-----------|----------|-------------|
| IncidentLikelihoodID | INT | NOT NULL | Primary identifier |
| IncidentLikelihoodValue | NVARCHAR(200) | NOT NULL | Likelihood value |
| IncidentLikelihoodText | NVARCHAR(200) | NOT NULL | Likelihood description |
| IncidentLikelihoodParentId | INT | NULL | Parent likelihood ID |
| IncidentLikelihoodIsActive | BIT | NOT NULL | Active flag |

### dl.DimIncidentRiskType
**Primary Key:** IncidentRiskTypeID

| Column Name | Data Type | Nullable | Description |
|------------|-----------|----------|-------------|
| IncidentRiskTypeID | INT | NOT NULL | Primary identifier |
| IncidentRiskTypeName | NVARCHAR(40) | NOT NULL | Risk type name |
| IncidentRiskTypeCode | INT | NOT NULL | Risk type code |
| IncidentRiskTypeAction | NVARCHAR(4000) | NULL | Recommended action |

### dl.DimIncidentRiskSetting
**Primary Key:** IncidentRiskSettingID

| Column Name | Data Type | Nullable | Description |
|------------|-----------|----------|-------------|
| IncidentRiskSettingID | INT | NOT NULL | Primary identifier |
| IncidentRiskSettingSeverityValue | INT | NOT NULL | Severity value |
| IncidentRiskSettingLikelihoodValue | INT | NOT NULL | Likelihood value |
| IncidentRiskTypeID | INT | NOT NULL | Related risk type |

### dl.DimIncidentCategoryType
**Primary Key:** IncidentCategoryTypeID

| Column Name | Data Type | Nullable | Description |
|------------|-----------|----------|-------------|
| IncidentCategoryTypeID | INT | NOT NULL | Primary identifier |
| IncidentCategoryTypeValue | NVARCHAR(200) | NOT NULL | Category value |
| IncidentCategoryTypeText | NVARCHAR(200) | NOT NULL | Category description |
| IncidentCategoryTypeParentId | INT | NULL | Parent category ID |
| IncidentCategoryTypeIsActive | BIT | NOT NULL | Active flag |

### dl.DimIncidentStatusType
**Primary Key:** IncidentStatusTypeID

| Column Name | Data Type | Nullable | Description |
|------------|-----------|----------|-------------|
| IncidentStatusTypeID | INT | NOT NULL | Primary identifier |
| IncidentStatusTypeCode | NVARCHAR(30) | NULL | Status code |
| IncidentStatusTypeText | NVARCHAR(100) | NULL | Status text |
| IncidentStatusTypeDescription | NVARCHAR(500) | NULL | Status description |
| IncidentStatusTypeGroup | NVARCHAR(100) | NULL | Status group |

### dl.DimIncidentRole
**Primary Key:** IncidentRoleID

| Column Name | Data Type | Nullable | Description |
|------------|-----------|----------|-------------|
| IncidentRoleID | INT | NOT NULL | Primary identifier |
| IncidentRoleValue | NVARCHAR(200) | NOT NULL | Role value |
| IncidentRoleText | NVARCHAR(200) | NOT NULL | Role description |
| IncidentRoleParentId | INT | NULL | Parent role ID |
| IncidentRoleIsActive | BIT | NOT NULL | Active flag |

### dl.DimIncidentSuspensionReasonType
**Primary Key:** IncidentSuspensionReasonTypeID

| Column Name | Data Type | Nullable | Description |
|------------|-----------|----------|-------------|
| IncidentSuspensionReasonTypeID | INT | NOT NULL | Primary identifier |
| IncidentSuspensionReasonTypeValue | NVARCHAR(200) | NOT NULL | Reason value |
| IncidentSuspensionReasonTypeText | NVARCHAR(200) | NOT NULL | Reason description |
| IncidentSuspensionReasonTypeParentId | INT | NULL | Parent reason ID |
| IncidentSuspensionReasonTypeIsActive | BIT | NOT NULL | Active flag |

### dl.DimIncidentNotificationRecipientType
**Primary Key:** IncidentNotificationRecipientTypeID

| Column Name | Data Type | Nullable | Description |
|------------|-----------|----------|-------------|
| IncidentNotificationRecipientTypeID | INT | NOT NULL | Primary identifier |
| IncidentNotificationRecipientTypeValue | NVARCHAR(200) | NOT NULL | Recipient type value |
| IncidentNotificationRecipientTypeText | NVARCHAR(200) | NOT NULL | Recipient type description |
| IncidentNotificationRecipientTypeParentId | INT | NULL | Parent type ID |
| IncidentNotificationRecipientTypeIsActive | BIT | NOT NULL | Active flag |

---

## Risk/Hazard Tables

### dl.FactPersonRisk
**Primary Key:** PersonRiskID

| Column Name | Data Type | Nullable | Description |
|------------|-----------|----------|-------------|
| PersonRiskID | INT | NOT NULL | Primary identifier |
| PersonID | INT | NOT NULL | Related person |
| RiskTypeID | INT | NOT NULL | Type of risk |
| PersonRiskDescription | NVARCHAR(250) | NOT NULL | Risk description |
| PersonRiskRawEarlySigns | NVARCHAR(MAX) | NULL | Raw early warning signs |
| PersonRiskHTMLEarlySigns | NVARCHAR(MAX) | NULL | HTML formatted early signs |
| PersonRiskRawStrategy | NVARCHAR(MAX) | NULL | Raw mitigation strategy |
| PersonRiskHTMLStrategy | NVARCHAR(MAX) | NULL | HTML formatted strategy |
| PersonRiskRawComments | NVARCHAR(MAX) | NULL | Raw comments |
| PersonRiskHTMLComments | NVARCHAR(MAX) | NULL | HTML formatted comments |
| PersonRiskReviewDate | DATETIME | NULL | Next review date |
| HistoricalID | INT | NULL | Historical record reference |
| PersonRiskCreatedDate | DATETIME | NOT NULL | Record creation date |
| PersonRiskCreatedUserID | INT | NOT NULL | User who created record |
| PersonRiskAlertFlag | BIT | NOT NULL | Alert flag |
| PersonRiskHistoricDate | DATETIME2(7) | NULL | Historical date |
| PersonRiskReviewDateOffset | DATETIMEOFFSET(7) | NULL | Review date with timezone |

### dl.FactPersonRiskHistory
**Primary Key:** PersonRiskHistoryID

| Column Name | Data Type | Nullable | Description |
|------------|-----------|----------|-------------|
| PersonRiskHistoryID | INT | NOT NULL | Primary identifier |
| RiskId | INT | NOT NULL | Related risk record |
| RiskTypeId | INT | NOT NULL | Type of risk |
| PersonRiskHistoryDescription | NVARCHAR(250) | NOT NULL | Risk description |
| PersonRiskHistoryRawEarlySigns | NVARCHAR(MAX) | NULL | Raw early warning signs |
| PersonRiskHistoryHTMLEarlySigns | NVARCHAR(MAX) | NULL | HTML formatted early signs |
| PersonRiskHistoryRawStrategy | NVARCHAR(MAX) | NULL | Raw mitigation strategy |
| PersonRiskHistoryHTMLStrategy | NVARCHAR(MAX) | NULL | HTML formatted strategy |
| PersonRiskHistoryRawComments | NVARCHAR(MAX) | NULL | Raw comments |
| PersonRiskHistoryHTMLComments | NVARCHAR(MAX) | NULL | HTML formatted comments |
| PersonRiskHistoryNextReviewDate | DATETIME | NULL | Next review date |
| PersonRiskHistoryAlertFlag | BIT | NOT NULL | Alert flag |
| PersonRiskHistoryReviewedOnDate | DATETIME2(7) | NOT NULL | Review date |
| ReviewedByUserId | INT | NOT NULL | Reviewing user |
| PersonRiskHistoryReviewComments | NVARCHAR(MAX) | NULL | Review comments |
| PersonRiskHistoryNextReviewDateOffset | DATETIMEOFFSET(7) | NULL | Next review date with timezone |
| PersonRiskHistoryReviewedOnDateOffset | DATETIMEOFFSET(7) | NULL | Review date with timezone |

### dl.DimRiskType
**Primary Key:** RiskTypeID

| Column Name | Data Type | Nullable | Description |
|------------|-----------|----------|-------------|
| RiskTypeID | INT | NOT NULL | Primary identifier |
| RiskTypeValue | NVARCHAR(200) | NOT NULL | Risk type value |
| RiskTypeText | NVARCHAR(200) | NOT NULL | Risk type description |
| RiskTypeParentId | INT | NULL | Parent risk type ID |
| RiskTypeIsActive | BIT | NOT NULL | Active flag |

---

## Specialized Incident Tables

### incident.FactIncidentStatistics
**No explicit primary key defined**

| Column Name | Data Type | Nullable | Description |
|------------|-----------|----------|-------------|
| IncidentID | INT | NOT NULL | Related incident |
| IncidentTypeID | INT | NULL | Type of incident |
| IncidentDate | DATETIME | NOT NULL | Date of incident |
| TeamID | INT | NULL | Related team |
| AreaID | INT | NULL | Related area |
| IncidentLikelihoodID | INT | NULL | Likelihood rating |
| IncidentSeverityID | INT | NULL | Severity rating |
| PendingDate | DATETIME | NULL | Date marked pending |
| AssignedToInvestigatorDate | DATETIME | NULL | Investigation assignment date |
| AssignedToReporterDate | DATETIME | NULL | Reporter assignment date |
| CompletedDate | DATETIME | NULL | Completion date |
| InvestigationDate | DATETIME | NULL | Investigation date |
| ReviewDate | DATETIME | NULL | Review date |
| CurrentIncidentStatusTypeID | INT | NULL | Current status |
| OriginatorUserID | INT | NOT NULL | User who originated |
| InvestigatorUserID | INT | NULL | Assigned investigator |
| ReporterUserID | INT | NULL | Reporter user |
| RiskTypeID | INT | NULL | Associated risk type |
| CompanyId | INT | NOT NULL | Company identifier |

---

## Incident Views

### pbi.vw_FactIncident
Power BI optimized view for incident reporting

| Column Name | Data Type | Description |
|------------|-----------|-------------|
| TeamID | INT | Team identifier |
| IncidentDate | DATE | Date of incident (date only) |
| IncidentCount | INT | Count of distinct incidents |

*Note: This view aggregates incident data by team and date for reporting purposes.*

### pbi.vw_PA_ClientRiskScores
Predictive Analytics view for client risk assessment

| Key Output Columns | Data Type | Description |
|------------|-----------|-------------|
| PersonID | INT | Client identifier |
| ReferralID | INT | Related referral |
| TeamID | INT | Team assignment |
| TeamName | NVARCHAR | Team name |
| ClientName | NVARCHAR | Full client name |
| Age | INT | Calculated age |
| Gender | NVARCHAR | Gender description |
| DaysSinceLastActivity | INT | Days since last activity |
| AttendanceRate | DECIMAL | Attendance percentage |
| RecentActivityCount | INT | Activities in last 30 days |
| TotalIncidents | INT | Total incident count |
| RecentIncidents | INT | Incidents in last 6 months |
| DaysSinceLastIncident | INT | Days since last incident |
| HealthConditionCount | INT | Number of health conditions |
| MentalHealthConditions | INT | Mental health condition count |
| EmergencyContactCount | INT | Number of emergency contacts |
| FamilyContactCount | INT | Number of family contacts |
| RecentStatusChanges | INT | Status changes in 6 months |
| IsUnemployed | BIT | Unemployment flag |
| MonthsSinceEmployment | INT | Months since last employment |
| RiskScore | INT | Calculated risk score (0-100) |
| RiskCategory | VARCHAR | Risk category (Critical/High/Medium/Low) |
| RecommendedAction | NVARCHAR | Recommended intervention |
| AssessmentDate | DATETIME | Date of assessment |

*Note: This view calculates comprehensive risk scores based on multiple factors including incident history, engagement metrics, health complexity, and support network strength.*

---

## Data Flow and Relationships

### Key Relationships:
1. **FactIncident** is the central incident table, with relationships to:
   - All incident-related fact tables via IncidentID
   - DimTeam via TeamID
   - DimIncidentStatusType via CurrentIncidentStatusTypeID
   - DimUser via various UserID fields

2. **FactPersonRisk** links to:
   - DimPerson via PersonID
   - DimRiskType via RiskTypeID
   - FactPersonRiskHistory for historical tracking

3. **FactIncidentAssessment** links to:
   - FactIncident via IncidentID
   - DimIncidentSeverity via IncidentSeverityID
   - DimIncidentLikelihood via IncidentLikelihoodID

### Staging Tables:
All incident and risk data flows through corresponding staging tables (stage schema) before being loaded into the main fact/dimension tables:
- Stage_Incident
- Stage_IncidentAssessment
- Stage_IncidentCategory
- Stage_IncidentPerson
- Stage_IncidentStatus
- Stage_IncidentOwner
- Stage_IncidentCollaborator
- Stage_IncidentContact
- Stage_IncidentSuspension
- Stage_IncidentNotification
- Stage_IncidentRiskType
- Stage_IncidentRiskSetting
- Stage_IncidentStatusType
- Stage_PersonRisk
- Stage_PersonRiskHistory

---

## Usage Notes

1. **Temporal Tracking**: Most fact tables include CreatedDate and CreatedUserID for audit trails
2. **Soft Deletes**: Tables preserve historical data rather than hard deleting
3. **Unicode Support**: All text fields use NVARCHAR for full Unicode support
4. **HTML/Raw Dual Storage**: Many tables store both raw text and HTML formatted versions
5. **Multi-tenancy**: TeamID and CompanyId fields support data isolation
6. **Risk Assessment**: Comprehensive risk scoring combines incident, health, and engagement factors

---

## Cross-Reference Checklist

When validating against ODS, ensure the following:

✅ All fact tables listed above exist with matching column names and data types
✅ All dimension tables exist with proper hierarchical structures (ParentId fields)
✅ Primary keys match the specifications
✅ Required (NOT NULL) columns are enforced
✅ NVARCHAR(MAX) fields are properly configured for large text storage
✅ Datetime fields support appropriate precision (DATETIME vs DATETIME2)
✅ Staging tables exist for ETL processes
✅ Views are created for reporting requirements
✅ Proper indexing on primary keys and foreign key relationships