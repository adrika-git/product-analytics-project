# Product Analytics: User Behaviour & Conversion Funnel Analysis

## Project objective
Analyze how visitors move through an e-commerce product journey, identify funnel drop-offs, compare conversion across devices and acquisition sources, and propose evidence-based product improvements.

## Dataset and transparency
`data/events.csv` is a **synthetic, simulated event-level dataset generated for this portfolio exercise**. It is not real Google Analytics data, Google company data, or actual customer behaviour. The structure is inspired by common GA4-style event exports.

Each row represents one event. Funnel metrics must count distinct `session_id` values at each stage to avoid overcounting.

## Funnel
`session_start -> view_item -> add_to_cart -> begin_checkout -> purchase`

## Tools
- Excel: inspect the CSV, validate rows, columns, blanks, and duplicates.
- SQL: calculate event/user/session counts, funnel stages, device/source conversion, product revenue, daily trends.
- Python: optional data-quality checks and exploratory analysis.
- Power BI: import `events.csv`, create KPI cards, funnel, device/source comparisons, revenue visuals.

## Business questions
1. At which stage do sessions drop out most?
2. Does session conversion differ by device?
3. Which traffic sources have the strongest conversion?
4. Which products contribute the most recorded revenue?
5. How do sessions and revenue change over time?

## Important metric definitions
- Session conversion rate = purchase sessions / total sessions * 100.
- Stage reach rate = sessions reaching a stage / total sessions * 100.
- Step conversion = sessions reaching next stage / sessions reaching previous stage * 100.
- Revenue = sum of `revenue` on purchase events.

## Limitations
The dataset is simulated and its patterns are designed for practice. Findings describe this generated dataset only; they must not be generalized to real customers or a real company. This project demonstrates an analytics workflow, not a validated production experiment.

## Folder structure
- `data/events.csv`: raw event data
- `sql/product_analytics_queries.sql`: analysis queries
- `docs/data_dictionary.csv`: field definitions
