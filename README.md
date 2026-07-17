# News Sentiment and Currency Crises: Turkey and Argentina (2018)

Does news sentiment shift before a currency crisis hits? This project compares media sentiment around the August 2018 Turkish lira crisis and the May 2018 Argentine peso crisis.

Final project for *Text Analysis and Spatial Data for Economists*, MSc Economics, USI Lugano.

## Data

- Exchange rates (USD/TRY, USD/ARS, 2013–2024) from Yahoo Finance via `yfinance`
- News headlines around each crisis window from the GDELT 2.0 DOC API
- Headline-level sentiment labels produced by an LLM classifier

## Method

1. Download daily FX rates and identify crisis dates from the largest daily depreciations.
2. Query GDELT for English-language news on each country in the weeks around the crisis.
3. Classify each headline as positive / negative / neutral toward the economy or currency using Gemini with structured (JSON schema) outputs.
4. Compare the share of negative coverage before vs. after each crisis date.

## Repository structure

```
Isgandarli_Nihad_analysis.ipynb   analysis notebook
Isgandarli_Nihad_report.pdf       written report
data/capital_flows/               USD/TRY and USD/ARS daily rates
data/news/                        raw headlines and sentiment labels
```

## Reproducing

Install dependencies with `pip install -r requirements.txt` and set a `GOOGLE_API_KEY` environment variable for the sentiment classification step. All intermediate outputs (`sentiment_results.csv`) are included, so the analysis can be re-run without API access.

## Author

Nihad Isgandarli — MSc Economics, USI Lugano
