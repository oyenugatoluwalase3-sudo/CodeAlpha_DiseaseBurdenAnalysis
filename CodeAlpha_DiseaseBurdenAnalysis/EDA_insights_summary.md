# EDA Insights Summary

* **Project:** Global Disease Burden & Tuberculosis Analysis
* **Datasets:** Global Burden of Disease (1970–2010) | TB Burden by Country (1990–2013)
* **Tools:** SQL Server (T-SQL), Power BI Desktop
* **Author:** Oyenuga Toluwalase Elijah

---

## Section 1 — Global Burden of Disease

* **The first week of life may be the most dangerous window in the entire human lifespan.** The 0–6 days age group recorded an average death rate of 93,315 per 100,000 — by far the highest of any age group in the dataset. To put that in perspective, that is over 1,100 times higher than the 10–14 years age group, which sits at just 80 per 100,000. After infancy, death rates drop to their lowest point during childhood and then climb gradually and predictably through adulthood into old age. The extreme spike in the first week may help explain why grouping ages into broader buckets is necessary to make the visual readable.

* **Global death rates have been falling steadily for four decades.** The average death rate per 100,000 population dropped from 1,190 in 1970 down to 799 in 2010 — a 33% reduction over 40 years. The decline was fairly consistent decade by decade, though it slowed between 1990 and 2000 before picking up again. This broad improvement may reflect better access to healthcare, vaccines, and disease management across much of the world during this period.

* **India and China account for a large share of global deaths, but Nigeria’s position is worth noting.** India recorded 47 million total deaths across the study period and China 39 million, which is partly expected given their population sizes. Nigeria appearing at 6th place in the rankings could indicate that mortality burden may be influenced by factors beyond population size alone — not just a large country, but one that also carried a high death rate relative to its size.

* **Men died at higher rates than women across all age groups and all years.** The average death rate was 8,046 per 100,000 for males versus 6,087 for females — a gap that held consistently across the full 40-year period. The difference was widest in the Under 5 and 65+ age buckets. In the Under 5 group specifically, males averaged 32,000 per 100,000 compared to 24,000 for females, which may suggest that male infants face higher biological vulnerability in early life.

* **Teenagers appear to be the safest demographic in the entire dataset.** Children between 10 and 14 years old averaged just 80 deaths per 100,000, and 15–19 year olds sat at roughly 140. This is the lowest mortality window in the human lifespan across all countries and all years in the dataset. After this point, death rates climb steadily and do not reverse.

* **The dataset only captures five points in time, which limits the depth of trend analysis.** The GBD data records 1970, 1980, 1990, 2000, and 2010 — one snapshot per decade. This means the line chart shows broad directional movement rather than year-by-year changes. Any sharp event that happened within a decade, such as a disease outbreak or a conflict, would not be visible in this data.

---

## Section 2 — Data Quality Observations

* **Empty cells in the raw data became fake zeros during import.** When the data was loaded and column types were converted from text to numbers, blank cells automatically became 0 instead of NULL. This is a problem because a genuine zero and a missing value are two very different things. Leaving fake zeros in place would pull down averages and make it look like some countries had zero TB burden or zero case detection, which would not be accurate. These were identified by checking whether the confidence interval columns were also zero — a real zero would have matching bounds, while a fake zero would not.

* **94 TB incidence rows and 1,942 HIV mortality rows were false zeros that needed correction.** The scale of the false zero problem was significant, particularly in the HIV mortality columns. After correction, only 35 rows of genuine zero HIV-TB mortality remained — these belonged to countries where the data confirmed the figure was truly negligible. The rest were missing data that had been masking itself as actual measurements.

* **One column in the TB dataset contains no data at all across all 5,120 rows.** The `Method_to_derive_TBHIV_estimates` column was part of the original WHO dataset structure but was never populated. It cannot contribute to any analysis and exists purely as a structural placeholder.

* **About 9% of case detection rate entries are missing, mostly in earlier years.** 469 rows have no case detection rate recorded. These gaps are concentrated in the early 1990s and in smaller territories where health reporting systems were less developed. This means for those countries in those years, there is no way to evaluate how effectively TB cases were being found and reported.

* **Zero duplicate records exist across either dataset.** The validation check confirmed that every combination of country, year, age group, and sex appears exactly once in the GBD table, and every country-year pair appears exactly once in the TB table. This means all totals and averages computed from these datasets are free from accidental double-counting.

---

## Section 3 — Tuberculosis Burden

* **Africa may be generating more new TB infections, while South-East Asia carries a larger accumulated burden.** Africa (AFR) leads on incidence — new cases per year — at an average of 308 per 100,000. But South-East Asia (SEA) leads on prevalence — total people currently living with TB — at an average of 408 per 100,000. These two metrics seem to be telling different stories. Africa is producing more new infections annually, while South-East Asia has a larger pile-up of ongoing cases that have not yet been resolved. Both are serious but they may point to different intervention needs.

* **TB burden has been declining globally but the progress is slow.** Average TB prevalence dropped from 227 per 100,000 in 1990 to 141 in 2013 — a meaningful reduction over 23 years, but still a long way from elimination. The decline was not consistent across regions either. Africa’s incidence actually rose through the 1990s before starting to fall, while South-East Asia showed a more consistent downward trend throughout the period.

* **Europe detects the most TB cases; Africa detects the least.** The average case detection rate is 79% in EUR versus just 51% in AFR. A lower detection rate could mean that a large share of TB cases are going undiagnosed and untreated, which keeps transmission going and may inflate actual prevalence beyond what official incidence figures capture. Africa’s combination of high incidence and low detection could indicate a compounding challenge.

* **HIV co-infection appears to make Africa’s TB situation uniquely severe compared to every other region.** In Africa, 44.71% of all TB deaths were in people who were also HIV-positive — the highest share of any region by a significant margin. In South-East Asia and the Western Pacific, over 92–97% of TB deaths were non-HIV cases. This is not just a numbers difference — it may suggest that Africa needs a response strategy that addresses both diseases together rather than separately.

* **Namibia recorded the highest average TB incidence of any country across the full study period.** With 994 new cases per 100,000 in 2013, Namibia topped the list, followed by Lesotho at 878 and Swaziland at 836. All three are small southern African countries where HIV rates are among the highest in the world, which may be directly driving TB co-infection and making cases harder to treat.

* **Cambodia stands out as the most extreme outlier in the prevalence-versus-mortality scatter.** Cambodia averaged 1,360 TB cases per 100,000 population — the highest prevalence of any country in the dataset — paired with an average mortality of 140 per 100,000. This combination may indicate that TB remained widespread for a long period and that treatment efforts were not sufficient to reduce the burden quickly. The Central African Republic shows a different pattern: a lower prevalence of 1,108 per 100,000 but the highest mortality rate in the dataset at 169 per 100,000, which could suggest that even when cases were fewer, treatment outcomes there were particularly poor.

---

## Section 4 — Cross-Dataset Observations

* **The two datasets can only be directly compared for three years: 1990, 2000, and 2010.** The GBD data runs from 1970 to 2010 in 10-year intervals while the TB data covers 1990 to 2013 annually. The only overlap points are 1990, 2000, and 2010. Any analysis that tries to connect overall mortality burden with TB-specific burden is limited to these three bridge years.

* **186 countries appear in both datasets, which makes cross-analysis geographically broad enough to be useful.** Even though the time overlap is narrow, having 186 shared countries means comparisons between overall death burden and TB burden can be made across a genuinely global sample. One thing that stands out from the cross-join is that countries with the highest absolute GBD death counts — India and China — are not the same as the countries with the highest TB rates per capita. High absolute deaths tend to reflect population size, while high TB rates per capita seem to point to a concentrated disease burden that hits smaller, resource-limited countries hardest.
