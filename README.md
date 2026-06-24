**Bank Marketing Campaign: Credit Card Cross-Sell (SQL Project)**

Hi! Welcome to my SQL portfolio project.

I am currently learning Data Analytics, and I wanted to work on a dataset that felt like a real business problem. For this project, I analyzed a dataset of over 245,000 customer records from a bank's marketing campaign. My goal was to use SQL to figure out what made the campaign successful, where the bank wasted money, and how they could improve their targeting for the next round.

SQL Skills Practiced: Data Cleaning (creating virtual VIEWs and using COALESCE), Conditional Logic (CASE WHEN), Grouping (GROUP BY), and basic math to calculate conversion percentages.

# What's in this repository?
credit_card_cross_sell_campaign.sql: This file contains all the SQL queries I wrote to clean the data, explore the campaign results, and build a basic customer targeting model.

# Here is what I found:

**1. What was the baseline success rate?**

The Finding: Before looking at specific groups, I needed a baseline to compare them to.

The Data: Out of 245,725 customers targeted, the overall conversion rate was 23.72%. I used this number as my benchmark for the rest of the project.

**2. Which communication channels worked best?**

The Finding: The bank used different, anonymized channels (X1, X2, X3, etc.). The data showed a huge difference in how well they worked.

The Data: Channel X3 performed the best with a 36.70% conversion rate. Channel X1—the bank targeted over 103,000 people here, but it only had a 9.14% success rate.

**3. Which professions are actually interested in a new card?**

The Finding: Business owners are much more open to credit products than standard employees.

The Data: Entrepreneurs converted at a very high rate (66.07%), and Self-Employed individuals provided the most raw leads with a 27.60% rate. On the other hand, Salaried workers fell way below the campaign average at only 15.97%.

**4. How does existing credit history affect a customer's choice?**

The Finding: I noticed about 29,000 rows had blank values for existing credit products. I decided to use COALESCE to categorize them as 'Unknown'.

The Data: The data showed that this 'Unknown' group actually had an 85.17% conversion rate. People who already had a credit product ('Yes') converted at 31.50%, and those with 'No' converted at only 7.36%.

**5. How can the bank prioritize its next marketing budget?**

The Finding: I used a CASE WHEN statement to create a basic Lead Scoring Model that ranks customers from P1 (Best) to P4 (Worst).

The Data: * P1: Ultimate Target (Entrepreneur + Self Employed): 84.10% success rate.

P2: High Priority (Already have credit + Reached via good channels like X2/X3): 38.59% success rate.

P3: Standard Target (Average customers): 17.64% success rate.

P4: Do Not Target (No credit + Salaried): 6.46% success rate. (The bank should probably stop spending marketing money on this group).

Note: This is a personal learning project to showcase my SQL problem-solving skills. Feel free to check out my code.
