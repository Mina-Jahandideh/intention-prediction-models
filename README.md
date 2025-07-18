
> ⚠️ The dataset `data3.sav` contains sensitive health-related information and is **not included** in this repository.

---

## 🎯 Objective

To explore and predict ordinal outcomes (intention-related survey items) using:
- `cforest()` from the `party` package (classification forest)
- `ordfor()` from the `ordinalForest` package (ordinal forest)
- Performance comparison via:
  - Confusion Matrix
  - AUC (using `pROC`)
  - Variable importance metrics (Breiman method)

---

## 📊 Dataset

- Source: Cardiac rehabilitation dataset (`.sav` SPSS format)
- Structure: Includes 120+ predictor variables and multiple ordinal outcome variables (`intention items`)
- Preprocessing:
  - Conversion of key variables to `factor` or `ordered factor`
  - Partitioning into training/testing sets using `caret::createDataPartition`

---

## 🔁 Modeling Workflow

1. **Data Import & Cleaning**
   - Read `.sav` using `haven::read_sav`
   - Select relevant columns based on intention item
   - Convert variables to appropriate factor types

2. **Train/Test Split**
   - 70% training, 30% testing via stratified partitioning

3. **Model Fitting**
   - `cforest()` (with `cforest_unbiased()` controls)
   - `ordfor()` with various `perffunction` options

4. **Evaluation**
   - Confusion matrix via `caret::confusionMatrix`
   - AUC via `pROC::multiclass.roc`
   - Variable importance via `varimp()`

5. **Repeat for each sub-item of Intention**
   - Each script includes `# To change` tags for customizable intention item selection

---

## 🧠 Notes

- Use `OOB = TRUE` in `predict()` to avoid prediction errors for `cforest`.
- Code includes placeholder comments like `#### To change` where the user should specify the target intention item (e.g., `q28aI`, `q28bI`, etc.).
- Scripts are modular and can be adapted for other ordinal outcomes.

---

## 🧪 Required R Packages

```r
library(haven)
library(caret)
library(party)
library(e1071)
library(pROC)
library(ordinalForest)

📬 Contact
Author: Mina Jahandideh
Email: mn.jahandideh@gmail.com
GitHub: @Mina-Jahandideh

📄 License
This code is shared under the MIT License. Please give appropriate credit if used in academic or applied work.

