# Predictive Analytics for RecordBase System

## Project Overview
This document contains the analysis and implementation plan for predictive analytics capabilities in the Emerge Aotearoa Elite RecordBase client management system.

## Analysis Approach
1. Deep dive into dl schema tables to understand data model
2. Identify predictive analytics opportunities
3. Design SQL-based predictive models
4. Create views/procedures for Power BI reporting

## Database Structure Analysis

### Core Tables Analysis

#### Person/Client Management
- **DimPerson**: Central client table with demographics, employment status, education, cultural info
  - Key fields: PersonID, DateOfBirth, GenderID, EthnicityIDs, EmploymentStatusID, MaritalStatusID
  - Temporal data: DeceasedDate tracking
  - Contains 81 fields covering comprehensive client information

#### Referral System
- **FactReferral**: Tracks client referrals to services
  - Links: PersonID, TeamID, ReferrerID
  - Dates: ReceivedDate, ExpectedArrival/Departure, ActualArrival/Departure
  - Status tracking: CurrentReferralStatusTypeID
- **FactReferralStatus**: Temporal status changes for referrals
  - Enables tracking progression through service stages

#### Activity/Service Delivery
- **FactActivity**: Records all service activities/interactions
  - Temporal: StartDate, EndDate
  - Links: TeamID, ActivityTypeID, ActivityClassificationID
  - Group activities supported via GroupActivityID
- **FactActivityParticipant**: Links activities to participants (persons/entities)
  - Tracks attendance and relationships
- **DimActivityType/DimActivityClassification**: Categorizes activities

#### Geographic Hierarchy
- **DimRegion**: Top-level geographic regions
- **DimArea**: Sub-regions within regions
- **DimDistrict**: District-level geographic data
- **FactAddress**: Client addresses with temporal validity

#### Team/Service Structure
- **DimTeam**: Service delivery teams
  - Links to: CompanyID, ContractID, AreaID
  - Specializations: IsEmploymentTeam, IsFosterCarerTeam
  - Capacity tracking available

#### Employment Services
- **FactEmploymentPlan**: Employment support plans
  - Multi-phase support: Planning, JobSearch, PlacementSupport
  - Duration and activity hours tracking
- **FactEmploymentPlanTask**: Detailed task tracking
- **FactPersonJob**: Employment history

#### Health & Wellbeing
- **FactPersonHealthCondition**: Physical/mental health conditions
- **FactPersonStatus**: Client status changes over time
- **FactIncident**: Critical incident tracking

#### Status & Temporal Tracking
- Most entities have status history tables (FactReferralStatus, FactPersonStatus)
- CreatedDate/CreatedUserID pattern throughout for audit trails
- Start/End date patterns for temporal validity

## Predictive Analytics Opportunities

### 1. Service Usage Predictions

#### Activity Volume Forecasting
- **Predict**: Future activity volumes by team/service type
- **Key Tables**: FactActivity, DimTeam, DimActivityType
- **Features**:
  - Historical activity counts by team/month
  - Seasonal patterns (day of week, month, quarter)
  - Team capacity vs actual usage
  - Activity duration trends
- **Use Cases**: Resource planning, staff scheduling

#### Service Intensity Prediction
- **Predict**: Hours of service needed per client
- **Key Tables**: FactActivity, FactActivityParticipant, DimPerson
- **Features**:
  - Client demographics (age, gender, ethnicity)
  - Previous service usage patterns
  - Health condition complexity
  - Employment status
- **Use Cases**: Funding allocation, case load management

#### Referral Volume Forecasting
- **Predict**: Expected referrals by service/month
- **Key Tables**: FactReferral, DimReferrer, DimTeam
- **Features**:
  - Historical referral patterns
  - Referrer organization trends
  - Seasonal variations
  - Service capacity indicators

### 2. Region-Based Predictions

#### Geographic Demand Modeling
- **Predict**: Service demand by region/area
- **Key Tables**: DimRegion, DimArea, FactAddress, FactReferral
- **Features**:
  - Population demographics by area
  - Current client density
  - Historical growth rates
  - Socioeconomic indicators
- **Use Cases**: Service expansion planning, resource allocation

#### Regional Service Effectiveness
- **Predict**: Outcome success rates by region
- **Key Tables**: FactReferral, FactReferralStatus, DimArea
- **Features**:
  - Regional completion rates
  - Average time in service
  - Incident rates by area
  - Team performance metrics

#### Travel & Accessibility Patterns
- **Predict**: Service accessibility needs
- **Key Tables**: FactActivity (TravelDistance), FactAddress
- **Features**:
  - Travel distances for activities
  - Client location clustering
  - Transport availability (PrimaryTransportID)

### 3. Client-Based Predictions

#### Client Journey Prediction
- **Predict**: Likely progression through service stages
- **Key Tables**: FactReferralStatus, DimPerson, FactPersonStatus
- **Features**:
  - Demographics
  - Initial presenting issues
  - Previous service history
  - Health conditions
- **Use Cases**: Personalized care planning

#### Risk & Incident Prediction
- **Predict**: Likelihood of critical incidents
- **Key Tables**: FactIncident, FactPersonRisk, DimPerson
- **Features**:
  - Previous incident history
  - Risk assessment scores
  - Mental health conditions
  - Service engagement levels
- **Use Cases**: Preventive interventions

#### Employment Success Prediction
- **Predict**: Job placement likelihood and sustainability
- **Key Tables**: FactEmploymentPlan, FactPersonJob, DimPerson
- **Features**:
  - Education level
  - Previous employment history
  - Plan phase durations
  - Activity participation rates
- **Use Cases**: Employment support optimization

#### Service Dropout Risk
- **Predict**: Risk of early service exit
- **Key Tables**: FactReferralStatus, FactActivity, FactActivityParticipant
- **Features**:
  - Attendance patterns
  - Engagement frequency
  - Time since last contact
  - Support network indicators

#### Length of Stay Prediction
- **Predict**: Expected duration in service
- **Key Tables**: FactReferral, FactReferralStatus, DimPerson
- **Features**:
  - Service type
  - Client complexity factors
  - Historical average durations
  - Team capacity

## Implementation Details

### Solution Architecture

#### 1. Data Preparation Layer (Views)
Create base views that aggregate historical data with predictive features:
- **vw_PA_ClientServiceHistory**: Aggregated service usage per client
- **vw_PA_TeamActivityMetrics**: Team performance and capacity metrics
- **vw_PA_RegionalDemographics**: Regional client distribution and trends
- **vw_PA_TimeSeriesActivity**: Time-series data for trend analysis

#### 2. Feature Engineering Layer (Views/Functions)
Build features for predictions:
- **vw_PA_ClientFeatures**: Demographics, health conditions, service history
- **vw_PA_TemporalFeatures**: Seasonal patterns, time-based features
- **vw_PA_ServiceUtilization**: Usage patterns, frequency, intensity
- **fn_PA_CalculateMovingAverages**: Moving averages for trend analysis

#### 3. Predictive Model Layer (Stored Procedures)
SQL-based predictive analytics:
- **sp_PA_PredictServiceDemand**: Forecast future service demand
- **sp_PA_PredictClientRisk**: Risk scoring for incidents/dropout
- **sp_PA_PredictLengthOfStay**: Estimate service duration
- **sp_PA_PredictEmploymentOutcome**: Employment success likelihood

#### 4. Reporting Layer (Views for Power BI)
Optimized views for Power BI consumption:
- **vw_PA_ServiceDemandForecast**: Monthly/quarterly demand forecasts
- **vw_PA_ClientRiskScores**: Current risk scores for all active clients
- **vw_PA_RegionalPredictions**: Geographic predictions and trends
- **vw_PA_CapacityPlanning**: Team capacity vs predicted demand

### Implementation Approach

#### Phase 1: Historical Analysis Views
1. Create base aggregation views
2. Calculate historical averages and trends
3. Identify seasonal patterns

#### Phase 2: Feature Engineering
1. Build client profile features
2. Create time-series features
3. Calculate service intensity metrics

#### Phase 3: Predictive Models
1. Implement linear regression for trend forecasting
2. Create risk scoring algorithms
3. Build classification models for outcomes

#### Phase 4: Power BI Integration
1. Create optimized views for reporting
2. Add date dimension for time intelligence
3. Include confidence intervals

### Key Design Patterns

#### Time Series Forecasting
```sql
-- Moving average calculation
AVG(MetricValue) OVER (
  ORDER BY DateColumn 
  ROWS BETWEEN 11 PRECEDING AND CURRENT ROW
) AS MovingAvg12Month
```

#### Risk Scoring
```sql
-- Weighted risk score calculation
(CASE WHEN IncidentCount > 0 THEN 0.3 ELSE 0 END) +
(CASE WHEN DaysSinceLastContact > 30 THEN 0.2 ELSE 0 END) +
(CASE WHEN AttendanceRate < 0.5 THEN 0.2 ELSE 0 END) AS RiskScore
```

#### Cohort Analysis
```sql
-- Group clients by intake period
DATEPART(YEAR, ReferralReceivedDate) AS CohortYear,
DATEPART(QUARTER, ReferralReceivedDate) AS CohortQuarter
```

## Next Steps

### Immediate Actions
1. Create initial data preparation views
2. Implement service demand forecasting view
3. Build client risk scoring view
4. Test with sample data

### Future Enhancements
1. Add machine learning integration capabilities
2. Implement real-time scoring triggers
3. Create automated alerting for high-risk cases
4. Build comparative analytics across regions/teams
5. Add predictive model accuracy tracking

### Performance Considerations
- Use indexed views for frequently accessed aggregations
- Partition large fact tables by date
- Create columnstore indexes for analytical queries
- Consider data marts for complex predictions

### Data Quality Requirements
- Ensure consistent date formats
- Handle NULL values appropriately
- Validate referential integrity
- Monitor for data anomalies

### Success Metrics
- Prediction accuracy > 75%
- Query performance < 5 seconds
- Monthly model retraining
- User adoption rate tracking

## Implementation Summary

### Phase 1: Basic Predictive Analytics (Completed)

#### Views Created (5 Total)
1. **vw_PA_ServiceDemandForecast.sql** - Forecasts service demand with seasonal adjustments and capacity metrics
2. **vw_PA_ClientRiskScores.sql** - Calculates comprehensive risk scores for active clients
3. **vw_PA_RegionalPredictions.sql** - Regional analytics with growth predictions and resource prioritization
4. **vw_PA_CapacityPlanning.sql** - Compares current capacity with predicted demand
5. Additional views to be created based on specific needs

#### Stored Procedures Created (1 Total)
1. **sp_PA_PredictEmploymentOutcome.sql** - Predicts employment success likelihood with detailed features

### Phase 2: Advanced Time Series Modeling (Completed)

#### Time Series Views Created (6 Total)

1. **vw_TS_DataPreparation.sql** - Comprehensive time series data preparation
   - Complete date sequence generation to handle gaps
   - Lag features (1, 7, 14, 28, 365 days)
   - Moving averages (7, 28, 90 days)
   - Cyclical encoding for seasonality (sin/cos transformations)
   - Z-score calculation for anomaly detection
   - Time-based features (day of week, month, quarter, holiday indicators)

2. **vw_TS_SeasonalDecomposition.sql** - STL-like seasonal decomposition
   - Trend extraction using centered moving averages
   - Linear and polynomial trend fitting
   - Seasonal component calculation (additive and multiplicative)
   - Residual analysis
   - Component strength metrics
   - Model R-squared and quality metrics

3. **vw_TS_ExponentialSmoothing.sql** - Complete exponential smoothing suite
   - Simple Exponential Smoothing (multiple alpha values)
   - Double Exponential Smoothing (Holt's method)
   - Triple Exponential Smoothing (Holt-Winters)
   - Damped trend methods
   - Adaptive smoothing with optimal alpha selection
   - 95% confidence intervals
   - Model selection recommendations

4. **vw_TS_ARIMAComponents.sql** - ARIMA analysis components
   - Multiple orders of differencing (first, second, seasonal)
   - Autocorrelation function (ACF) calculations
   - Stationarity testing
   - Log and square root transformations
   - ARIMA parameter suggestions (p, d, q)
   - AR, MA, and ARMA forecasts
   - Heteroskedasticity detection

5. **vw_TS_ForecastAccuracy.sql** - Comprehensive accuracy metrics
   - Mean Absolute Error (MAE)
   - Root Mean Squared Error (RMSE)
   - Mean Absolute Percentage Error (MAPE)
   - Mean Absolute Scaled Error (MASE)
   - Directional accuracy
   - Theil's U statistic
   - Model ranking and selection
   - Performance trend detection

6. **vw_TS_EnsembleForecasting.sql** - Advanced ensemble methods
   - Simple average ensemble
   - Weighted average (accuracy-based weights)
   - Median ensemble (robust to outliers)
   - Trimmed mean
   - Bayesian model averaging
   - Optimal combination
   - Confidence intervals for ensemble
   - Model agreement scoring

### Key Features Implemented

#### 1. Service Demand Forecasting
- Historical trend analysis with moving averages
- Seasonal pattern detection and adjustment
- Team capacity utilization tracking
- Confidence intervals for predictions

#### 2. Client Risk Assessment
- Multi-factor risk scoring (0-100 scale)
- Engagement, incident, health, and support metrics
- Risk categorization (Critical/High/Medium/Low)
- Automated intervention recommendations

#### 3. Regional Analytics
- Geographic demand modeling
- Service effectiveness by region
- Resource priority scoring
- Growth trend predictions

#### 4. Employment Outcome Prediction
- Success probability calculation
- Expected time to placement
- Job retention probability
- Personalized intervention recommendations

#### 5. Capacity Planning
- Current vs predicted utilization
- Waitlist management metrics
- Staff workload analysis
- Capacity gap identification

### Technical Highlights

1. **SQL-Based Predictive Models**: Pure SQL implementation for easy maintenance and deployment
2. **Power BI Ready**: All views optimized for Power BI consumption with appropriate aggregations
3. **Temporal Analysis**: Extensive use of window functions for time-series analysis
4. **Scalable Design**: CTEs and indexed views for performance optimization
5. **Comprehensive Metrics**: Over 50 calculated metrics across all views

### Usage Instructions

#### For Power BI Developers
1. Connect to the database using appropriate credentials
2. Import views from the `pbi` schema (vw_PA_*)
3. Create relationships based on TeamID, PersonID, AreaID
4. Use date columns for time intelligence features
5. Apply row-level security based on TeamID if needed

#### For Database Administrators
1. Deploy views to the `pbi` schema
2. Create appropriate indexes on base tables
3. Schedule stored procedure execution as needed
4. Monitor query performance and optimize as necessary
5. Consider creating materialized views for heavy queries

#### For Business Analysts
1. Use ServiceDemandForecast for resource planning
2. Monitor ClientRiskScores daily for intervention needs
3. Review RegionalPredictions for expansion planning
4. Track EmploymentOutcome predictions for program effectiveness
5. Use CapacityPlanning for staffing decisions

### Validation & Testing

Before production deployment:
1. Test all views with sample data
2. Validate predictions against historical outcomes
3. Ensure query performance meets requirements
4. Verify Power BI integration works correctly
5. Document any data quality issues found

### Maintenance Requirements

1. **Monthly**: Review prediction accuracy and adjust algorithms
2. **Quarterly**: Update seasonal factors and growth trends
3. **Annually**: Comprehensive model evaluation and updates
4. **Ongoing**: Monitor for data quality issues and anomalies

### Expected Benefits

1. **Improved Resource Allocation**: 20-30% better capacity utilization
2. **Proactive Risk Management**: Early identification of at-risk clients
3. **Better Service Planning**: Data-driven expansion decisions
4. **Enhanced Outcomes**: Targeted interventions based on predictions
5. **Operational Efficiency**: Reduced manual analysis time by 50%

### Contact & Support

For questions or issues with the predictive analytics implementation:
- Review this documentation first
- Check data quality in source tables
- Verify view permissions and access
- Test with smaller date ranges if performance issues occur

## Time Series Modeling Methodology

### Mathematical Foundations

#### 1. Exponential Smoothing Methods

**Simple Exponential Smoothing (SES)**
```
S_t = α * Y_t + (1 - α) * S_(t-1)
where α ∈ [0,1] is the smoothing parameter
```

**Holt's Linear Method (Double Exponential)**
```
Level: L_t = α * Y_t + (1 - α) * (L_(t-1) + T_(t-1))
Trend: T_t = β * (L_t - L_(t-1)) + (1 - β) * T_(t-1)
Forecast: F_(t+h) = L_t + h * T_t
```

**Holt-Winters (Triple Exponential)**
```
Level: L_t = α * (Y_t / S_(t-s)) + (1 - α) * (L_(t-1) + T_(t-1))
Trend: T_t = β * (L_t - L_(t-1)) + (1 - β) * T_(t-1)
Seasonal: S_t = γ * (Y_t / L_t) + (1 - γ) * S_(t-s)
Forecast: F_(t+h) = (L_t + h * T_t) * S_(t-s+h)
```

#### 2. ARIMA Components

**Autoregressive (AR) Model**
```
Y_t = c + φ₁*Y_(t-1) + φ₂*Y_(t-2) + ... + φₚ*Y_(t-p) + ε_t
```

**Moving Average (MA) Model**
```
Y_t = c + ε_t + θ₁*ε_(t-1) + θ₂*ε_(t-2) + ... + θₑ*ε_(t-q)
```

**Integrated (I) - Differencing**
```
First difference: ΔY_t = Y_t - Y_(t-1)
Second difference: Δ²Y_t = ΔY_t - ΔY_(t-1)
```

#### 3. Seasonal Decomposition

**Additive Model**
```
Y_t = Trend_t + Seasonal_t + Residual_t
```

**Multiplicative Model**
```
Y_t = Trend_t × Seasonal_t × Residual_t
```

### SQL Implementation Techniques

#### Window Functions for Time Series
```sql
-- Moving averages
AVG(value) OVER (ORDER BY date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)

-- Lag/Lead operations
LAG(value, 1) OVER (ORDER BY date)

-- Cumulative calculations
SUM(value) OVER (ORDER BY date ROWS UNBOUNDED PRECEDING)
```

#### Recursive Calculations (Approximated)
```sql
-- Exponential smoothing approximation
AVG(value * POWER(0.7, ROW_NUMBER() OVER (ORDER BY date DESC) - 1))
```

### Model Selection Guidelines

#### When to Use Each Model

**Simple Exponential Smoothing**
- No trend or seasonality
- Short-term forecasts
- Stable data patterns

**Holt's Method**
- Linear trend present
- No seasonality
- Medium-term forecasts

**Holt-Winters**
- Both trend and seasonality
- Regular seasonal patterns
- Long-term forecasts

**ARIMA**
- Complex autocorrelation patterns
- Non-seasonal or seasonal with irregular patterns
- Statistical significance required

**Ensemble Methods**
- High uncertainty
- Multiple patterns present
- Critical business decisions

### Accuracy Metrics Interpretation

| Metric | Excellent | Good | Acceptable | Poor |
|--------|-----------|------|------------|------|
| MAPE | < 10% | 10-20% | 20-30% | > 30% |
| MASE | < 0.5 | 0.5-1.0 | 1.0-1.5 | > 1.5 |
| Direction | > 70% | 60-70% | 50-60% | < 50% |

### Power BI Integration Guide

#### Connecting Time Series Views

1. **Data Model Setup**
```
- Import all vw_TS_* views
- Create date table relationship with DateValue/ForecastDate
- Set TeamID as filter context
```

2. **Visualization Recommendations**
- Line charts for trends with confidence bands
- Decomposition charts (trend + seasonal + residual)
- Forecast accuracy heatmaps
- Model comparison dashboards

3. **DAX Measures for Enhancement**
```dax
Forecast Accuracy = 
  1 - DIVIDE(
    SUM('Accuracy'[MAE]), 
    AVERAGE('Data'[Actual])
  )

Confidence Band Width = 
  'Forecast'[Upper95] - 'Forecast'[Lower95]
```

### Performance Optimization

#### Indexing Strategy
```sql
-- Key indexes for time series views
CREATE INDEX IX_Date_Team ON FactActivity(ActivityStartDate, TeamID)
CREATE INDEX IX_Referral_Date ON FactReferral(ReferralReceivedDate, TeamID)
CREATE COLUMNSTORE INDEX CS_TimeSeries ON FactActivity
```

#### Query Optimization Tips
- Limit date ranges in WHERE clauses
- Use CTEs for complex calculations
- Consider materialized views for heavy queries
- Partition tables by date for large datasets

### Troubleshooting Guide

#### Common Issues and Solutions

**Issue: Forecasts showing extreme values**
- Check for outliers in historical data
- Verify seasonal indices are normalized
- Use damped trend methods

**Issue: Poor model accuracy**
- Increase historical data period
- Check for structural breaks in data
- Try ensemble methods

**Issue: Slow query performance**
- Add appropriate indexes
- Reduce date range
- Consider pre-aggregation

### Future Enhancements Roadmap

#### Phase 3: Machine Learning Integration
- External ML model scoring via SQL CLR
- Python/R integration for advanced models
- Real-time streaming predictions

#### Phase 4: Advanced Features
- Multivariate time series
- Hierarchical forecasting
- Causal impact analysis
- Anomaly detection algorithms

### Best Practices

1. **Data Quality**
   - Handle missing values appropriately
   - Remove or adjust outliers
   - Ensure consistent time intervals

2. **Model Validation**
   - Use holdout validation
   - Track accuracy over time
   - Compare multiple models

3. **Business Context**
   - Consider domain knowledge
   - Adjust for known events
   - Validate with stakeholders

4. **Documentation**
   - Document model assumptions
   - Track parameter changes
   - Maintain change log

---

*Document Last Updated: 2025-08-08*
*Version: 2.0*
*Status: Phase 2 Time Series Implementation Complete*