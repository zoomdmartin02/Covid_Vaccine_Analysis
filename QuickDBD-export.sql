-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "INCIDENT" (
    "VAERS_ID" int   NOT NULL,
    "VAX_MANU" varchar   NOT NULL,
    "VAX_DOSE_SERIES" varchar   NOT NULL,
    "AGE_YRS" float   NOT NULL,
    "SEX" varchar   NOT NULL,
    "DIED" int   NOT NULL,
    "HOSPITAL" varchar   NOT NULL,
    "OTHER_MEDS" varchar   NOT NULL,
    "CUR_ILL" varchar   NOT NULL,
    "HISTORY" varchar   NOT NULL,
    "ALLERGIES" varchar   NOT NULL,
    CONSTRAINT "pk_INCIDENT" PRIMARY KEY (
        "VAERS_ID"
     )
);

CREATE TABLE "SYMPTOMS" (
    "NUMERIC_KEY" int   NOT NULL,
    "VAERS_ID" int   NOT NULL,
    "SYMPTOM1" varchar   NOT NULL,
    "SYMPTOMVERSION1" float   NOT NULL,
    "SYMPTOM2" varchar   NOT NULL,
    "SYMPTOMVERSION2" float   NOT NULL,
    "SYMPTOM3" varchar   NOT NULL,
    "SYMPTOMVERSION3" float   NOT NULL,
    "SYMPTOM4" varchar   NOT NULL,
    "SYMPTOMVERSION4" float   NOT NULL,
    "SYMPTOM5" varchar   NOT NULL,
    "SYMPTOMVERSION5" float   NOT NULL,
    CONSTRAINT "pk_SYMPTOMS" PRIMARY KEY (
        "NUMERIC_KEY"
     )
);

ALTER TABLE "INCIDENT" ADD CONSTRAINT "fk_INCIDENT_VAERS_ID" FOREIGN KEY("VAERS_ID")
REFERENCES "SYMPTOMS" ("VAERS_ID");

